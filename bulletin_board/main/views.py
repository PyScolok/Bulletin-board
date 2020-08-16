from django.shortcuts import render, get_object_or_404, redirect
from django.contrib import messages
from django.contrib.auth import logout
from django.contrib.auth.views import LoginView, LogoutView, PasswordChangeView, PasswordResetView, PasswordResetConfirmView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required
from django.views.generic.edit import UpdateView, CreateView, DeleteView
from django.views.generic.base import TemplateView
from django.contrib.messages.views import SuccessMessageMixin
from django.urls import reverse_lazy
from django.core.signing import BadSignature
from django.utils.http import urlsafe_base64_encode
from django.contrib.auth.tokens import default_token_generator
from django.utils.encoding import force_bytes
from django.core.paginator import Paginator
from django.db.models import Q

from .models import AdvancedUser, Ad, SubRubric
from .forms import ChangeUserInfoForm, RegisterUserForm, SearchAdsForm, AdForm, AIFormSet
from .utilities import signer


class ChangeUserInfoView(SuccessMessageMixin, LoginRequiredMixin, UpdateView):
    """Правка личных данных пользователя"""

    model = AdvancedUser
    template_name = 'main/change_user_info.html'
    form_class = ChangeUserInfoForm
    success_url = reverse_lazy('main:profile')
    success_message = 'Личные данные пользователя изменены.'

    def dispatch(self, request, *args, **kwargs):
        """Извлечение и сохранение id пользователя"""
        self.user_id = request.user.pk
        return super().dispatch(request, *args, **kwargs)

    def get_object(self, queryset=None):
        """Поиск пользователя"""
        if not queryset:
            queryset = self.get_queryset()
        return get_object_or_404(queryset, pk=self.user_id)


class ChangeUserPasswordView(PasswordChangeView):
    """Cмена пароля пользвателя"""

    template_name = 'main/change_password.html'
    success_url = reverse_lazy('main:password_change_done')


class ResetUserPasswordView(PasswordResetView):
    """Иницация сброса пароля"""

    template_name = 'main/reset_password.html'
    success_url = reverse_lazy('main:password_reset_done')
    subject_template_name = 'email/password_reset_subject.txt'
    email_template_name = 'email/password_reset_email.txt'
    extra_email_context = {
        'protocol': 'http',
        'domain': '127.0.0.1:8000',
    }


class UserPasswordResetConfirmView(PasswordResetConfirmView):
    """Сброс пароля"""
    
    template_name = 'main/confirm_password.html'
    success_url = reverse_lazy('main:password_reset_complete')


class BBLoginView(LoginView):
    """Страница входа"""

    template_name = 'main/login.html'


class BBLogoutView(LoginRequiredMixin, LogoutView):
    """Страница выхода"""

    template_name = 'main/logout.html'


class RegisterUserView(CreateView):
    """Страница регистрации пользователя"""

    model = AdvancedUser
    template_name = 'main/register_user.html'
    form_class = RegisterUserForm
    success_url = reverse_lazy('main:register_done')


class DeleteUserView(DeleteView):
    """Страница уаления пользователя"""

    model = AdvancedUser
    template_name = 'main/delete_user.html'
    success_url = reverse_lazy('main:index')

    def dispatch(self, request, *args, **kwargs):
        """Извлечение и сохранение id пользователя"""
        self.user_id = request.user.pk
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        """Выход пользвателя подлежащего удалению"""
        logout(request)
        messages.add_message(request, messages.SUCCESS, 'Пользователь удалён')
        return super().post(self, request, *args, **kwargs)

    def get_object(self, queryset=None):
        """Поиск удаляемого пользователя"""
        if not queryset:
            queryset = self.get_queryset()
        return get_object_or_404(queryset, pk=self.user_id)


class RegisterDoneView(TemplateView):
    """Страница успешной регистрации"""

    template_name = 'main/register_done.html'


def index(request):
    """Главная страница"""
    ads = Ad.objects.filter(is_active=True)[:10]
    context = {'ads': ads}
    return render(request, 'main/index.html', context)

@login_required
def profile(request):
    """Страница профиля"""
    ads = Ad.objects.filter(author=request.user.pk)
    context = {'ads': ads}
    return render(request, 'main/profile.html', context)

@login_required
def profile_ad_detail(request, pk):
    """Детальное описание объявления пользователя"""
    ad = get_object_or_404(Ad, pk=pk)
    additional_images = ad.additionalimage_set.all()
    context = {
        'ad': ad,
        'ais': additional_images
    }
    return render(request, 'main/profile_ad_detail.html', context)

@login_required
def profile_ad_add(request):
    """Добавление объявления"""
    if request.method == 'POST':
        form =AdForm(request.POST, request.FILES)
        if form.is_valid():
            ad = form.save()
            formset = AIFormSet(request.POST, request.FILES, instance=ad)
            if formset.is_valid():
                formset.save()
                messages.add_message(request, messages.SUCCESS, 'Объявление добавлено')
                return redirect('main:profile')
    else:
        form = AdForm(initial={'author': request.user.pk})
        formset = AIFormSet()
    context = {'form': form, 'formset': formset}
    return render(request, 'main/profile_ad_add.html', context)

@login_required
def profile_ad_change(request, pk):
    """Изменение объявления"""
    ad = get_object_or_404(Ad, pk=pk)
    if request.method == 'POST':
        form = AdForm(request.POST, request.FILES, instance=ad)
        if form.is_valid:
            ad = form.save()
            formset = AIFormSet(request.POST, request.FILES, instance=ad)
            if formset.is_valid:
                formset.save()
            messages.add_message(request, messages.SUCCESS, 'Объявление измененено')
            return redirect('main:profile')
    else:
        form = AdForm(instance=ad)
        formset = AIFormSet(instance=ad)
    context = {'form': form, 'formset': formset}
    return render(request, 'main/profile_ad_change.html', context)

@login_required
def profile_ad_delete(request, pk):
    """Удаление объявления"""
    ad = get_object_or_404(Ad, pk=pk)
    if request.method == "POST":
        ad.delete()
        messages.add_message(request, messages.SUCCESS, 'Объявление удалено')
        return redirect('main:profile')
    else:
        context = {'ad': ad}
        return render(request, 'main/profile_ad_delete.html', context)

def user_activate(request, sign):
    """Страницы с результатом активации"""
    try:
        username = signer.unsign(sign)
    except BadSignature:
        return render(request, 'main/bad_signature.html')
    user = get_object_or_404(AdvancedUser, username=username)
    if user.is_activated:
        template = 'main/user_is_activated.html'
    else:
        template = 'main/activation_done.html'
        user.is_active = True
        user.is_activated = True
        user.save()
    return render(request, template)

def by_rubric(request, pk):
    """Список объявлений"""
    rubric = get_object_or_404(SubRubric, pk=pk)
    ads = Ad.objects.filter(is_active=True, rubric=pk)
    if 'keyword' in request.GET:
        keyword = request.GET['keyword']
        q = Q(title__icontains=keyword) | Q(description__icontains=keyword)
        ads = ads.filter(q)
    else:
        keyword = ''
    form = SearchAdsForm(initial={'keyword':keyword})
    paginator = Paginator(ads, 2)
    if 'page' in request.GET:
        page_num = request.GET['page']
    else:
        page_num = 1
    page = paginator.get_page(page_num)
    context = {
        'rubric': rubric, 'page': page,
        'ads': page.object_list, 'form': form
    }
    return render(request, 'main/by_rubric.html', context)

def detail(request, rubric_pk, pk):
    """Детальное описание объявления"""
    ad = get_object_or_404(Ad, pk=pk)
    additional_images = ad.additionalimage_set.all()
    context = {
        'ad': ad,
        'ais': additional_images
    }
    return render(request, 'main/detail.html', context)


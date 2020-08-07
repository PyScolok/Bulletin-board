from django.shortcuts import render, get_object_or_404
from django.contrib import messages
from django.contrib.auth import logout
from django.contrib.auth.views import LoginView, LogoutView, PasswordChangeView, PasswordChangeDoneView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required
from django.views.generic.edit import UpdateView, CreateView, DeleteView
from django.views.generic.base import TemplateView
from django.contrib.messages.views import SuccessMessageMixin
from django.urls import reverse_lazy
from django.core.signing import BadSignature

from .models import AdvancedUser
from .forms import ChangeUserInfoForm, RegisterUserForm
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


class ChangePasswordDoneView(PasswordChangeDoneView):
    """Страница успешной смены пароля"""

    template_name = 'main/password_change_done.html'


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
    return render(request, 'main/index.html')

def profile(request):
    """Страница профиля"""
    return render(request, 'main/profile.html')

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
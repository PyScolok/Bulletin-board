from django.shortcuts import render, get_object_or_404
from django.contrib.auth.views import LoginView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required
from django.views.generic.edit import UpdateView, CreateView
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
        """Извлечение исправленной записи"""
        if not queryset:
            queryset = self.get_queryset()
        return get_object_or_404(queryset, pk=self.user_id)


class BBLoginView(LoginView):
    """Страница входа"""

    template_name = 'main/login.html'


class BBLogoutView(LoginRequiredMixin, LoginView):
    """Страница выхода"""

    template_name = 'main/logout.html'


class RegisterUserView(CreateView):
    """Страница регистрации пользователя"""

    model = AdvancedUser
    template_name = 'main/register_user.html'
    form_class = RegisterUserForm
    success_url = reverse_lazy('main:register_done')


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
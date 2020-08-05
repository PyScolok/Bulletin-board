from django.shortcuts import render, get_object_or_404
from django.contrib.auth.views import LoginView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required
from django.views.generic.edit import UpdateView
from django.contrib.messages.views import SuccessMessageMixin
from django.urls import reverse_lazy

from .models import AdvancedUser
from .forms import ChangeUserInfoForm


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


def index(request):
    """Главная страница"""
    return render(request, 'main/index.html')

def profile(request):
    """Страница профиля"""
    return render(request, 'main/profile.html')
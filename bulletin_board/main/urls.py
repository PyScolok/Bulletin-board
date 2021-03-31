from django.urls import path
from django.contrib.auth.views import PasswordChangeDoneView, PasswordResetDoneView, PasswordResetCompleteView

from . import views

app_name = 'main'
urlpatterns = [
    path('accounts/login/', views.BBLoginView.as_view(), name='login'),
    path('accounts/logout/', views.BBLogoutView.as_view(), name='logout'),
    path('accounts/profile/change/<int:pk>/', views.profile_ad_change, name='profile_ad_change'),
    path('accounts/profile/delete/<int:pk>', views.profile_ad_delete, name='profile_ad_delete'),
    path('accounts/profile/add/', views.profile_ad_add, name='profile_ad_add'),
    path('accounts/profile/<int:pk>/', views.profile_ad_detail, name='profile_ad_detail'),
    path('accounts/profile/', views.profile, name='profile'),
    path('accounts/profile/change/', views.ChangeUserInfoView.as_view(), name='profile_change'),
    path('accounts/profile/password_change/', views.ChangeUserPasswordView.as_view(), name='password_change'),
    path('accounts/profile/password_change/done/',
         PasswordChangeDoneView.as_view(template_name='main/password_change_done.html'), name='password_change_done'),
    path('accounts/profile/delete/', views.DeleteUserView.as_view(), name='profile_delete'),
    path('accounts/password_reset/', views.ResetUserPasswordView.as_view(), name='reset_password'),
    path('accounts/password_reset/done/', PasswordResetDoneView.as_view(template_name='main/password_reset_done.html'),
         name='password_reset_done'),
    path('accounts/password_reset/<uidb64>/<token>/', views.UserPasswordResetConfirmView.as_view(),
         name='password_reset_confirm'),
    path('accounts/pasword_reset/complete/',
         PasswordResetCompleteView.as_view(template_name='main/password_confirmed.html'),
         name='password_reset_complete'),
    path('accounts/register/', views.RegisterUserView.as_view(), name='register'),
    path('accounts/register/done/', views.RegisterDoneView.as_view(), name='register_done'),
    path('accounts/register/activate/<str:sign>/', views.user_activate, name='register_activate'),
    path('', views.index, name='index'),
    path('<int:rubric_pk>/<int:pk>/', views.detail, name='detail'),
    path('<int:pk>/', views.by_rubric, name='by_rubric'),
]

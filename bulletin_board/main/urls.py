from django.urls import path

from . import views

app_name = 'main'
urlpatterns = [
    path('accounts/login/', views.BBLoginView.as_view(), name='login'),
    path('accounts/profile/', views.profile, name='profile'),
    path('accounts/profile/change/', views.ChangeUserInfoView.as_view(), name='profile_change'),
    path('accounts/logout/', views.BBLogoutView.as_view(), name='logout'),
    path('', views.index, name='index'),
]
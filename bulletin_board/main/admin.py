import datetime

from django.contrib import admin

from .models import AdvancedUser
from .utilities import send_activasion_notification


def send_activasion_notifications(modeladmin, request, queryset):
    """Рассылка пользователям писем с предписаниеми выполнить активацию"""
    for user in queryset:
        if not user.is_activated:
            send_activasion_notification(user)
    modeladmin.message_user(request, 'Письма с оповещениями отправлены')

send_activasion_notifications.short_description = 'Отправка писем с оповещениями об активации'


class NonactivatedFilter(admin.SimpleListFilter):
    """Фильтрация пользователей по дате их активации"""

    title ='Прошли активацию?'
    parameter_name = 'actstate'

    def lookups(self, request, model_admin):
        return (
            ('activated', 'Прошли'),
            ('thredays', 'Не прошли более 3-ех дней'),
            ('week', 'Не прошли более недели'),
        )

    def queryset(self, request, queryset):
        val = self.value()
        if val == 'activated':
            return queryset.filter(is_active=True, is_activated=True)
        elif val == 'threedays':
            register_date = datetime.date.today() - datetime.timedelta(days=3)
            return queryset.filter(is_active=False, is_activated=False, date_joined_date_lt=register_date)
        elif val == 'week':
            register_date = datetime.date.today() - datetime.timedelta(weeks=1)
            return queryset.filter(is_active=False, is_activated=False, date_joined_date_lt=register_date)
        

class AdvancedUserAdmin(admin.ModelAdmin):
    list_display =  ('__str__', 'is_activated', 'date_joined')
    search_fields = ('username', 'email', 'first_name', 'last_name')
    list_filter = (NonactivatedFilter, )
    fields = (
        ('username', 'email'),
        ('first_name', 'last_name'),
        ('is_staff', 'is_superuser'),
        'groups',
        'user_permissions',
        ('last_login', 'date_joined')
    )
    readonly_fields = ('last_login', 'date_joined')
    actions = (send_activasion_notifications, )

admin.site.register(AdvancedUser, AdvancedUserAdmin)

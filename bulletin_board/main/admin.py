import datetime

from django.contrib import admin

from .models import AdvancedUser, SubRubric, SuperRubric, Ad, AdditionalImage, Comment
from .utilities import send_activation_notification
from .forms import SubRubricForm


def send_activation_notifications(model_admin, request, queryset):
    """Рассылка пользователям писем с предписаниеми выполнить активацию"""
    for user in queryset:
        if not user.is_activated:
            send_activation_notification(user)
    model_admin.message_user(request, 'Письма с оповещениями отправлены')


send_activation_notifications.short_description = 'Отправка писем с оповещениями об активации'


class ActivatedFilter(admin.SimpleListFilter):
    """Фильтрация пользователей по дате их активации"""

    title = 'Прошли активацию?'
    parameter_name = 'act_state'

    def lookups(self, request, model_admin):
        return (
            ('activated', 'Прошли'),
            ('three_days', 'Не прошли более 3-ех дней'),
            ('week', 'Не прошли более недели'),
        )

    def queryset(self, request, queryset):
        val = self.value()
        if val == 'activated':
            return queryset.filter(is_active=True, is_activated=True)
        elif val == 'three_days':
            register_date = datetime.date.today() - datetime.timedelta(days=3)
            return queryset.filter(is_active=False, is_activated=False, date_joined_date_lt=register_date)
        elif val == 'week':
            register_date = datetime.date.today() - datetime.timedelta(weeks=1)
            return queryset.filter(is_active=False, is_activated=False, date_joined_date_lt=register_date)
        

class AdvancedUserAdmin(admin.ModelAdmin):
    """Пользователи"""

    list_display = ('__str__', 'is_activated', 'date_joined')
    search_fields = ('username', 'email', 'first_name', 'last_name')
    list_filter = (ActivatedFilter, )
    fields = (
        ('username', 'email'),
        ('first_name', 'last_name'),
        ('is_staff', 'is_superuser'),
        'groups',
        'user_permissions',
        ('last_login', 'date_joined')
    )
    readonly_fields = ('last_login', 'date_joined')
    actions = (send_activation_notifications, )


class SubRubricInline(admin.TabularInline):
    """Редактор подрубрик"""

    model = SubRubric


class SuperRubricAdmin(admin.ModelAdmin):
    """Надрубрики"""

    exclude = ('super_rubric', )
    inlines = (SubRubricInline, )


class SubRubricAdmin(admin.ModelAdmin):
    """Подрубрики"""

    form = SubRubricForm


class AdditionalImageInline(admin.TabularInline):
    """Редактор дополнительных изображений"""

    model = AdditionalImage


class AdAdmin(admin.ModelAdmin):
    """Объявления"""

    list_display = ('rubric', 'title', 'description', 'author', 'created_at')
    fields = (('rubric', 'author'), 'title', 'description', 'price', 'contacts', 'image', 'is_active')
    inlines = (AdditionalImageInline, )


class CommentAdmin(admin.ModelAdmin):
    """Комментарии"""

    model = Comment
    list_display = ('author', 'text', 'created_at')
    search_fields = ('author', )
    list_filter = ('created_at', 'is_active')


admin.site.register(AdvancedUser, AdvancedUserAdmin)
admin.site.register(SuperRubric, SuperRubricAdmin)
admin.site.register(SubRubric, SubRubricAdmin)
admin.site.register(Ad, AdAdmin)
admin.site.register(Comment, CommentAdmin)

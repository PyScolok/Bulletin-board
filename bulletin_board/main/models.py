from django.db import models
from django.contrib.auth.models import AbstractUser
from django.dispatch import Signal

from .utilities import send_activasion_notification


user_registrated = Signal(providing_args=['instance'])

def user_registrated_dispatcher(sender, **kwargs):
    send_activasion_notification(kwargs['instance'])

user_registrated.connect(user_registrated_dispatcher)


class AdvancedUser(AbstractUser):
    """Модель пользователя с дополнительными настройками"""
    
    is_activated = models.BooleanField(default=True, db_index=True, verbose_name='Активирован?')
    send_messages = models.BooleanField(default=True, verbose_name='Уведомлять о новых комментариях?')

    def get_full_name(self):
        return f'{self.first_name}  {self.last_name}'

    class Meta(AbstractUser.Meta):
        pass


class Rubric(models.Model):
    """Базовая модель рубрик"""

    name = models.CharField(max_length=20, db_index=True, unique=True, verbose_name='Название')
    order = models.SmallIntegerField(default=0, db_index=True, verbose_name='Порядок')
    super_rubric = models.ForeignKey('SuperRubric', on_delete=models.PROTECT, null=True, blank=True, verbose_name='Надрубрика')


class SuperRubricManager(models.Manager):
    """Диспетчер записей модели SuperRubric"""

    def get_queryset(self):
        return super().get_queryset().filter(super_rubric__isnull=True)


class SuperRubric(Rubric):
    """Модель надрубрик"""

    objects = SuperRubricManager()

    def __str__(self):
        return self.name
    
    class Meta:
        proxy = True
        ordering = ('order', 'name')
        verbose_name = 'Надрубрика'
        verbose_name_plural = 'Надрубрики'


class SubRubricManager(models.Manager):
    """Диспетчер записей модели SubRubric"""

    def get_queryset(self):
        return super().get_queryset().filter(super_rubric__isnull=False)


class SubRubric(Rubric):
    """Модель подрубрик"""

    objects = SubRubricManager()

    def __str__(self):
        return '%s - %s' % (self.super_rubric.name, self.name)
    
    class Meta:
        proxy = True
        ordering = ('super_rubric__order', 'super_rubric__name', 'order', 'name')
        verbose_name = 'Подрубрика'
        verbose_name_plural = 'Подрубрики'

    
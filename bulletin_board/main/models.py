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

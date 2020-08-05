from django.db import models
from django.contrib.auth.models import AbstractUser


class AdvancedUser(AbstractUser):
    """Модель пользователя с дополнительными настройками"""
    
    is_activated = models.BooleanField(default=True, db_index=True, verbose_name='Активирован?')
    send_messages = models.BooleanField(default=True, verbose_name='Уведомлять о новых комментариях?')

    def get_full_name(self):
        return f'{self.first_name}  {self.last_name}'

    class Meta(AbstractUser.Meta):
        pass

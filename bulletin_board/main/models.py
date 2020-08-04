from django.db import models
from django.contrib.auth.models import AbstractUser


class AdvancedUser(AbstractUser):
    is_activated = models.BooleanField(default=True, db_index=True, verbose_name='Активирован?')
    send_messages = models.BooleanField(default=True, verbose_name='Уведомлять о новых комментариях?')

    class Meta(AbstractUser.Meta):
        pass

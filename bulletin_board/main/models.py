from django.db import models
from django.db.models.signals import post_save
from django.contrib.auth.models import AbstractUser
from django.dispatch import Signal

from .utilities import send_activation_notification, get_timestamp_path, send_new_comment_notification


def user_registered_dispatcher(**kwargs):
    send_activation_notification(kwargs['instance'])


def post_save_dispatcher(**kwargs):
    author = kwargs['instance'].ad.author
    if kwargs['created'] and author.send_messages:
        send_new_comment_notification(kwargs['instance'])


class AdvancedUser(AbstractUser):
    """Модель пользователя с дополнительными настройками"""

    is_activated = models.BooleanField(default=True, db_index=True, verbose_name='Активирован?')
    send_messages = models.BooleanField(default=True, verbose_name='Уведомлять о новых комментариях?')

    def get_full_name(self):
        """Формирование полного имени"""
        return f'{self.first_name}  {self.last_name}'

    def delete(self, *args, **kwargs):
        """Удаление обхявлений связанных с пользователем"""
        for ad in self.ad_set.all():
            ad.delete()
        super().delete(*args, **kwargs)

    class Meta(AbstractUser.Meta):
        pass


class Rubric(models.Model):
    """Базовая модель рубрик"""

    name = models.CharField(max_length=20, db_index=True, unique=True, verbose_name='Название')
    order = models.SmallIntegerField(default=0, db_index=True, verbose_name='Порядок')
    super_rubric = models.ForeignKey('SuperRubric', on_delete=models.PROTECT, null=True, blank=True,
                                     verbose_name='Надрубрика')


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
        return f'{self.super_rubric.name} - {self.name}'

    class Meta:
        proxy = True
        ordering = ('super_rubric__order', 'super_rubric__name', 'order', 'name')
        verbose_name = 'Подрубрика'
        verbose_name_plural = 'Подрубрики'


class Ad(models.Model):
    """Модель объявлений"""

    rubric = models.ForeignKey(SubRubric, on_delete=models.PROTECT, verbose_name='Рубрика')
    title = models.CharField(max_length=40, verbose_name='Название товара')
    description = models.TextField(verbose_name='Описание')
    price = models.FloatField(default=0, verbose_name='Цена')
    contacts = models.TextField(verbose_name='Контакты')
    image = models.ImageField(blank=True, upload_to=get_timestamp_path, verbose_name='Изображение')
    author = models.ForeignKey(AdvancedUser, on_delete=models.CASCADE, verbose_name='Пользователь')
    is_active = models.BooleanField(default=True, verbose_name='Показывать?')
    created_at = models.DateTimeField(auto_now_add=True, db_index=True, verbose_name='Дата публикации')

    def delete(self, *args, **kwargs):
        for image in self.additionalimage_set.all():
            image.delete()
        super().delete(*args, **kwargs)

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Объявление'
        verbose_name_plural = 'Объявлениия'


class AdditionalImage(models.Model):
    """Модель дополнительных изображений"""

    ad = models.ForeignKey(Ad, on_delete=models.CASCADE, verbose_name='Объявление')
    image = models.ImageField(upload_to=get_timestamp_path, verbose_name='Изображение')

    class Meta:
        verbose_name = 'Дополнительное изображение'
        verbose_name_plural = 'Дополнительные изображения'


class Comment(models.Model):
    """Модель комментариев к объявлениям"""

    ad = models.ForeignKey(Ad, on_delete=models.CASCADE, verbose_name='Объявление')
    author = models.CharField(max_length=30, verbose_name='Автор')
    text = models.TextField(verbose_name='Текст')
    is_active = models.BooleanField(default=True, verbose_name='Показывать?')
    created_at = models.DateTimeField(auto_now_add=True, db_index=True, verbose_name='Опубликован')

    def __str__(self):
        return f'Комментарий от {self.author}'

    class Meta:
        verbose_name = 'Комментарий'
        verbose_name_plural = 'Комментарии'
        ordering = ['created_at']


user_registered = Signal(providing_args=['instance'])
user_registered.connect(user_registered_dispatcher)
post_save.connect(post_save_dispatcher, sender=Comment)

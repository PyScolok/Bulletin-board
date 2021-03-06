from django import forms
from django.contrib.auth import password_validation
from django.core.exceptions import ValidationError
from snowpenguin.django.recaptcha3.fields import ReCaptchaField

from .models import AdvancedUser, user_registered, SuperRubric, SubRubric, Ad, AdditionalImage, Comment


class ChangeUserInfoForm(forms.ModelForm):
    """Форма изменения основных личных данных"""

    email = forms.EmailField(required=True, label='Адрес электронной почты')

    class Meta:
        model = AdvancedUser
        fields = ('username', 'email', 'first_name', 'last_name', 'send_messages')


class RegisterUserForm(forms.ModelForm):
    """Форма занесения сведений о новом пользователе при регистрации"""

    email = forms.EmailField(required=True, label='Адрес электронной почты')
    password1 = forms.CharField(label='Пароль', widget=forms.PasswordInput,
                                help_text=password_validation.password_validators_help_text_html())
    password2 = forms.CharField(label='Пароль (повторно)', widget=forms.PasswordInput,
                                help_text='Введите тот же самый пароль еще раз')

    def clean_password(self):
        """Валидация пароля"""
        password1 = self.cleaned_data['password1']
        if password1:
            password_validation.validate_password(password1)
        return password1

    def clean(self):
        """Проверка на совпадение паролей"""
        super().clean()
        password1 = self.cleaned_data['password1']
        password2 = self.cleaned_data['password2']
        if password1 and password2 and password1 != password2:
            errors = {'password2': ValidationError('Введенные пароли не совпадают', code='password_mismatch')}
            raise ValidationError(errors)

    def save(self, commit=True):
        """Сохранение новго пользователя"""
        user = super().save(commit=False)
        user.set_password(self.cleaned_data['password1'])
        user.is_active = False
        user.is_activated = False
        if commit:
            user.save()
        user_registered.send(RegisterUserForm, instance=user)
        return user

    class Meta:
        model = AdvancedUser
        fields = ('username', 'email', 'password1', 'password2', 'first_name', 'last_name', 'send_messages')


class SubRubricForm(forms.ModelForm):
    """Форма выбора подрубрик"""

    queryset = SuperRubric.objects.all()
    super_rubric = forms.ModelChoiceField(queryset=queryset, empty_label=None, required=True, label='Надрубрика')

    class Meta:
        model = SubRubric
        fields = '__all__'


class SearchAdsForm(forms.Form):
    """Форма поиска объявлений по названию"""

    keyword = forms.CharField(required=False, max_length=20, label='')


class AdForm(forms.ModelForm):
    """Форма добавления объявления"""

    class Meta:
        model = Ad
        fields = '__all__'
        widgets = {'author': forms.HiddenInput}


# Нбор форм для добавления дополнительных изображений
AIFormSet = forms.inlineformset_factory(Ad, AdditionalImage, fields="__all__")


class CommentForm(forms.ModelForm):
    """Форма добавления комментариев"""

    captcha = ReCaptchaField()

    class Meta:
        model = Comment
        exclude = ('is_active',)
        widgets = {'ad': forms.HiddenInput}

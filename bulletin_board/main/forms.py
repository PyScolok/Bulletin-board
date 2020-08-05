from django import forms

from .models import AdvancedUser

class ChangeUserInfoForm(forms.ModelForm):
    """Форма изменения основных личных данных"""

    email = forms.EmailField(required=True, label='Адрес электронной почты')

    class Meta:
        model = AdvancedUser
        fields = ('username', 'email', 'first_name', 'last_name', 'send_messages')
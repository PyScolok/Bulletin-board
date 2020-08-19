"""
Django settings for bulletin_board project.

Generated by 'django-admin startproject' using Django 3.0.9.

For more information on this file, see
https://docs.djangoproject.com/en/3.0/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/3.0/ref/settings/
"""

import os

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/3.0/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '+y85%u!6=r@10+bldsz4k8do+z*a&marvxg!%0ok@mn5jof41%'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.sites',
    'django.contrib.flatpages',
    'main.apps.MainConfig',
    'bootstrap4',
    'social_django',
    'django_cleanup',
    'easy_thumbnails',
    'snowpenguin.django.recaptcha3',

]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.contrib.flatpages.middleware.FlatpageFallbackMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'bulletin_board.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'social_django.context_processors.backends',
                'social_django.context_processors.login_redirect',
                'main.middlewares.bb_context_processor',
            ],
        },
    },
]

WSGI_APPLICATION = 'bulletin_board.wsgi.application'

# SMTP settings
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_HOST_USER = 'oskolok2013@gmail.com'
EMAIL_HOST_PASSWORD = 'asdf1gh2jkzxcvb4'
EMAIL_PORT = 587
EMAIL_USE_TLS = True


# Database
# https://docs.djangoproject.com/en/3.0/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'bulletin_board_db',
        'PASSWORD': 'asdf1gh2jkzxcvb3',
        'USER': 'postgres',
        'HOST': '127.0.0.1',
        'PORT': '5432',
    }
}

SOCIAL_AUTH_POSTGRES_JSONBFIELD = True


# Password validation
# https://docs.djangoproject.com/en/3.0/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Authentication settings

AUTHENTICATION_BACKENDS = (
    'social_core.backends.vk.VKOAuth2',
    'django.contrib.auth.backends.ModelBackend',
)

SOCIAL_AUTH_VK_OAUTH2_KEY = '7561685'
SOCIAL_AUTH_VK_OAUTH2_SECRET = 'YOghWRgnh47Z4xljPJXd'
SOCIAL_AUTH_VK_OAUTH2_SCOPE = ['email']
LOGIN_REDIRECT_URL = 'main:profile'

# Internationalization
# https://docs.djangoproject.com/en/3.0/topics/i18n/

LANGUAGE_CODE = 'ru-ru'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True


AUTH_USER_MODEL = 'main.AdvancedUser'

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.0/howto/static-files/

STATIC_URL = '/static/'
STATIC_DIR = os.path.join(BASE_DIR, 'static')
STATICFILES_DIRS = [STATIC_DIR]

MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
MEDIA_URL = '/media/'

THUMBNAIL_ALIASES = {
    '': {
        'default':
        {
            'size': (96, 96),
            'crop': 'scale',
        },
    },
}
THUMBNAIL_BASEDIR = 'thumbnails'

# Recaptcha settings
RECAPTCHA_PRIVATE_KEY = '6LcSdcAZAAAAAFnFGPZCFcy-Tcxjhu6V5Xg0Ftji'
RECAPTCHA_PUBLIC_KEY = '6LcSdcAZAAAAAGhuYSAt0HVEh8oVIhuTAyab61Iz'
RECAPTCHA_DEFAULT_ACTION = 'generic'
RECAPTCHA_SCORE_THRESHOLD = 0.5

SITE_ID = 1

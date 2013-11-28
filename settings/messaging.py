'''
Created on Oct 23, 2013
Messaging and notification settings for envived project.

@author: ''Alex Sorici''
'''
import sys
from path import path

PROJECT_ROOT = path(__file__).abspath().dirname().dirname()
SITE_ROOT = PROJECT_ROOT.dirname()

APPS_ROOT = PROJECT_ROOT / 'apps'
LIBS_ROOT = PROJECT_ROOT / 'libs'

LOCALE_PATHS = (PROJECT_ROOT / 'locale',)

sys.path.insert(0, LIBS_ROOT)
sys.path.insert(0, APPS_ROOT)
sys.path.insert(0, SITE_ROOT)

DEBUG = True
TEMPLATE_DEBUG = DEBUG

ADMINS = (
    # ('Your Name', 'your_email@example.com'),
)

MANAGERS = ADMINS


DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',  # Add 'postgresql_psycopg2', 'postgresql', 'mysql', 'sqlite3' or 'oracle'.
        'NAME': 'envived',                   # Or path to database file if using sqlite3.
        'USER': 'envived',                         # Not used with sqlite3.
        'PASSWORD': 'GroundAce55',                  # Not used with sqlite3.
        'HOST': '',                      # Set to empty string for localhost. Not used with sqlite3.
        'PORT': '',                      # Set to empty string for default. Not used with sqlite3.
    },
}

# Language code for this installation. All choices can be found here:
# http://www.i18nguy.com/unicode/language-identifiers.html
LANGUAGE_CODE = 'en-us'

ROOT_URLCONF = 'envived.urls-messaging'

AUTH_USER_MODEL = 'auth.User'
AUTH_PROFILE_MODULE = 'coresql.UserProfile'

INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.messages',
    
    # Uncomment the next line to enable the admin:
    #'django.contrib.admin',
    # Uncomment the next line to enable admin documentation:
    # 'django.contrib.admindocs',
    
    # The core application of the Envived service
    'messaging',
)

# Make this unique, and don't share it with anybody.
SECRET_KEY = 'bk&0+jr44xik=*wdw-p+o^m4z@l31b9m8)f9yv3qwl#lj*5bwo'

MIDDLEWARE_CLASSES = (
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    #'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
)

AUTHENTICATION_BACKENDS = (
    'client.backends.EmailModelBackend',
    'client.backends.AnonymousProfileBackend',
    'django_facebook.auth_backends.FacebookBackend',
    'django.contrib.auth.backends.ModelBackend',
)


# A sample logging configuration. The only tangible logging
# performed by this configuration is to send an email to
# the site admins on every HTTP 500 error.
# See http://docs.djangoproject.com/en/dev/topics/logging for
# more details on how to customize your logging configuration.
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'mail_admins': {
            'level': 'ERROR',
            'class': 'django.utils.log.AdminEmailHandler'
        }
    },
    'loggers': {
        'django.request': {
            'handlers': ['mail_admins'],
            'level': 'ERROR',
            'propagate': True,
        },
    }
}

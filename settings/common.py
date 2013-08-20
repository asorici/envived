# Common Django settings for envived project.
import sys, os
from path import path

PROJECT_ROOT = path(__file__).abspath().dirname().dirname()
SITE_ROOT = PROJECT_ROOT.dirname()
APPS_ROOT = PROJECT_ROOT / 'apps'
LIBS_ROOT = PROJECT_ROOT / 'libs'
FEATURES_ROOT = APPS_ROOT / 'features'

LOCALE_PATHS = (PROJECT_ROOT / 'locale',)

sys.path.append(SITE_ROOT)
sys.path.append(APPS_ROOT)
sys.path.append(LIBS_ROOT)


DEBUG = True
TEMPLATE_DEBUG = DEBUG

ADMINS = (
    # ('Your Name', 'your_email@example.com'),
)

MANAGERS = ADMINS

# Language code for this installation. All choices can be found here:
# http://www.i18nguy.com/unicode/language-identifiers.html
LANGUAGE_CODE = 'en-us'


ROOT_URLCONF = 'envived.urls'


# Absolute filesystem path to the directory that will hold user-uploaded files.
# Example: "/home/media/media.lawrence.com/media/"
MEDIA_ROOT = PROJECT_ROOT + "/media/"


# URL that handles the media served from MEDIA_ROOT. Make sure to use a
# trailing slash.
# Examples: "http://media.lawrence.com/media/", "http://example.com/media/"
MEDIA_URL = '/media/'


# Absolute path to the directory static files should be collected to.
# Don't put anything in this directory yourself; store your static files
# in apps' "static/" subdirectories and in STATICFILES_DIRS.
# Example: "/home/media/media.lawrence.com/static/"
STATIC_ROOT = PROJECT_ROOT + '/static/'

# URL prefix for static files.
# Example: "http://media.lawrence.com/static/"
STATIC_URL = '/static/'

# URL prefix for admin static files -- CSS, JavaScript and images.
# Make sure to use a trailing slash.
# Examples: "http://foo.com/static/admin/", "/static/admin/".
ADMIN_MEDIA_PREFIX = '/static/admin/'


# List of finder classes that know how to find static files in
# various locations.
STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
#    'django.contrib.staticfiles.finders.DefaultStorageFinder',
)


# List of callables that know how to import templates from various sources.
TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.Loader',
    'django.template.loaders.app_directories.Loader',
#     'django.template.loaders.eggs.Loader',
)


TEMPLATE_CONTEXT_PROCESSORS = (
    "django.contrib.auth.context_processors.auth",
    "django.core.context_processors.debug",
    "django.core.context_processors.i18n",
    "django.core.context_processors.media",
    "django.core.context_processors.static",
    "django.contrib.messages.context_processors.messages",
    "django_facebook.context_processors.facebook",
)


AUTH_PROFILE_MODULE = 'coresql.UserProfile'

INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    
    # Uncomment the next line to enable the admin:
    'django.contrib.admin',
    # Uncomment the next line to enable admin documentation:
    # 'django.contrib.admindocs',
    
    # The core application of the Envived service
    'coresql',

    'tastypie',
    'registration',
    'django_facebook',
    'haystack',
)

# Registering all applications in the features package
for app_dir in FEATURES_ROOT.dirs():
    if app_dir.files('models.py'):
        app_dir_path = app_dir.relpath(start = APPS_ROOT)
        app_module_path = ".".join(app_dir_path.splitall()[1:]) # ignore the first element in the splitall() because it is empty, as per documentation
        INSTALLED_APPS += (app_module_path,)

# Django-Registration configuration variable denoting number of days to wait for account activation
ACCOUNT_ACTIVATION_DAYS = 7

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

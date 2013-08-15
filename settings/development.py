# Local Development Django settings for envived project.
from common import *
from local import *

# Local time zone for this installation. Choices can be found here:
# http://en.wikipedia.org/wiki/List_of_tz_zones_by_name
# although not all choices may be available on all operating systems.
# On Unix systems, a value of None will cause Django to use the same
# timezone as the operating system.
# If running in a Windows environment this must be set to the same as your
# system time zone.
TIME_ZONE = None


SITE_ID = 1

# If you set this to False, Django will make some optimizations so as not
# to load the internationalization machinery.
USE_I18N = True

# If you set this to False, Django will not format dates, numbers and
# calendars according to the current locale
USE_L10N = True


# Additional locations of static files
STATICFILES_DIRS = (
    # Put strings here, like "/home/html/static" or "C:/www/django/static".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
    #"/home/alex/Desktop/aquasoft/testproj/envived/media/",
    PROJECT_ROOT + "/media/", 
)


# Make this unique, and don't share it with anybody.
SECRET_KEY = 'bk&0+jr44xik=*wdw-p+o^m4z@l31b9m8)f9yv3qwl#lj*5bwo'


MIDDLEWARE_CLASSES = (
    'client.middleware.ClientCheckinUrlRedirectMiddleware',
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


TEMPLATE_DIRS = (
    # Put strings here, like "/home/html/django_templates" or "C:/www/django/templates".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
    #"/home/alex/Desktop/aquasoft/testproj/envived/templates",
    PROJECT_ROOT + "/templates",
)


AUTH_PROFILE_MODULE = 'coresql.UserProfile'
CLIENT_LANDING_PAGE_URL = '/envived/'


LOGIN_REDIRECT_URL = '/dashboard/'
LOGIN_URL = "/registration/login/"


FACEBOOK_REGISTRATION_BACKEND = 'registration.backends.default.DefaultBackend'
FACEBOOK_APP_ID = '251555358262576'
FACEBOOK_APP_SECRET = 'b8a93ab6523eb235ac4b2cca1722e20e'

GOOGLE_GCM_API_KEY = 'AIzaSyDQX5liDNh5qR8aeJr_Fe2n3_hQamfT6cI'

#SESSION_COOKIE_AGE = 10800


HAYSTACK_CONNECTIONS = {
    'default': {
        'ENGINE': 'haystack.backends.solr_backend.SolrEngine',
        'URL': 'http://127.0.0.1:8983/solr/envived',
        'INDEX_NAME': 'envived_idx',
    },
}


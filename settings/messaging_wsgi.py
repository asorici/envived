'''
Created on Oct 23, 2013
@author: ''Alex Sorici''
'''


import os
os.environ['DJANGO_SETTINGS_MODULE'] = "settings.messaging"

from django.conf import settings
from django.utils.translation import activate
activate(settings.LANGUAGE_CODE)

# This application object is used by the development server
# as well as any WSGI server configured to use this file.
from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()

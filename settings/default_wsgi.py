'''
Created on Oct 17, 2013

@author: alex
'''

#import sys
#from path import path

# set the required paths
#PROJECT_ROOT = path(__file__).abspath().dirname().dirname()
#sys.path.insert(0, PROJECT_ROOT)

import os
os.environ['DJANGO_SETTINGS_MODULE'] = "settings.development"

from django.conf import settings
from django.utils.translation import activate
activate(settings.LANGUAGE_CODE)

# This application object is used by the development server
# as well as any WSGI server configured to use this file.
from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()


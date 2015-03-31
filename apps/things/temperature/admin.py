from django.contrib import admin
from things.temperature.models import TemperatureThing
    
admin.site.register([TemperatureThing])
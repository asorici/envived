from django.contrib import admin
from things.humidity.models import HumidityThing
    
admin.site.register([HumidityThing])
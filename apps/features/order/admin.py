from django.contrib import admin
from features.order.models import OrderFeature, OrderAnnotation, MenuCategory, MenuItem

admin.site.register([OrderFeature, OrderAnnotation, MenuCategory, MenuItem])
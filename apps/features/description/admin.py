from django.contrib import admin
from features.description.models import DescriptionAnnotation, DescriptionFeature

admin.site.register([DescriptionFeature, DescriptionAnnotation])
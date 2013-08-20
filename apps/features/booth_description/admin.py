from django.contrib import admin
from features.booth_description.models import BoothDescriptionFeature, BoothDescriptionAnnotation, BoothProductVoteAnnotation, BoothProduct
    
admin.site.register([BoothDescriptionFeature, BoothDescriptionAnnotation, BoothProductVoteAnnotation, BoothProduct])
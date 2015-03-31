from django.contrib import admin
from features.program.models import ProgramFeature, ProgramAnnotation, Session, Presentation, Speaker

admin.site.register([ProgramFeature, ProgramAnnotation, Session, Presentation, Speaker])
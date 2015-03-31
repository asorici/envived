'''
Created on May 9, 2014

@author: alex
'''
from django.contrib import admin
from features.conference_role.models import ConferenceRoleFeature, ConferenceRole, ChairRoleCredential

class ChairRoleCredentialAdmin(admin.ModelAdmin):
    def save_model(self, request, obj, form, change):
        obj.set_password(form.cleaned_data['password'])
        obj.save()

admin.site.register([ConferenceRoleFeature, ConferenceRole])
admin.site.register(ChairRoleCredential, ChairRoleCredentialAdmin)
from django.conf.urls import patterns, include, url

urlpatterns = patterns('',
    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),
    
    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
    
    (r'^envived/client/notifications/me/', 'messaging.notification_sender.update_notifications'),
    (r'^envived/client/notifications/unsubscribe/', 'messaging.notification_sender.cancel_notifications'),
)
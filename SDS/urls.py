from django.conf.urls import patterns, include, url
from self_directed_search.views import allQuestions,questionMatch

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'SDS.views.home', name='home'),
    # url(r'^SDS/', include('SDS.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
    url(r'^$',allQuestions),
    url(r'^questionmatch/$',questionMatch)
    
)

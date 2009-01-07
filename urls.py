from django.conf.urls.defaults import *

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Example:
    # (r'^bizdir/', include('bizdir.foo.urls')),

    # Uncomment the next line to enable the admin:
    (r'^admin/(.*)', admin.site.root),
    (r'^category/(?P<slug>.*).html$', 'catalog.views.show_category'),
    (r'^host/(?P<slug>.*).html$', 'catalog.views.show_host'),
    (r'^comment/helpful/(?P<id>.*).html$', 'catalog.views.helpful'),
    (r'^comment/report/(?P<id>.*).html$', 'catalog.views.report'),
    (r'^spyder/$', 'spyder.views.link_page'),
    (r'^$|index.html$', 'main.views.index'),
    (r'^design/(?P<path>.*)$', 'django.views.static.serve', {
        'document_root': '/Users/bjasper/Sites/hosting-choice/design',
        'show_indexes': True}),
    (r'^static/(?P<path>.*)$', 'django.views.static.serve', {
        'document_root': '/Users/bjasper/Sites/hosting-choice/static',
        'show_indexes': True}),

)

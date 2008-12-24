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
    (r'^entry/(?P<slug>.*).html$', 'catalog.views.show_entry'),
    (r'^spyder/$', 'spyder.views.link_page'),
    (r'^$|index.html$', 'main.views.index'),
)

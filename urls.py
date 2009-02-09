from django.conf.urls.defaults import *
from django.contrib import admin

import main.feeds

admin.autodiscover()

feeds = {'latest': main.feeds.LatestEntries}

urlpatterns = patterns('',
    (r'^admin/(.*)', admin.site.root),

    (r'^category/(?P<slug>.*).html$', 'catalog.views.show_category'),
    (r'^host/(?P<slug>.*).html$', 'catalog.views.show_host'),
    (r'^hosts/(?P<slug>.*).html$', 'catalog.views.show_category'),
    (r'^hosts.html$', 'catalog.views.show_categories'),

    (r'^leaderboard.html$', 'catalog.views.leaderboard'),
    (r'^matrix.html$', 'catalog.views.matrix'),
    (r'^visit/(?P<slug>.*).html$', 'catalog.views.visit'),

    (r'^comment/helpful/(?P<id>.*).html$', 'catalog.views.helpful'),
    (r'^comment/report/(?P<id>.*).html$', 'catalog.views.report'),

    (r'^sitemap.html$', 'catalog.views.sitemap'),
    (r'^sitemap.xml$', 'catalog.views.sitemap_xml'),
    
    (r'^blog.html$', 'main.views.show_blog'),
    (r'^faq.html$', 'main.views.show_faq'),
    (r'^article/(?P<slug>.*).html$', 'main.views.show_entry'),
    (r'^articles.html$', 'main.views.show_entries'),

    (r'^test.html$', 'catalog.views.test'),

    (r'^alt_index.html$', 'main.views.alt_index'),
    (r'^$|index.html$', 'main.views.index'),

    (r'^feeds/(?P<url>.*).xml$', 'django.contrib.syndication.views.feed',
        {'feed_dict': feeds}),

    (r'^(?P<slug>(.*)).html', 'main.views.get_page'),
)

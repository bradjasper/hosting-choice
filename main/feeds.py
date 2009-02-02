from django.contrib.syndication.feeds import Feed
from main import models

class LatestEntries(Feed):
    title = "Hosting Choice Blog"
    link = "/latest/"
    description = "The latest web hosting articles and news from the" \
        + "experts at Hosting Choice"
    item_author_link = 'http://hosting-choice.com/'

    def items(self):
        return models.Entry.objects.order_by('-pub_date')[:20]


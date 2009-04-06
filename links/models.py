from django.db import models

class Link(models.Model):

    name = models.CharField(max_length=255)
    url = models.URLField(max_length=100)

    linkback = models.BooleanField(default=True)
    sitewide = models.BooleanField(default=True)

    priority = models.IntegerField(default=0)

    def __unicode__(self):
        return self.url

import datetime
import base64
from django.db import models

class Page(models.Model):
    """Store abitrary pages like About/Privacy/TOS in the database for easy updating"""
    name = models.CharField(max_length=255)
    slug = models.SlugField('Slug', max_length=255, unique=True)
    text = models.TextField()

    def __unicode__(self):
        return "/%s.html - %s" % (self.slug, self.name)



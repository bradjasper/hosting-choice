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

class Email(models.Model):
    """Emails gathered for the newsletter"""

    value = models.EmailField(max_length=255, unique=True)
    ip = models.CharField(max_length=25)
    active = models.BooleanField(default=True)

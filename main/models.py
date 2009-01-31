import datetime
import base64
import re

from django.db import models
from django.contrib.auth import models as auth

def slugify(data):
    """Turn a piece of data into a slug"""

    data = data.lower()
    data = re.sub('\s+', '-', data)
    return re.sub('[^a-z0-9\-]', '', data)

class Common(models.Model):
    """Common base for handling things like saving slugs.
    We don't put fields in here because Django puts those in seperate
    tables (sometimes?)."""

    class Meta:
        abstract = True

    def save(self):
        if hasattr(self, 'slug'):
            if self.slug is None or len(self.slug.strip()) == 0:
                self.slug = slugify(self.name)

        super(Common, self).save()


class Page(Common):
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

    def __unicode__(self):
        return self.value


class Entry(Common):
    """Blog Entry"""

    name = models.CharField(max_length=255)
    user = models.ForeignKey(auth.User)
    slug = models.SlugField(unique=True, default=None, blank=True)
    text = models.TextField()

    pub_date = models.DateTimeField(default=datetime.datetime.now())

    def __unicode__(self):
        return "%s - %s" % (self.name, self.user)


class FAQ(Common):
    """Frequently Asked Question"""

    question = models.CharField(max_length=255)
    answer = models.TextField()

    order = models.IntegerField(default=0)

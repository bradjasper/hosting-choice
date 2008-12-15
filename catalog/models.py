import re
import datetime
from django.db import models
from django.contrib.auth import models as auth
from django.contrib import admin

def slugify(data):
    """Turn a piece of data into a slug"""

    data = data.lower()
    data = re.sub('\s+', '-', data)
    return re.sub('[^a-z0-9\-]', '', data)

class CommonBase(models.Model):
    """Base class for holding meta data like dates and active"""

    created_date  = models.DateTimeField(default=datetime.datetime.now())
    modified_date = models.DateTimeField(default=datetime.datetime.now())
    active        = models.BooleanField(default=1)

    class Meta:
        abstract = True

    def save(self):
        self.modified_date = datetime.datetime.now()
        super(CommonBase, self).save()


class CommonElement(CommonBase):
    name = models.CharField(max_length=255)
    slug = models.SlugField(unique=True, default=None, blank=True)
    description = models.TextField(blank=True)
    tags = models.ManyToManyField('Tag', blank=True)

    def save(self):
        if len(self.slug.strip()) == 0:
            self.slug = slugify(self.name)

        super(CommonElement, self).save()


class Tag(CommonBase):
    name = models.CharField(max_length=255)

    def __unicode__(self):
        return self.name


class Category(CommonElement):
    parent = models.ManyToManyField('self', blank=True)
    order = models.IntegerField(default=0)

    class Meta:
        verbose_name_plural = "Categories"

    def __unicode__(self):
        return self.name


class Entry(CommonElement):
    user = models.ForeignKey(auth.User)
    category = models.ForeignKey(Category)

    url = models.CharField(max_length=255)
    link_back = models.CharField(max_length=255, blank=True)
    hits = models.IntegerField(default=0)

    rating = models.FloatField(blank=True, default=0)
    featured = models.IntegerField(default=0, blank=True)

    notes = models.TextField(blank=True)

    class Meta:
        verbose_name_plural = "Entries"

    def __unicode__(self):
        return self.name



import datetime
from django.db import models
from django.contrib.auth import models as auth
from django.contrib import admin

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


class Tag(CommonBase):
    name = models.CharField(max_length=255)


class Category(CommonBase):
    name = models.CharField(max_length=255)
    slug = models.SlugField(prepopulate_from=('name',))
    description = models.TextField()
    parent = models.ManyToManyField('self', blank=True)
    tags = models.ManyToManyField(Tag)

    def __unicode__(self):
        return self.name


class Entry(CommonBase):
    name = models.CharField(max_length=255)

    user = models.ForeignKey(auth.User)
    category = models.ForeignKey(Category)

    url = models.CharField(max_length=255)
    link_back = models.CharField(max_length=255)
    slug = models.SlugField()

    description = models.TextField()
    hits = models.IntegerField(default=0)
    tags = models.ManyToManyField(Tag)

    def __unicode__(self):
        return self.name

admin.site.register(Tag)
admin.site.register(Category)
admin.site.register(Entry)

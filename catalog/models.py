from __future__ import division

import re
import datetime

from django.db import models
from django.contrib.auth import models as auth

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
        if self.slug is None or len(self.slug.strip()) == 0:
            self.slug = slugify(self.name)

        super(CommonElement, self).save()


class Tag(CommonBase):
    public = models.BooleanField(default=True)
    name = models.CharField(max_length=255)

    def __unicode__(self):
        return self.name


class Category(CommonElement):
    parent = models.ForeignKey('self', null=True, blank=True,
        related_name='children')
    order = models.IntegerField(default=0)

    class Meta:
        verbose_name_plural = "Categories"

    def __unicode__(self):
        return self.name


class Plan(CommonBase):

    space = models.IntegerField()
    bandwidth = models.IntegerField()
    price = models.FloatField()

    cpanel = models.BooleanField(default=False)

    def __unicode__(self):
        return "%sMB - %sMB - $%s" % (self.space, self.bandwidth, self.price)


class Entry(CommonElement):
    user = models.ForeignKey(auth.User)
    category = models.ForeignKey(Category)
    plan = models.ForeignKey(Plan)

    url = models.URLField(max_length=255)
    link_back = models.URLField(max_length=255, blank=True)

    hits = models.IntegerField(default=0)
    featured = models.IntegerField(default=0, blank=True)


    class Meta:
        verbose_name_plural = "Entries"

    def __unicode__(self):
        return self.name

    def rating(self):
        """Return the rating for an entry"""
        comments = Comment.objects.filter(entry=self, active=True)
        ratings = [comment.rating() for comment in comments]

        return sum(ratings) / len(ratings)


class Comment(CommonBase):

    user = models.ForeignKey(auth.User, blank=True, null=True)
    entry = models.ForeignKey('Entry')

    # anonymous comments
    name = models.CharField(max_length=255, blank=True)
    email = models.CharField(max_length=255, blank=True)
    website = models.CharField(max_length=255, blank=True)

    text = models.TextField()

    def __unicode__(self):
        return self.text[0:50]

    def rating(self):
        """Figure out the rating for the overall comment. This averages
        all of the ratingtype's and provides and overall rating"""

        value = 0
        total = 0
        for rating in Rating.objects.filter(comment=self, active=True):
            value += rating.value
            total += rating.type.limit

        return value / total


    def karma(self):
        """Return the karma for the entire comment"""

        karmas = Karma.objects.filter(comment=self)
        return sum(map(lambda x: x.value, karmas))


class Karma(CommonBase):
    comment = models.ForeignKey('Comment')
    ip = models.CharField(max_length=25)
    value = models.IntegerField(default=0)

    class Meta:
        unique_together = ('comment', 'ip',)



class Rating(CommonBase):
    comment = models.ForeignKey('Comment')
    type = models.ForeignKey('RatingType')
    value = models.IntegerField()

    def save(self):
        if self.value > self.type.limit:
            self.value = self.type.limit
        elif self.value < 0:
            self.value = 0

        super(Rating, self).save()


    def __unicode__(self):
        return "%s (%d/%d)" % (self.type, self.value, self.type.limit)

class RatingType(CommonBase):
    name = models.CharField(max_length=255)
    limit = models.IntegerField(default=5)

    def __unicode__(self):
        return self.name
    


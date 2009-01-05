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

class Common(models.Model):
    """Common base for handling things like saving slugs.
    We don't put fields in here because Django puts those in seperate
    tables."""

    class Meta:
        abstract = True

    def save(self):
        if hasattr(self, 'slug'):
            if self.slug is None or len(self.slug.strip()) == 0:
                self.slug = slugify(self.name)

        super(Common, self).save()

class Host(Common):

    user = models.ForeignKey(auth.User)
    category = models.ForeignKey('Category')

    name = models.CharField(max_length=255)
    slug = models.SlugField(unique=True, default=None, blank=True)

    description = models.TextField(blank=True)
    url = models.URLField(max_length=255)

    links_back = models.BooleanField(default=False)
    link_back_required = models.BooleanField(default=False)
    link_back_url = models.URLField(max_length=255, blank=True)

    space = models.IntegerField(default=0, help_text='MB')
    bandwidth = models.IntegerField(default=0, help_text='MB')
    price = models.FloatField(default=0,
        help_text='Per Month (Max 1 year contract)')

    hits = models.IntegerField(default=0)
    featured = models.IntegerField(default=0, blank=True)
    active = models.BooleanField(default=1)

    image = models.ImageField(upload_to='hosts', blank=True)

    featured = models.IntegerField(default=0)

    def __unicode__(self):
        return self.name

    def rating(self):
        """Return the overall rating for a host"""
        comments = Comment.objects.filter(host=self)
        ratings = [comment.rating() for comment in comments]

        return sum(ratings) / len(ratings)

    def ratings(self):
        """Return the overall ratings in each category"""

        ratings = {}
        for comment in Comment.objects.filter(host=self):
            for rating in comment.ratings():

                if rating.type.name not in ratings:
                    ratings[rating.type.name] = {
                        'ratings': [],
                        'max': rating.type.limit}

                ratings[rating.type.name]['ratings'].append(rating.value)

        for rating in ratings:
            tmp = ratings[rating]['ratings']

            ratings[rating] = (sum(tmp) / len(tmp), ratings[rating]['max'])

        return ratings




class Category(Common):

    name = models.CharField(max_length=255)
    slug = models.SlugField(unique=True, default=None, blank=True)

    description = models.TextField(blank=True)

    parent = models.ForeignKey('self', null=True, blank=True,
        related_name='children')
    order = models.IntegerField(default=0)

    class Meta:
        verbose_name_plural = "Categories"

    def __unicode__(self):
        return self.name


class Comment(models.Model):
    """Comment for storing reviews"""

    host = models.ForeignKey('Host')
    text = models.TextField()

    name = models.CharField(max_length=255)
    email = models.EmailField(max_length=255)
    website = models.URLField(max_length=255, blank=True)

    def __unicode__(self):
        return self.text[0:50]

    def rating(self):
        """Figure out the rating for the overall comment. This averages
        all of the ratingtype's and provides and overall rating"""

        value = 0
        total = 0
        for rating in self.ratings():
            value += rating.value
            total += rating.type.limit

        return value / total

    def ratings(self):
        """Return the ratings for a comment"""
        return Rating.objects.filter(comment=self)


    def karma(self):
        """Return the karma for the entire comment"""

        karmas = Karma.objects.filter(comment=self)
        return sum(map(lambda x: x.value, karmas))


class Karma(models.Model):
    comment = models.ForeignKey('Comment')
    ip = models.CharField(max_length=25)
    value = models.IntegerField(default=0)

    class Meta:
        unique_together = ('comment', 'ip',)



class Rating(models.Model):
    comment = models.ForeignKey('Comment')
    type = models.ForeignKey('RatingType')
    value = models.FloatField()

    def save(self):
        if self.value > self.type.limit:
            self.value = self.type.limit
        elif self.value < 0:
            self.value = 0

        super(Rating, self).save()


    def __unicode__(self):
        return "%s (%d/%d)" % (self.type, self.value, self.type.limit)

class RatingType(models.Model):
    name = models.CharField(max_length=255)
    limit = models.IntegerField(default=5)

    def __unicode__(self):
        return self.name
    


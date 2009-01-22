from __future__ import division

import re
import datetime

from django.db import models
from django.contrib import sitemaps
from django.contrib.auth import models as auth
from django.core.cache import cache

import sitemap
import format
import settings


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


class RankTime(models.Model):
    """Stores a rank for a given host at a given time. Used for trending"""

    date = models.DateTimeField(default=datetime.datetime.now())
    host = models.ForeignKey('Host')
    rank = models.IntegerField()


class HostManager(models.Manager):

    # Consider caching this
    def leaderboard(self):
        """Assign a rank to each host based on their rating. Return a list
        sorted in this order with a number (rank) assigned to each."""

        cached = cache.get('leaderboard')
        if cached:
            return cached

        percentages = lambda x,y: cmp(x.percentage(), y.percentage())
        num_comments = lambda x,y: cmp(len(x.comments()), len(y.comments()))

        items = sorted(self.all(), num_comments, reverse=True)
        items = sorted(items, percentages, reverse=True)


        cache.set('leaderboard', items, settings.CACHE_TIMEOUT)

        return items

    def rank_snapshot(self):
        """rank_snapshot() takes a current view of the leaderboard and records
        all of the hosts ranks. This is done so we can archive trending and
        actually have data when we launch"""

        for i, host in enumerate(self.leaderboard()):
            rank_time = RankTime(host=host, rank=i+1)
            rank_time.save()


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

    featured = models.IntegerField(default=0, blank=True)
    active = models.BooleanField(default=1)

    image = models.ImageField(upload_to='hosts', blank=True)

    featured = models.IntegerField(default=0)

    objects = HostManager()

    def get_hits(self):
        return 0
    hits = property(get_hits)

#        return Hits.objects.all()

    def __unicode__(self):
        return self.name

    def features(self):
        """Return a dictionary of features"""

        func = lambda x: (x.type.name, "%s%s%s" % (x.type.prefix, x.value,
            x.type.suffix))
        return dict(map(func, Feature.objects.filter(host=self).order_by('type')))

    def quotes(self):
        """Return a list of quotes for a given host. These segments of comments
        that are highlighted"""

        quotes = Quote.objects.filter(host=self, active=True).order_by('-weight')
        return quotes


    def comments(self):
        """Return a list of comments for this host. This method filters out
        inactive comments and sorts the results by their karma"""

        comments = Comment.objects.filter(host=self, active=True)

        func = lambda x,y: cmp(x.karma(), y.karma())
        return sorted(comments, func, reverse=True)

    def rank(self):
        """Return this hosts rank in the leaderboard"""

        value = cache.get((self.id, 'rank'))
        if value:
            return value

        for i, host in enumerate(Host.objects.leaderboard()):
            if self == host:
                # Increase by 1 for index starting at 0
                value = i+1
                break
        value = 0

        cache.set((self.id, 'rank'), value, 500)

        return value

    def percentage(self):
        """Return the rating as a percentage"""
        return format.smart_round(self.rating(100))

    def get_absolute_url(self):
        return "/host/%s.html" % self.slug

    def ratings_rank(self):
        """Return the rating categories as a rank (percentage)"""

        func = lambda (x,y): (x, format.smart_round(y / 5) * 100)
        return dict(map(func, self.ratings().iteritems()))

    def rating(self, limit = None):
        """Return the normalized rating for a host"""

        if limit is None:
            limit = 5

        rank = self.raw_rating()
        if rank != 0:
            rank = rank * limit 

        return rank

    def ratings(self):
        """Return the normalized rating (5 stars)"""

        final = {}
        for name, rating in self.raw_ratings().iteritems():
            final[name] = (rating[0] / rating[1]) * 5

        return final

    def raw_rating(self):
        """Return the overall rank for a host. This is a percentage."""

        ratings = self.raw_ratings()

        if ratings:
            values = sum([rating[0] for rating in ratings.itervalues()])
            max = sum([rating[1] for rating in ratings.itervalues()])

            return values / max

        return 0

    def raw_ratings(self):
        """Return the raw value/count for each rating category"""

        key = "%s-%s" % ('raw_ratings', self.slug)
        cached = cache.get(key)
        if cached:
            return cached

        comments = [comment.raw_ratings() for comment in \
            Comment.objects.filter(host=self, active=1)]

        final = {}
        for comment in comments:
            for name, rating in comment.iteritems():
                if name in final:
                    final[name][0] += rating[0]
                    final[name][1] += rating[1]
                else:
                    final[name] = [rating[0], rating[1]]

        cache.set(key, final, settings.CACHE_TIMEOUT)

        return final

    
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

    def get_absolute_url(self):
        return "/hosts/%s.html" % self.slug


class Quote(models.Model):
    """Excerpt of a Comment, highlights a hosts' good or bad qualities"""

    host = models.ForeignKey('Host')
    comment = models.ForeignKey('Comment')
    value = models.CharField(max_length=255)
    weight = models.IntegerField(default=0)
    active = models.BooleanField(default=True)


    def __unicode__(self):
        return "(%s) %s" % (self.host, self.value)

class Comment(models.Model):
    """Comment for storing reviews"""

    STATUSES = (
        (-1, 'Reported'),
        (0, 'Disabled'),
        (1, 'Approved'))
    
    host = models.ForeignKey('Host')
    text = models.TextField()
    ip = models.CharField(max_length=25)

    date = models.DateTimeField(default=datetime.datetime.now())

    name = models.CharField(max_length=255)
    email = models.EmailField(max_length=255)
    website = models.URLField(max_length=255, blank=True)

    active = models.IntegerField(default=1, choices=STATUSES)

    class Meta:
        unique_together = ('host', 'name', 'email')

    def __unicode__(self):
        return "%s - %s - %s" % (self.host, self.name, self.text[0:50])

    def set_ratings(self, ratings):
        """Set the ratings given a dictionary: {'Support': 5}"""

        for name, value in ratings.iteritems():
            type = RatingType.objects.get(name=name)
            rating = Rating(type=type, value=value)
            rating.save()

    def rating(self):
        """Figure out an individual comment rating"""

        ratings = self.ratings()
        if ratings:
            return sum(ratings.itervalues()) / len(ratings)
        return 0

    def ratings(self):
        """Figure out the rating for the overall comment. This averages
        all of the ratingtype's and provides and overall rating"""

        return dict([(rating[0], (rating[1][0] / rating[1][1]) * 5) for \
            rating in self.raw_ratings().iteritems()])


    def raw_ratings(self):
        """Return the ratings for a comment"""
        ratings = Rating.objects.filter(comment=self).exclude(value=0).order_by('type')
        return dict([(rating.type.name, (rating.value, rating.type.limit)) for
            rating in ratings])

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

    def __unicode__(self):
        return "%s - %s - %s" % (self.comment, self.ip, self.value)



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
    

class Feature(models.Model):
    host = models.ForeignKey('Host')

    type = models.ForeignKey('FeatureType')
    value = models.CharField(max_length=255)

    def __unicode__(self):
        return "%s (%s)" % (self.type.name, self.value)

class FeatureType(models.Model):
    name = models.CharField(max_length=255)

    prefix = models.CharField(max_length=255, blank=True)
    suffix = models.CharField(max_length=255, blank=True)

    def __unicode__(self):
        return self.name

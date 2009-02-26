from __future__ import division

import re
import datetime
import math
import httplib

from django.db import models
from django.contrib import sitemaps
from django.contrib.auth import models as auth
from django.core.cache import cache

import sitemap
import format
import settings
import places


class Common(models.Model):
    """Common base for handling things like saving slugs.
    We don't put fields in here because Django puts those in seperate
    tables."""

    class Meta:
        abstract = True

    def save(self):
        if hasattr(self, 'slug'):
            if self.slug is None or len(self.slug.strip()) == 0:
                self.slug = format.slugify(self.name)

        super(Common, self).save()

    def cache_get(self, key):
        """Shortcut for getting cache items with a namespace"""
        return cache.get("%d-%s" % (self.id, key))

    def cache_set(self, key, value):
        """Shortcut for setting cache items with a namespace"""

        cache.set("%d-%s" %  (self.id, key), value, settings.CACHE_TIMEOUT)

class CommonManager(models.Manager):

    def cache_get(self, key):
        return cache.get(key)

    def cache_set(self, key, value):
        cache.set(key, value, settings.CACHE_TIMEOUT)

class RankTime(models.Model):
    """Stores a rank for a given host at a given time. Used for trending"""

    date = models.DateTimeField(default=datetime.datetime.now())
    host = models.ForeignKey('Host')
    rank = models.IntegerField()


class HostManager(CommonManager):

    def leaderboard(self):
        """Assign a rank to each host based on their rating. Return a list
        sorted in this order with a number (rank) assigned to each."""

        cached = self.cache_get('leaderboard')
        if cached:
            return cached

        percentages = lambda x,y: cmp(x.percentage(), y.percentage())
        num_comments = lambda x,y: cmp(len(x.comments()), len(y.comments()))

        items = sorted(self.all(), num_comments, reverse=True)
        items = sorted(self.all(), percentages, reverse=True)

        self.cache_set('leaderboard', items)

        return items

    def rank_snapshot(self):
        """rank_snapshot() takes a current view of the leaderboard and records
        all of the hosts ranks. This is done so we can archive trending and
        actually have data when we launch"""

        for i, host in enumerate(self.leaderboard()):
            rank_time = RankTime(host=host, rank=i+1)
            rank_time.save()


class Host(Common):

    user = models.ForeignKey(auth.User, default=1)
    category = models.ForeignKey('Category', default=1)

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
        return Hit.objects.filter(host=self)

    def num_hits(self):
        return len(self.get_hits())

    hits = property(num_hits)


    def __unicode__(self):
        return self.name

    def features(self):
        """Return list of features sorted by priority"""

        cached = self.cache_get('host_features')
        if cached:
            return cached

        items = filter(lambda x: x.type.show > -1 and x.value != "0", Feature.objects.filter(host=self))
        sorted(items, lambda x,y: cmp(x.type.priority, y.type.priority))

        self.cache_set('host_features', items)

        return items

    def feature_groups(self):
        """Return features returned in groups"""

        cached = self.cache_get('feature_groups')
        if cached:
            return cached

        # Grab the unique groups and sort them based on their priority
        items = set(map(lambda x: x.type.group, self.features()))
        items = sorted(items, lambda y,x: cmp(x.priority, y.priority))

        # Loop through each group and grab each feature type, sorting on its
        # priority
        func = lambda x: (x, filter(lambda y: y.type.group == x, self.features()))

        final = map(func, items)

        self.cache_set('feature_groups', final)

        return final

    def features_dict(self):
        """Return a dictionary of features"""

        cached = self.cache_get('features_dict')
        if cached:
            return cached

        items = dict([(feature.type.name, feature.value) for feature in
            self.features()])

        self.cache_set('features_dict', items)

        return items


    def quotes(self):
        """Return a list of quotes for a given host. These segments of comments
        that are highlighted"""

        quotes = Quote.objects.filter(host=self, active=True).order_by('-weight')
        return quotes


    def comments(self):
        """Return a list of comments for this host. This method filters out
        inactive comments and sorts the results by their karma"""

        cached = self.cache_get('comments')
        if cached:
            return cached

        comments = Comment.objects.filter(host=self, active=True)

        func = lambda x,y: cmp(x.karma(), y.karma())
        items = sorted(comments, func, reverse=True)

        self.cache_set('comments', items)

        return items

    def rank(self):
        """Return this hosts rank in the leaderboard"""

        cached = self.cache_get('rank')
        if cached:
            return cached

        for i, host in enumerate(Host.objects.leaderboard()):
            if self == host:
                # Increase by 1 for index starting at 0
                value = i+1
                break
        value = 0

        cache.set('rank', value)

        return value

    def percentage(self):
        """Return the rating as a percentage"""

        cached = self.cache_get('percentage')
        if cached:
            return cached

        percent = format.smart_round(self.rating(100))

        self.cache_set('percentage', percent)

        return percent

    def get_absolute_url(self):
        return "/host/%s.html" % self.slug

    def get_visit_url(self):
        return "/visit/%s.html" % self.slug

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

        cached = self.cache_get('raw_ratings')
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

        self.cache_set('raw_ratings', final)

        return final

    def matrix_info(self):
        """Get this hosts info we use in a matrix"""

        features = self.features()
        ratings = self.ratings()

        space = int(features['Space']) / 20000
        bandwidth = int(features['Bandwidth']) / 90000

        if space == 0:
            space = 1

        if bandwidth == 0:
            bandwidth = 1

        matrix = {
            'price': 5.5 / float(features['Price']),
            'space': space,
            'bandwidth': bandwidth,
            'features': ratings.get('Features', -1) / 5,
            'support': ratings.get('Support', -1) / 5,
            'uptime': ratings.get('Uptime', -1) / 5,
            'percentage': self.percentage() / 100}

        func = lambda (x,y): (x, math.floor((y * 100) / 3) * 3)

        return dict(map(func, matrix.iteritems()))

    def summaries(self, type=None):

        if type is not None:
            return Summary.objects.filter(host=self, type=type)

        return Summary.objects.filter(host=self)


    
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

    def leaderboard(self):
        """Return a leaderboard for this category"""

        cached = self.cache_get('category_leaderboard')
        if cached:
            return cached
        
        items = self.host_set.leaderboard()

        self.cache_set('category_leaderboard', items)

        return items


class Quote(models.Model):
    """Excerpt of a Comment, highlights a hosts' good or bad qualities"""

    host = models.ForeignKey('Host')
    comment = models.ForeignKey('Comment')
    value = models.CharField(max_length=255)
    weight = models.IntegerField(default=0)
    active = models.BooleanField(default=True)


    def __unicode__(self):
        return "(%s) %s" % (self.host, self.value)

class Comment(Common):
    """Comment for storing reviews"""

    STATUSES = (
        (-1, 'Reported'),
        (0, 'Disabled'),
        (1, 'Approved'))
    
    host = models.ForeignKey('Host')
    text = models.TextField()
    ip = models.IPAddressField()

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

        cached = self.cache_get('karma')
        if cached:
            return cached

        karmas = Karma.objects.filter(comment=self)
        karma = sum(map(lambda x: x.value, karmas))

        self.cache_set('karma', karma)

        return karma
        


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

    def get_group(self):
        """Used for grouping features by their featuretype group"""
        return self.type.group
    type_group = property(get_group)


class FeatureGroupManager(models.Manager):

    def groups(self):
        """Return a grouping of features in a dictionary"""

        assert False, 'boom'

class FeatureGroup(models.Model):
    value = models.CharField(max_length=255)
    priority = models.IntegerField(blank=True, default=0)
    show = models.BooleanField(default=False)
    objects = FeatureGroupManager()

    def __unicode__(self):
        return self.value

class FeatureType(Common):
    SHOW_CHOICES = (
        (-1, 'SEO'),
        (0, 'Hide'),
        (2, 'If Valid'),
        (1, 'Always'))

    name = models.CharField(max_length=255)
    group = models.ForeignKey('FeatureGroup', default=9)

    slug = models.SlugField(blank=True)
    title = models.TextField(blank=True)
    description = models.TextField(blank=True)

    is_category = models.BooleanField(default=True)
    priority = models.IntegerField(blank=True, default=0)
    show = models.IntegerField(default=-1, choices=SHOW_CHOICES)

    def __unicode__(self):
        return self.name

    def get_absolute_url(self):
        return "/hosts/%s.html" % self.slug

    def save(self):

        if self.is_category:
            if not self.slug:
                self.slug = format.slugify(self.name)

            if not self.title:
                self.title = "Top %s Hosts - %s Hosting - %s Web Hosting" % (
                    self.name, self.name, self.name)

            if not self.description:
                self.description = """Here are the best <strong>%s Hosting Providers</strong>
                in the World! We've taken user reviews and compiled the
                <strong>best %s hosts</strong> to give you this list of
                <strong>%s hosts</strong>""" % (
                    self.name, self.name, self.name)

        super(FeatureType, self).save()

    def leaderboard(self):
        """Rbturn a leaderboard for this feature type"""

        cached = self.cache_get('feature_leaderboard')
        if cached:
            return cached

        items = Host.objects.leaderboard()

        filter = []
        for item in items:
            features = item.features()
            for feature in features:
                if feature.type == self and feature.value:
                    filter.append(item)


        self.cache_set('feature_leaderboard', filter)

        return filter



class Hit(models.Model):
    ip = models.IPAddressField()
    session = models.CharField(max_length=255)
    host = models.ForeignKey('Host')
    user_agent = models.CharField(max_length=255)

    referrer = models.TextField(blank=True, null=True)
    pub_date = models.DateTimeField(default=datetime.datetime.now)

    note = models.CharField(max_length=255)

    def referrer_domain(self):
        if self.referrer:
            split = httplib.urlsplit(self.referrer)
            return split.netloc
        return ''

'''
class Coupon(models.Model):

    host = models.ForeignKey('Host')

    value = models.CharField(max_length=255)
    text = models.TextField()

    active = models.BooleanField(default=True)

    def __unicode__(self):
        return "%s - %s - %s" % (self.host, self.value, self.text)

class Lead(models.Model):
    """These are leads stored from users that want a host quote"""

    SPACE_CHOICES = (
        (0, "I don't know"),
        (1, "10GB+"),
        (2, "5GB+"),
        (3, "1GB+"),
        (4, "Less than 1GB"))

    BW_CHOICES = (
        (0, "I don't know"),
        (1, "100GB+"),
        (2, "50GB+"),
        (3, "10GB+"),
        (4, "Less than 10GB"))

    PLATFORM_CHOICES = (
        (0, "I don't know"),
        (1, "Linux"),
        (2, "Windows"))

    BUDGET_CHOICES = (
        (0, "I don't know"),
        (1, "$100+"),
        (2, "$50+"),
        (3, "$10+"),
        (4, "Less than $10"))

    name_first = models.CharField(max_length=255)
    name_last = models.CharField(max_length=255)
    email = models.EmailField(max_length=255)
    phone = models.CharField(max_length=255)
    country = models.CharField(max_length=255, choices=places.COUNTRIES)
    
    space = models.IntegerField(default=0, choices=SPACE_CHOICES)
    bandwidth = models.IntegerField(default=0, choices=BW_CHOICES)
    platform = models.IntegerField(default=0, choices=PLATFORM_CHOICES)
    budget = models.IntegerField(default=0, choices=BUDGET_CHOICES)

    note = models.TextField()



'''

class Summary(models.Model):

    TYPE_CHOICES = (
        (0, "Pro"),
        (1, "Con"))

    host = models.ForeignKey('Host')

    type = models.IntegerField(default=0, choices=TYPE_CHOICES)

    text = models.TextField()
    order = models.IntegerField(default=0)

    class Meta:
        verbose_name_plural = 'Summaries'


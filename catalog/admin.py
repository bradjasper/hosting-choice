from django.contrib import admin
import models

class RatingsInline(admin.TabularInline):
    model = models.Rating

class CommentAdmin(admin.ModelAdmin):

    list_display = ('host', 'date', 'name', 'email', 'website', 'active',
    'rating')
    list_filter = ('host', 'active')
    ordering = ('date', 'host', 'name', 'email')
    search_fields = ('host', 'name', 'email', 'website')

    inlines = [
        RatingsInline,
    ]


class FeaturesInline(admin.TabularInline):
    model = models.Feature
    extra = 34

class HostAdmin(admin.ModelAdmin):

    list_display = ('name', 'category', 'links_back', 'link_back_required',
        'hits', 'featured', 'active', 'percentage')
    list_filter = ('links_back', 'link_back_required', 'featured', 'active')
    ordering = ('name', 'category')
    search_fields = ('name', 'category', 'space', 'bandwidth', 'price', 'image')

    inlines = [
        FeaturesInline,
    ]

class KarmaAdmin(admin.ModelAdmin):
    list_display = ('comment', 'ip', 'value')
    list_filter = ('value',)
    ordering = ('comment', 'ip', 'value')
    search_fields = ('comment', 'ip')

class QuoteAdmin(admin.ModelAdmin):

    raw_id_fields = ('comment',)

    list_display = ('host', 'value', 'weight', 'active')
    list_filter = ('weight', 'active')
    ordering = ('host', 'value', 'weight', 'active')
    search_fields = ('host', 'value', 'weight', 'active')

class HitsAdmin(admin.ModelAdmin):

    list_display = ('ip', 'host', 'referrer_domain', 'pub_date', 'note')
    list_filter = ('host',)
    ordering = ('-pub_date', 'host', 'ip', 'referrer')
    search_fields = ('host', 'ip', 'referrer', 'pub_date')

class FeatureTypeAdmin(admin.ModelAdmin):

    list_display = ('name', 'group', 'is_tag')
    list_filter = ('group',)
    ordering = ('name', 'group', 'is_tag')
    search_fields = ('name', 'group', 'title', 'description', 'slug')

admin.site.register(models.Host, HostAdmin)
admin.site.register(models.Category)
admin.site.register(models.Comment, CommentAdmin)
admin.site.register(models.Karma, KarmaAdmin)
admin.site.register(models.Feature)
admin.site.register(models.FeatureGroup)
admin.site.register(models.FeatureType, FeatureTypeAdmin)
admin.site.register(models.Quote, QuoteAdmin)
admin.site.register(models.Hit, HitsAdmin)

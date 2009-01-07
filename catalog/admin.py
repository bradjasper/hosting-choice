from django.contrib import admin
from catalog import models

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


class HostAdmin(admin.ModelAdmin):

    list_display = ('name', 'category', 'links_back', 'link_back_required',
        'hits', 'featured', 'active', 'rank')
    list_filter = ('links_back', 'link_back_required', 'featured', 'active')
    ordering = ('name', 'category')
    search_fields = ('name', 'category', 'space', 'bandwidth', 'price', 'image')

class KarmaAdmin(admin.ModelAdmin):

    list_display = ('comment', 'ip', 'value')
    list_filter = ('value',)
    ordering = ('comment', 'ip', 'value')
    search_fields = ('comment', 'ip')

admin.site.register(models.Host, HostAdmin)
admin.site.register(models.Category)
admin.site.register(models.Comment, CommentAdmin)
admin.site.register(models.Karma, KarmaAdmin)

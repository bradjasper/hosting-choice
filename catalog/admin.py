from django.contrib import admin
from catalog import models

admin.site.register(models.Host)
admin.site.register(models.Category)
admin.site.register(models.Comment)
admin.site.register(models.Karma)
admin.site.register(models.RatingType)
admin.site.register(models.Rating)

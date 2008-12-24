from django.contrib import admin
from catalog import models

admin.site.register(models.Category)
admin.site.register(models.Entry)
admin.site.register(models.Tag)
admin.site.register(models.Comment)
admin.site.register(models.Rating)
admin.site.register(models.RatingType)

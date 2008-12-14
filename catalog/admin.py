from django.contrib import admin
from catalog import models

admin.site.register(models.Tag)
admin.site.register(models.Category)
admin.site.register(models.Entry)

from django.contrib import admin
from catalog import models

admin.site.register(models.Category)
admin.site.register(models.Entry)
admin.site.register(models.Note)
admin.site.register(models.Tag)

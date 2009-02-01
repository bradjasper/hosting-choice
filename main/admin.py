from django.contrib import admin
import models

class EntriesAdmin(admin.ModelAdmin):
    list_display = ('name', 'pub_date')
    ordering = ('pub_date', 'name')
    search_fields = ('name', 'text')


admin.site.register(models.Page)
admin.site.register(models.Entry, EntriesAdmin)
admin.site.register(models.Email)
admin.site.register(models.FAQ)

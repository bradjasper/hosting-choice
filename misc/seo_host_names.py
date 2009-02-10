import re

from catalog import models

for host in models.Host.objects.all():
	name = host.name
	print name, "review"

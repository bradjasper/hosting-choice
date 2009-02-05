import re

from catalog import models

for host in models.Host.objects.all():
	name = re.sub('[^a-zA-Z0-9_\s]', '', host.name, re.IGNORECASE)
	print name, "hosting"
	print name, "web host"
	print name, "web hosting"
	print name, "webhost"
	print name, "host"
	print name, "review"
	print name, "reviews"
	print name, "hosting reviews"
	print name, "web hosting review"
	print name, "web hosting reviews"
	print name, "hosting review"

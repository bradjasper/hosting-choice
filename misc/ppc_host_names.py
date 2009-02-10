import re

from catalog import models

bid = 1.50

for host in models.Host.objects.all():
	name = re.sub('[^a-zA-Z0-9_\s\&]', '', host.name, re.IGNORECASE).lower()
        items = []
        items.append(name)
        items.append(name + " hosting")
        items.append(name + " web host")
        items.append(name + " web hosting")
        items.append("web hosting by" + name)
        items.append(name + " webhost")
        items.append(name + " host")
        items.append(name + " review")
        items.append(name + " reviews")
        items.append(name + " hosting reviews")
        items.append(name + " web hosting review")
        items.append(name + " web hosting reviews")
        items.append(name + " hosting review")

        for item in items:
            print item, '**', bid, '**', 'http://hosting-choice.com' + host.get_absolute_url()
            print '"' + item + '"', '**', bid, '**', 'http://hosting-choice.com' + host.get_absolute_url()
            print '[' + item + ']', '**', bid, '**', 'http://hosting-choice.com' + host.get_absolute_url()

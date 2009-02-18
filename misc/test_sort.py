from catalog import models

hosts = models.Host.objects.all()
sorted(hosts, lambda x,y: cmp(2, 1))

for item in hosts:
    print item



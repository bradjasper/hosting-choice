import MySQLdb

import format

from catalog import models

swap = (
    ('web hosting', 'webhosting'),
    ('hosting', 'webhosting'),
    ('hosts', 'webhosts'),
    ('host', 'webhost'))

items = [
	'site hosting',
	'web site host',
	'rating web hosting',
	'website host',
	'web space',
	'webhost',
	'cheap domain hosting',
	'cheap web hosting plan',
	'affordable hosting',
	'hosting services',
	'cheap website hosting',
	'best website host',
	'budget web hosting',
	'hosting provider',
	'best web hosting service',
	'business web site hosting',
	'web site hosting services',
	'www hosting',
	'website hosting services',
	'web site hosting plans',
	'linux web hosting',
	'hosting packages',
	'cheapest web hosting',
	'best web hosting company',
	'web hosting review',
	'top web hosting',
	'affordable web hosting services',
	'discount web hosting',
	'hosting plans',
	'best web hosts',
	'web hosting plan cheapest monthly rate']


def add_keyword(keyword):

    keyword1 = keyword.title()
    keyword2 = get_synonym(keyword).title()

    title = "%s - %s" % (keyword1, keyword2)
    description = """Hosting Choice offers the <strong>%s</strong> that you need
    to make the best decision on a webhost. Our <strong>%s</strong> will guide
    your decision to find <strong>%s</strong>. Make your decision on the
    <strong>%s</strong> today!""" % (keyword1, keyword2, keyword1, keyword2)

    feature_type = models.FeatureType(name=keyword1,
        title=title, description=description)
    feature_type.slug = format.slugify(keyword1)
    try:
        feature_type.save()
    except MySQLdb.IntegrityError:
        print keyword1, 'is duplicate'

def get_synonym(item):
    for term, term2 in swap:
        if term in item:
            item = item.replace(term, term2)
            break
        elif term2 in item:
            item = item.replace(term2, term)
            break
    return item

if __name__ == "__main__":
    for item in items:
        add_keyword(item)

"""
    Spyder is our little web crawler that goes and checks if a site is
    linking back to us.
"""

import urllib
import amara

class Spyder(object):

    def __init__(self, url):
        self.content = urllib.urlopen(url).read()
        self.doc = amara.parse(self.content)

    def find_link(self, id):
        """Find a link with a specific ID"""

        try:
            xpath_str = "*//a[@id = '%s']" % id
            link = self.doc.xml_xpath(xpath_str).pop()
        except IndexError:
            return None

        return link

    def has_link(self, id):
        return len(self.find_link(id)) >= 1

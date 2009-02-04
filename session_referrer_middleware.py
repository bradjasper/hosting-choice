"""
    Session Referrer Middleware (for Django)

    This is a middleware for Django. It is used for collecting the
    initial referrer and storing the value in a session.

    This is useful for conversion tracking.

    Based on http://www.djangosnippets.org/snippets/197/
    Edited down for referrer use in general

    Orig Author: exogen
    New Author: Brad Jasper
    Date: February 3, 2009

"""
import urlparse
import cgi
import re

class ReferrerMiddleware(object):

    def process_request(self, request):
        """This is where we store the referrer if its not already set"""

        referrer = request.META.get('HTTP_REFERER')

        if not request.session.get('referrer'):
            request.session['referrer'] = referrer

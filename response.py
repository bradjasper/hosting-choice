import MySQLdb
import jinja2
from django import http
from django.core.cache import cache

import catalog.models
import main.models
from main import forms
import format

import settings

env = jinja2.Environment(extensions=['jinja2.ext.loopcontrols'],
        loader=jinja2.PackageLoader('hostingchoice', 'static/templates'))

def render_to_response(template, context = None):
    global env

    if context is None:
        context = {}

    obj = env.get_template(template)
    contents = obj.render(**context)

    return http.HttpResponse(contents)

def get_sidebar():
    """Return standard items from the sidebar"""

    cached = cache.get('sidebar')
    if cached:
        return cached

    sidebar = {
        'categories': catalog.models.Category.objects.filter(),

        'features': catalog.models.FeatureType.objects. \
                filter(is_category=True).order_by('-priority'),

        'hosts': catalog.models.Host.objects.leaderboard(),

        'recent_reviews': catalog.models.Comment.objects. \
                filter(active=1).order_by('-date')[:10],

        'articles': main.models.Entry.objects.all(). \
                order_by('-pub_date')[0:10]}

    cache.set('sidebar', sidebar, settings.CACHE_TIMEOUT)

    return sidebar



env.filters['smart_round'] = format.smart_round
env.filters['datetimeformat'] = format.datetimeformat
env.filters['normalize_size'] = format.normalize_size
env.filters['markup'] = format.markup
env.filters['read_more'] = format.read_more
env.filters['get_normal_rank'] = format.get_normal_rank
env.filters['unlimited'] = format.unlimited

def render(template, context = None):
    """Generic render method to render full pages"""

    if context is None:
        context = {}

    context.update(get_sidebar())

    if 'request' in context:
        request = context['request']

        context['active_page'] = get_section(request.META['PATH_INFO'])

        form = forms.EmailForm(request.POST)
        context['email_form'] = form

        if form.is_valid():
            email = form.data['value']
            new_obj = main.models.Email(value=email,
                ip=request.META['REMOTE_ADDR'])

            try:
                new_obj.save()
            except MySQLdb.IntegrityError:
                context['email_messages'] = {'error':
                    'This email is already in our database'}
            else:
                context['email_messages'] = {'success':
                    'Successfully added your name to the list. You will now'
                        + ' receive offers from our partners'}


        else:
            context['email_form'] = forms.EmailForm()

        del context['request']

    return render_to_response(template, context)


def get_section(path):
    """Return the section given a path. Used for nav bar highlighting"""

    if path.startswith('/host'):
        return 'directory'

    # returns leaderboard from /leaderboard.html
    return path[1:-5]

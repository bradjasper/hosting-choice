import MySQLdb
import jinja2
from django import http
from django.core.cache import cache

import catalog.models
import main.models
import main.forms
import catalog.forms
import format
import links.models

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
                filter(is_category=True).exclude(show=-1).order_by('-priority'),

        'tags': catalog.models.FeatureType.objects. \
                filter(is_category=True, show=-1).order_by('-priority'),

        'hosts': catalog.models.Host.objects.leaderboard(),

        'recent_reviews': catalog.models.Comment.objects. \
                filter(active=1).order_by('-date')[:12],
                
        'links': links.models.Link.objects.all().order_by('-priority'),

        'articles': main.models.Entry.objects.all(). \
                order_by('-pub_date')}

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

    if 'request' not in context:
        assert False, 'Context is invalid'

    request = context['request']

    context['active_page'] = get_section(request.META['PATH_INFO'])

    form = main.forms.EmailForm(request.POST)
    context['email_form'] = form

    if 'submit_lead' in request.POST:
        lead_form = catalog.forms.LeadForm(request.POST)

        if lead_form.is_valid():

            name = lead_form.data['name']
            email = lead_form.data['email']
            platform = lead_form.data['platform']

            new_lead = catalog.models.Lead(name=name,
                email=email, platform=platform,
                ip=request.META['REMOTE_ADDR'])

            new_lead.save()

            context['lead_messages'] = {'success':
                """Successfully added your information. You will receive
                your quotes via e-mail shortly"""}

            lead_form = catalog.forms.LeadForm()

    else:
        lead_form = catalog.forms.LeadForm()

    context['lead_form'] = lead_form

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
        context['email_form'] = main.forms.EmailForm()

    return render_to_response(template, context)


def get_section(path):
    """Return the section given a path. Used for nav bar highlighting"""

    if path.startswith('/host'):
        return 'directory'

    # returns leaderboard from /leaderboard.html
    return path[1:-5]

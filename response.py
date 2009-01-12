import jinja2
from django import http
from catalog import models

env = jinja2.Environment(extensions=['jinja2.ext.loopcontrols'],
        loader=jinja2.PackageLoader('hosting-choice', 'static/templates'))

def datetimeformat(value, format='%H:%M / %d-%m-%Y'):
    return value.strftime(format)


def smart_round(num):
    new_num = roudn(round(num / 0.5) * 0.5)

    # Cheap way to remove rounding zero. Find better way to do this.
    if str(new_num).endswith('.0'):
        new_num = int(str(new_num).split('.')[0])

    return new_num

def normalize_size(size):
    for i, type in enumerate(['MB', 'GB', 'TB']):
        tmp_size = int(size) / (1000 ** i)
        if tmp_size < 1000:
            return "%d%s" % (tmp_size, type)
    return size


def render_to_response(template, context = None):
    global env

    if context is None:
        context = {}

    obj = env.get_template(template)
    contents = obj.render(**context)

    return http.HttpResponse(contents)


env.filters['smart_round'] = smart_round
env.filters['datetimeformat'] = datetimeformat
env.filters['normalize_size'] = normalize_size

def render(template, context = None):
    """Generic render method to render full pages"""

    if context is None:
        context = {}

    categories = models.Category.objects.filter()
    top_hosts = models.Host.objects.leaderboard()[0:10]
    recent_reviews = models.Comment.objects.filter(active=1).order_by('date')

    if 'request' in context:
        context['active_page'] = get_section(context['request'].META['PATH_INFO'])
        del context['request']

    context.update({
        'categories': categories,
        'top_hosts': top_hosts,
        'recent_reviews': recent_reviews})

    return render_to_response(template, context)


def get_section(path):
    """Return the section given a path. Used for nav bar highlighting"""

    if path.startswith('/host'):
        return 'directory'

    # returns leaderboard from /leaderboard.html
    return path[1:-5]

from django import http
from catalog import models
import jinja2

env = jinja2.Environment(loader=jinja2.PackageLoader('hosting-choice', 'templates'))


def render_to_response(template, context = None):
    global env

    if context is None:
        context = {}

    obj = env.get_template(template)
    contents = obj.render(**context)

    return http.HttpResponse(contents)


def render(template, context):
    """Generic render method to render full pages"""

    categories = models.Category.objects.filter()

    context.update({
        'categories': categories})

    return render_to_response(template, context)


def show_host(request, slug):
    """Return the view for an host listing"""

    try:
        host = models.Host.objects.get(slug=slug)
    except models.Host.DoesNotExist:
        host = None

    return render('host.html', {
        'host': host})

    
def show_category(request, slug):
    """Return the view for a category listing"""

    try:
        category = models.Category.objects.get(slug=slug)
        hosts = models.Host.objects.filter(category=category)
    except models.Category.DoesNotExist:
        category = None
        hosts = []

    return render('category.html', {
        'hosts': hosts,
        'category': category})

from django import http
from catalog import models
import jinja2

env = jinja2.Environment(loader=jinja2.PackageLoader('bizdir', 'templates'))


def render_to_response(template, context = None):
    global env

    if context is None:
        context = {}

    obj = env.get_template(template)
    contents = obj.render(**context)

    return http.HttpResponse(contents)


def render(template, context):
    """Generic render method to render full pages"""

    categories = models.Category.objects.filter(active=True)

    context.update({
        'categories': categories})

    return render_to_response(template, context)


def show_entry(request, slug):
    """Return the view for an entry listing"""

    try:
        entry = models.Entry.objects.get(slug=slug)
    except models.Entry.DoesNotExist:
        entry = None

    return render('entry.html', {
        'entry': entry})

    
def show_category(request, slug):
    """Return the view for a category listing"""

    try:
        category = models.Category.objects.get(slug=slug)
        entries = models.Entry.objects.filter(category=category)
    except models.Category.DoesNotExist:
        category = None
        entries = []

    return render('category.html', {
        'entries': entries,
        'category': category})

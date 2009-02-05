from django import http
from catalog import models, forms
from django.core.cache import cache
import MySQLdb
from django.views.decorators.cache import cache_page, cache_control

import response
import settings

#@cache_control(private=True)
def show_host(request, slug):
    """Return the view for an host listing"""

    messages = {'success': [], 'errors': []}
    try:
        host = models.Host.objects.get(slug=slug)

        if request.method == 'POST' and request.POST.get('form_submit') == 'comment':
            form = forms.CommentForm(request.POST)

            if form.is_valid():

                name = form.cleaned_data['name']
                email = form.cleaned_data['email']
                website = form.cleaned_data.get('website', None)
                text = form.cleaned_data['text']

                comment = models.Comment(host=host, name=name,
                    email=email, website=website, text=text, active=True,
                    ip=request.META['REMOTE_ADDR'])

                comment.save()

                for name in ['Features', 'Uptime', 'Support']:
                    value = form.cleaned_data.get('rating_'+name.lower()+'_val', -1)
                    type = models.RatingType.objects.get(name=name)
                    rating = models.Rating(type=type, value=value,
                        comment=comment)
                    rating.save()

                messages['success'].append(
                    'Successfully added your review to the site.'
                    + ' Scroll up to see it. Thanks for helping! If you don\'t'
                    + ' see your comment please wait a few minutes, we\'re'
                    + ' caching some pages')

                form = forms.CommentForm()

        else:
            form = forms.CommentForm()

    except models.Host.DoesNotExist:
        host = None
        form = None

    ver = request.GET.get('ver')
    if ver:
        template = "variations/host_%s.html" % ver
    else:
        template = "host.html"

    return response.render(template, {
        'host': host,
        'form': form,
        'messages': messages,
        'request': request})

    
def show_category(request, slug):
    """Return the view for a category listing"""

    try:
        category = models.Category.objects.get(slug=slug)
        hosts = models.Host.objects.leaderboard()

    except models.Category.DoesNotExist:
        category = None
        hosts = []


    return response.render('category.html', {
        'hosts': hosts,
        'category': category,
        'request': request})

def show_categories(request):
    """Return an overall view of the categories"""

    categories = cache.get('categories')
    if not categories:
        categories = models.Category.objects.filter(parent=0).order_by('name')
        cache.set('categories', categories, settings.CACHE_TIMEOUT)

    return response.render('categories.html', {
        'categories': categories,
        'request': request})


def report(request, id):
    """Report a comment"""

    comment = models.Comment.objects.get(id=id);
    comment.active = -1
    comment.save()

    return http.HttpResponse()


def helpful(request, id):
    """Give a comment some karma"""

    comment = models.Comment.objects.get(id=id);

    try:
        karma = models.Karma(comment=comment)
        karma.value = 1
        karma.ip = request.META['REMOTE_ADDR']
        karma.save()
    except MySQLdb.IntegrityError:
        pass

    return http.HttpResponse()



def leaderboard(request):
    """Display the leaderboard"""
    return response.render('leaderboard.html', {
        'request': request})


def matrix(request):
    """Display the leaderboard as a matrix"""

    return response.render('matrix.html', {
        'request': request})

    
def visit(request, slug):
    """Visit a site, recording a hit"""
    host = models.Host.objects.get(slug=slug)
    hit = models.Hit(host=host)
    hit.ip = request.META['REMOTE_ADDR']
    hit.referrer = request.session.get('referrer')
    hit.user_agent = request.META['HTTP_USER_AGENT']
    hit.note = request.GET.get('note')

    hit.save()

    return http.HttpResponseRedirect(host.url)

def sitemap_xml(request):
    """Display sitemap for search engine"""

    hosts = models.Host.objects.leaderboard()
    categories = models.Category.objects.all()

    return response.render('sitemap.xml', {
        'hosts': hosts,
        'categories': categories})

def sitemap(request):
    """Display sitemap for search engine"""

    hosts = models.Host.objects.leaderboard()
    categories = models.Category.objects.all()

    return response.render('sitemap.html', {
        'hosts': hosts,
        'categories': categories})



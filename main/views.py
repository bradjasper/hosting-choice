from django import http, shortcuts
import models
import jinja2

import response

def index(request):
    return response.render('index.html', {
        'request': request})

def alt_index(request):
    return response.render('variations/alt_index.html', {
        'request': request})


def custom_404(request, template_name='404.html'):
    return response.render('404.html', {
        'request_path': request.path})

def get_page(request, slug):
    try:
        return response.render(slug+'.html')

    except jinja2.TemplateNotFound:

        page = shortcuts.get_object_or_404(models.Page, slug=slug)

        return response.render('page.html', {
            'page': page,
            'request': request})
            


def show_blog(request):
    entries = models.Entry.objects.all().order_by('-pub_date')[:10]
    return response.render('blog.html', {
        'entries': entries,
        'request': request})

def show_entry(request, slug):
    entry = shortcuts.get_object_or_404(models.Entry, slug=slug)

    return response.render('article.html', {
        'entry': entry,
        'request': request})

def show_entries(request):
    entries = models.Entry.objects.all().order_by('-pub_date')

    return response.render('articles.html', {
        'entries': entries,
        'request': request})


def show_faq(request):
    """Show FAQ page"""

    entries = models.FAQ.objects.all().order_by('-order')

    return response.render('faq.html', {
        'entries': entries,
        'request': request})

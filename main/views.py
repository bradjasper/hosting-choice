from django import http, shortcuts
import models
import jinja2

import response

def index(request):
    return response.render('index.html', {
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
            


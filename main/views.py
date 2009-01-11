from django import http, shortcuts
import models

import response

def index(request):
    return response.render('index.html', {
        'request': request})

def get_page(request, slug):
    page = shortcuts.get_object_or_404(models.Page, slug=slug)

    return response.render('page.html', {
        'page': page,
        'request': request})
    


from django import http, shortcuts

def index(request):
    assert False, 'boom'

def page(request, slug):
    assert False, (slug, request)

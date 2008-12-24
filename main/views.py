from django import http, shortcuts

def index(request):
    return shortcuts.render_to_response('index.html')

def page(request, slug):
    assert False, (slug, request)

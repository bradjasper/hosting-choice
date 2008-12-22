from django import http
import jinja2

env = jinja2.Environment(loader=jinja2.PackageLoader('bizdir', 'templates'))

def render_to_response(template, context = None):
    global env

    if context is None:
        context = {}

    obj = env.get_template(template)
    contents = obj.render(**context)

    return http.HttpResponse(contents)


def link_page(request):

    show_link = request.REQUEST.get('show_link', 'True')

    if show_link == 'True':
        text = """<doc><strong>This is some text</strong>
        <a href="http://www.bizdir.com" id="bizdir">BizDir</a>
        And other stuff.</doc>"""
    else:
        text = """<doc><strong>This is some other text </strong></doc>"""

    return http.HttpResponse(text)


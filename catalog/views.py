from django import http
from catalog import models, forms
import jinja2
import MySQLdb

env = jinja2.Environment(extensions=['jinja2.ext.loopcontrols'],
        loader=jinja2.PackageLoader('hosting-choice', 'static/templates'))

def datetimeformat(value, format='%H:%M / %d-%m-%Y'):
    return value.strftime(format)

env.filters['datetimeformat'] = datetimeformat

def smart_round(num):
    try:
        return round(num / 0.5) * 0.5
    except TypeError:
        assert False, num

env.filters['smart_round'] = smart_round

def render_to_response(template, context = None):
    global env

    if context is None:
        context = {}

    obj = env.get_template(template)
    contents = obj.render(**context)

    return http.HttpResponse(contents)


def render(template, context = None):
    """Generic render method to render full pages"""

    if context is None:
        context = {}

    categories = models.Category.objects.filter()
    top_hosts = models.Host.objects.leaderboard()
    recent_reviews = models.Comment.objects.filter(active=1).order_by('date')

    context.update({
        'categories': categories,
        'top_hosts': top_hosts,
        'recent_reviews': recent_reviews})

    return render_to_response(template, context)


def show_host(request, slug):
    """Return the view for an host listing"""

    messages = {'success': [], 'errors': []}
    try:
        host = models.Host.objects.get(slug=slug)

        if request.method == 'POST':
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
                    'Successfully added your review to the site')

                form = forms.CommentForm()

        else:
            form = forms.CommentForm()

    except models.Host.DoesNotExist:
        host = None
        form = None

    return render('host.html', {
        'host': host,
        'form': form,
        'messages': messages})

    
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

    return render('leaderboard.html')


    

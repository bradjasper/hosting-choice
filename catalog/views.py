from django import http
from catalog import models
from django import shortcuts

def category_dir(request, slug):
    """Return the view for a category listing"""

    category = shortcuts.get_object_or_404(models.Category, slug=slug)

    assert False, category

import math

import markdown

def datetimeformat(value, format=None):

    if format is None:
        format = '%M %d, %Y, %H:%M'

    return value.strftime(format)


def smart_round(num):

    new_num = math.ceil(num / 0.5) * 0.5

    # Cheap way to remove rounding zero. Find better way to do this.
    if str(new_num).endswith('.0'):
        new_num = int(str(new_num).split('.')[0])

    return new_num

def normalize_size(size, complete = None):
    for i, type in enumerate(['MB', 'GB', 'TB']):
        tmp_size = int(size) / (1000 ** i)
        if tmp_size < 1000:
            size = tmp_size
            break

    if complete:
        if size == 0:
            size = 'Unlimited'
        else:
            size = "%d%s" % (size, type)

    return size

def markup(text):
    return markdown.markdown(text)


def read_more(text, limit=125):
    """Inject a JS read_more link into a text paragraph"""

    if len(text) > limit:
        part1 = text[0:limit]
        link = """<span class="read">
            <a href="javascript:read_more()">continue reading</a>
            </span>"""

        part2 = """<span class="dotdots">...</span>%s<span
            class="more">%s</span>""" % (link, text[limit:])

        text = part1 + part2

    return text

def get_normal_rank(value):
    """Get the normalized rank"""

    if value > 99:
        value = 99

    if value < 0:
        value = 0

    return unicode(value).split('.')[0]

import markdown

def datetimeformat(value, format=None):

    if format is None:
        format = '%M %d, %Y, %H:%M'

    return value.strftime(format)


def smart_round(num):

    new_num = round(round(num / 0.5) * 0.5)
    return new_num

    # Cheap way to remove rounding zero. Find better way to do this.
    if str(new_num).endswith('.0'):
        new_num = int(str(new_num).split('.')[0])

    return new_num

def normalize_size(size):
    for i, type in enumerate(['MB', 'GB', 'TB']):
        tmp_size = int(size) / (1000 ** i)
        if tmp_size < 1000:
            return "%d%s" % (tmp_size, type)
    return size

def markup(text):
    return markdown.markdown(text)


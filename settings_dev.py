
DATABASE_USER='root'
DATABASE_PASSWORD=''
DATABASE_NAME='hostingchoice'

MEDIA_ROOT = '/Users/bjasper/Sites/hostingchoice/static/'
MEDIA_URL = '/media/'

MIDDLEWARE_CLASSES = (
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    #'debug_toolbar.middleware.DebugToolbarMiddleware',
)

INTERNAL_IPS = ('127.0.0.1',)

CACHE_BACKEND = 'dummy://'

INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.admin',
    'hostingchoice.catalog',
	'hostingchoice.main',
)

TEMPLATE_DIRS = (
    '/Users/bjasper/Sites/hostingchoice/static/templates/',
)

ADMIN_MEDIA_PREFIX = '/media/admin_dev/'

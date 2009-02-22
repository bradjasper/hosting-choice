
DEBUG = True
DATABASE_USER='root'
DATABASE_PASSWORD=''
DATABASE_NAME='hostingchoice'

MEDIA_ROOT = '/Users/bjasper/Sites/hostingchoice/static/'
MEDIA_URL = '/media/'

MIDDLEWARE_CLASSES = (
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'hostingchoice.session_referrer_middleware.ReferrerMiddleware',
    'hostingchoice.profiler_middleware.ProfilerMiddleware',
)

INTERNAL_IPS = ('127.0.0.1',)

CACHE_TIMEOUT = 60

INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.admin',
    'media_bundler',
    'hostingchoice.catalog',
	'hostingchoice.main',
)

TEMPLATE_DIRS = (
    '/Users/bjasper/Sites/hostingchoice/static/templates/',
)

SESSION_ENGINE = 'django.contrib.sessions.backends.file'

ADMIN_MEDIA_PREFIX = '/media/admin_dev/'

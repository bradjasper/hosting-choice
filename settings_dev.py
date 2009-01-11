
DATABASE_USER='root'
DATABASE_PASSWORD=''
DATABASE_NAME='bizdev'

MEDIA_ROOT = '/home/bjasper/Sites/hosting-choice/'
MEDIA_URL = '/media/'

MIDDLEWARE_CLASSES = (
    'django.middleware.cache.UpdateCacheMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'debug_toolbar.middleware.DebugToolbarMiddleware',
    'django.middleware.cache.FetchFromCacheMiddleware',
)

INTERNAL_IPS = ('127.0.0.1',)

INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.admin',
    'hosting-choice.catalog',
	'hosting-choice.main',
    'debug_toolbar',
)

ADMIN_MEDIA_PREFIX = '/media/admin_dev/'

import settings
from catalog import models

models.Host.objects.rank_snapshot()

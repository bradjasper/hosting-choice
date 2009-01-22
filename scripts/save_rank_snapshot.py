#!/usr/bin/env python
import sys
import os

sys.path.append('/home/bjasper/')
sys.path.append('/home/bjasper/hostingchoice/')

os.environ['DJANGO_SETTINGS_MODULE'] = 'hostingchoice.settings'

import settings
from catalog import models

models.Host.objects.rank_snapshot()

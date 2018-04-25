"""
WSGI config for seekconnection project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/2.0/howto/deployment/wsgi/
"""

import os

from django.core.wsgi import get_wsgi_application

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "seekconnection.settings")

if 'DEBUG' not in os.environ and 'SECRET_KEY' not in os.environ:
    raise ValueError('In production, you have to set a SECRET_KEY value in the environment.')

application = get_wsgi_application()

#!/usr/bin/env bash

pipenv run python manage.py migrate --no-input
pipenv run gunicorn seekconnection.wsgi:application -w 8 --bind=0.0.0.0:8000 --access-logfile=- --reload
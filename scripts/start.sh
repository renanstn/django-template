#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: start.sh [ENVIRONMENT](development/production)"
    exit 1
fi

ENVIRONMENT=$1

if [ "$ENVIRONMENT" = "development" ]; then
    python manage.py runserver 0.0.0.0:8000

elif [ "$ENVIRONMENT" = "production" ]; then
    gunicorn \
        --bind 0.0.0.0:8000 \
        video_app.wsgi
fi

#!/bin/bash

cd /app

gunicorn \
    --reload \
    --bind 0.0.0.0:8000 \
    mysite.wsgi

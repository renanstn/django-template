# django-template

[![Python](https://img.shields.io/badge/python-%2314354C.svg?style=flat&logo=python&logoColor=white)](https://www.python.org/)
[![Django](https://img.shields.io/badge/django-%23092E20.svg?style=flat&logo=django&logoColor=white)](https://www.djangoproject.com/)
[![DjangoREST](https://img.shields.io/badge/DJANGO-REST-ff1709?style=flat&logo=django&logoColor=white&color=ff1709&labelColor=gray)](https://www.django-rest-framework.org/)
[![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=flat&logo=docker&logoColor=white)](https://www.docker.com/)
[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)
[![Django CI](https://github.com/renanstn/django-template/actions/workflows/django.yml/badge.svg)](https://github.com/renanstn/django-template/actions/workflows/django.yml)

Just a good template to a dockerized django-rest app.

## Features

- Use [Poetry](https://python-poetry.org/) as dependency manager
- Use [Black](https://black.readthedocs.io/en/stable/) as code formatter
- Use [django-extensions](https://django-extensions.readthedocs.io/en/latest/) to provide some nice tools (like `plus_shell`)
- Use `Makefile` as a shortcut for some commands
- Automatically run `collectstatic`, `makemigrations` and `migrate` when the container runs
- Automatically create an `superuser` if not exists
- GitHub actions configured, with Postgres integration for tests

# =============================================================================
# Base
# =============================================================================
FROM python:3.9 AS base
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
RUN pip install --upgrade pip
RUN pip install poetry
WORKDIR /app
COPY pyproject.toml poetry.lock /app/

# =============================================================================
# Development
# =============================================================================
FROM base AS development
RUN poetry config virtualenvs.create false && \
    poetry install --no-interaction --no-ansi
COPY . /app/
RUN chmod +x /app/scripts/*.sh
ENTRYPOINT [ "scripts/entrypoint.sh" ]
CMD [ "scripts/start.sh"]

# =============================================================================
# Production
# =============================================================================
FROM base AS production
RUN poetry config virtualenvs.create false && \
    poetry install --no-dev --no-interaction --no-ansi
COPY . /app/
RUN chmod +x /app/*.sh
ENTRYPOINT [ "entrypoint.sh" ]
CMD [ "start.sh", "server" ]

# =============================================================================
# Base
# =============================================================================
FROM python:3.9 AS base
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
RUN apt-get update && \
    pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir poetry==1.4.2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
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
CMD [ "scripts/start.sh", "development" ]

# =============================================================================
# Production
# =============================================================================
FROM base AS production
RUN poetry config virtualenvs.create false && \
    poetry install --no-dev --no-interaction --no-ansi
COPY . /app/
RUN chmod +x /app/scripts/*.sh
ENTRYPOINT [ "scripts/entrypoint.sh" ]
CMD [ "scripts/start.sh", "production" ]

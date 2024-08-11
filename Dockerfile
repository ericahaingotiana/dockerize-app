FROM php:8.2-fpm

WORKDIR /var/www/html

RUN apt-get update \
    && apt-get install --quiet --yes --no-install-recommends \
    libzip-dev \
    unzip

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN groupadd --git 1000 appuser \
    && useradd --uid 1000 -g appuser \
    -G www-data, root --shell /bin/bash \
    --create-home appuser

USER appuser

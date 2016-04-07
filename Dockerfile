FROM php:5.6.20-fpm

RUN buildDeps=" \
      libfreetype6-dev \
      libjpeg-dev \
      libpng12-dev \
      libcurl4-gnutls-dev \
    "; \
    set -x \
 && apt-get update && apt-get install -y $buildDeps --no-install-recommends \
 && rm -rf /var/lib/apt/lists/* \
 && docker-php-ext-configure gd \
    --with-freetype-dir=/usr/include/ \
    --with-jpeg-dir=/usr/include/ \
 && docker-php-ext-install -j$(nproc) gd \
 && docker-php-ext-install -j$(nproc) curl \
 && docker-php-ext-install -j$(nproc) mysqli \
 && apt-get purge -y --auto-remove $buildDeps \
 && cd /usr/src/php \
 && make clean

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

RUN cd /tmp \
 && curl -o ioncube.tar.gz \
    http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64_5.1.2.tar.gz \
 && echo '08616dc35d145bac27c72d0537e933b26c98e1f2  ioncube.tar.gz' | shasum -c \
 && tar -xzf ioncube.tar.gz \
 && mv ioncube/ioncube_loader_lin_5.6.so /usr/local/lib/php/extensions/* \
 && rm -rf ioncube.tar.gz ioncube \
 && echo "zend_extension=ioncube_loader_lin_5.6.so" \
    > /usr/local/etc/php/conf.d/00_docker-php-ext-ioncube_loader_lin_5.6.ini

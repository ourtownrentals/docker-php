FROM php:7.0.7-fpm

MAINTAINER Evan Sosenko <razorx@evansosenko.com>

RUN buildDeps=" \
      libfreetype6-dev \
      libjpeg-dev \
      libpng12-dev \
      libcurl4-gnutls-dev \
    "; \
    set -x \
 && apt-get update \
 && apt-get install -y --no-install-recommends --no-install-suggests \
    $buildDeps \
    libfreetype6 \
    libjpeg62-turbo \
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
    https://www.ioncube.com/php7-linux-x86-64-beta5.tgz \
 && echo '856a25c79b9542163406a70082209bcfe1519a96  ioncube.tar.gz' | shasum -c \
 && tar -xzf ioncube.tar.gz \
 && mv ioncube_loader_lin_x86-64_7.0b5.so /usr/local/lib/php/extensions/* \
 && rm -rf ioncube.tar.gz ioncube_loader_lin_x86-64_7.0b5.so \
    README_PHP7_X86_64_BETA \
 && echo "zend_extension=ioncube_loader_lin_x86-64_7.0b5.so" \
    > /usr/local/etc/php/conf.d/00_docker-php-ext-ioncube_loader_lin_7.0.ini

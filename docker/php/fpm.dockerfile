FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    libzip-dev \
    libpq-dev

RUN curl -sS https://getcomposer.org/installer | php && \
 mv composer.phar /usr/local/bin/composer

RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql

RUN docker-php-ext-install zip \
    pdo \
    pdo_pgsql \
    pgsql
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

ADD /docker/php/config/docker-php-ext-xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-debug.ini

WORKDIR /var/www/crmapp

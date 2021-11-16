FROM php:8.0-fpm

RUN apt update \
    && apt install -y zlib1g-dev g++ git libicu-dev zip libzip-dev zip \
    && docker-php-ext-install intl opcache pdo pdo_mysql \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip

WORKDIR /var/www

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -sS https://get.symfony.com/cli/installer | bash
RUN mv /root/.symfony/bin/symfony /usr/local/bin/symfony

ENV PHP_XDEBUG_REMOTE_HOST="172.17.0.1" \
    PHP_XDEBUG_REMOTE_PORT="9001" \
    PHP_XDEBUG_IDEKEY="XDEBUG_SESSION"

COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

RUN useradd -u 1000 -s /bin/bash -m project

USER project

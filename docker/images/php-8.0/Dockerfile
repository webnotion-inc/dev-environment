FROM php:8.0-fpm

WORKDIR /home/project/src

COPY conf.d/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
COPY conf.d/error_reporting.ini /usr/local/etc/php/conf.d/error_reporting.ini

ADD ./setup_docker.sh /setup_docker.sh
RUN /setup_docker.sh

ADD ./entrypoint.sh /entrypoint.sh
CMD exec /entrypoint.sh

USER project

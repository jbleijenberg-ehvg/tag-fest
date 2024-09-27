FROM ghcr.io/superbrave/php:8.3

USER root

RUN chown -R www-data:www-data /var/www /app-code \
 && chgrp -R www-data /usr/local/etc/php/ \
 && chmod -R go+rw /usr/local/etc/php /usr/local/var/log

RUN apk update && apk upgrade --ignore libcurl

WORKDIR /var/www

COPY . /var/www

RUN composer i --ignore-platform-reqs || true
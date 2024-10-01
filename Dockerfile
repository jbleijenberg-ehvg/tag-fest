FROM php:8.3-alpine

RUN apk update && apk upgrade --ignore libcurl && apk add bash

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
 && php composer-setup.php \
 && mv composer.phar /usr/local/bin/composer

WORKDIR /var/www

COPY . /var/www

RUN /usr/local/bin/composer i --ignore-platform-reqs || true
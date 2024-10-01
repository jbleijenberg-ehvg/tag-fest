FROM php:8.3-alpine

RUN apk update && apk upgrade --ignore libcurl && apk add bash

WORKDIR /var/www

COPY . /var/www

RUN /usr/local/bin/composer i --ignore-platform-reqs || true
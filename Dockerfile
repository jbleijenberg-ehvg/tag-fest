FROM php:8.3-alpine

RUN apk update && apk upgrade --ignore libcurl

WORKDIR /var/www

COPY . /var/www

RUN composer i --ignore-platform-reqs || true
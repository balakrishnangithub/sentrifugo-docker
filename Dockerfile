FROM php:5-apache

WORKDIR /var/www/html

RUN docker-php-ext-install pdo_mysql
RUN apt-get update && apt-get install -y libpng-dev && docker-php-ext-install gd

RUN a2enmod rewrite headers

ARG PHP_TIMEZONE="Asia/Kolkata"
RUN echo "date.timezone = ${PHP_TIMEZONE}" > /usr/local/etc/php/conf.d/custom-php.ini

RUN apt-get install -y unzip \
&& cd .. \
&& curl -O https://codeload.github.com/sapplica/sentrifugo/zip/master \
&& unzip master \
&& rm master \
&& useradd nobody.nobody \
&& chown -R nobody.nobody sentrifugo-master \
&& chmod -R 777 sentrifugo-master \
&& rm -rf html \
&& mv sentrifugo-master html

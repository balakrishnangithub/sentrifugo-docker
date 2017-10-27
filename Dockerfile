FROM php:5-apache

WORKDIR /var/www/html

RUN apt-get update -y && docker-php-ext-install pdo_mysql \
&& apt-get install -y libpng-dev && docker-php-ext-install gd

RUN a2enmod rewrite headers

RUN apt-get install -y unzip \
&& curl -O https://codeload.github.com/sapplica/sentrifugo/zip/master \
&& unzip master -d .. \
&& rm master \
&& chown -R nobody ../.* \
&& chmod -R 777 ../.* \
&& mv ../sentrifugo-master/* . \
&& rm -rf ../sentrifugo-master

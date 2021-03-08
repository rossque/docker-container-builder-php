ARG PHP_IMAGE=php:7.4-fpm
FROM $PHP_IMAGE AS php
RUN apt-get update && apt-get install -y \
libsodium-dev \
libfreetype6-dev \
libjpeg62-turbo-dev \
libmcrypt-dev \
libpng-dev \
zlib1g-dev \
libxml2-dev \
libzip-dev \
libonig-dev \
graphviz \
git \
zip \
unzip \
vim \
supervisor \
cron \
htop

RUN docker-php-source extract \
&& docker-php-ext-configure gd \
&& docker-php-ext-install gd pdo_mysql mysqli zip pcntl intl \
&& pecl install redis \
&& docker-php-ext-enable redis \
&& docker-php-source delete

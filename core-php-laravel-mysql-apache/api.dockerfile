FROM php:7.4.14-apache

WORKDIR /var/www/html/

RUN apt-get update && apt-get install -y \
        libpng-dev \
        zlib1g-dev \
        libxml2-dev \
        libzip-dev \
        libonig-dev \
        zip \
        curl \
        unzip \
    && docker-php-ext-configure gd \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install zip \
    && docker-php-source delete

RUN apt-get update -y && apt-get install -y libmcrypt-dev openssl
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY ./api /var/www/html/
COPY ./vhost.conf /etc/apache2/sites-available/000-default.conf

# RUN chown -R www-data:www-data /var/www/html \
RUN chmod -R 777 ./ \
    && a2enmod rewrite \
    && composer install \
    && cp -v .env.example .env \
    && php artisan key:generate \
    && php artisan cache:clear

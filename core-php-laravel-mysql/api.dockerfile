FROM php:7.4-fpm
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libzip-dev \       
        zip \
        unzip \
    && docker-php-ext-install zip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd 

RUN apt-get update -y && apt-get install -y libmcrypt-dev openssl
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# COPY ./api /var/www/
# WORKDIR /var/www

# RUN chmod -R 777 ./ \
#     && composer install \
#     && cp -v .env.example .env \
#     && php artisan key:generate \
#     && php artisan cache:clear
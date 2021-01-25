FROM php:8.0-fpm-alpine

RUN apk --no-cache update && \
	apk add busybox-extras net-tools mysql-client \
	libpng-dev \
	zip libzip-dev

RUN docker-php-ext-configure zip
RUN	docker-php-ext-install -j$(nproc) zip
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install opcache 
RUN docker-php-ext-install gd

COPY wordpress /var/www/html
COPY opcache.ini /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini
COPY upload.ini /usr/local/etc/php/conf.d/upload.ini
RUN chown -R www-data:www-data /var/www/html
USER www-data

CMD ["php-fpm","-y","/usr/local/etc/php-fpm.conf"]

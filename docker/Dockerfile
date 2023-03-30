FROM php:8.1-fpm

ENV USERID=1000
ENV USERNAME=dev

# Set working directory
WORKDIR /var/www/

# Install system dependencies
RUN apt update && apt install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libpq-dev\
    libxml2-dev \
    zip \
    unzip\
    libmemcached-dev \
	libz-dev \
	libpq-dev \
	libssl-dev libssl-doc libsasl2-dev \
	libmcrypt-dev \
	libxml2-dev \
	zlib1g-dev libicu-dev g++ \
	libldap2-dev libbz2-dev \
	curl libcurl4-openssl-dev \
	libgmp-dev firebird-dev libib-util \
	re2c libpng++-dev \
	libwebp-dev libjpeg-dev libjpeg62-turbo-dev libpng-dev libxpm-dev libvpx-dev libfreetype6-dev \
    libmagick++-dev \
	libmagickwand-dev \
	zlib1g-dev libgd-dev \
	libtidy-dev libxslt1-dev libmagic-dev libexif-dev file \
	sqlite3 libsqlite3-dev libxslt-dev \
	libmhash2 libmhash-dev libc-client-dev libkrb5-dev libssh2-1-dev \
	unzip libpcre3 libpcre3-dev \
	poppler-utils ghostscript libmagickwand-6.q16-dev libsnmp-dev libedit-dev libreadline6-dev libsodium-dev \
	freetds-bin freetds-dev freetds-common libct4 libsybdb5 tdsodbc libreadline-dev librecode-dev libpspell-dev libonig-dev

# Install PHP extensions
RUN docker-php-ext-install opcache
RUN docker-php-ext-install mbstring exif pcntl bcmath gd
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_pgsql
RUN docker-php-ext-install dom
RUN docker-php-ext-install xml

#Install Redis

RUN pecl install redis
RUN echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini
# Timezone

RUN echo "date.timezone=Africa/Luanda" > /usr/local/etc/php/conf.d/timezone_luanda.ini
RUN echo "memory_limit = 1024M" > /usr/local/etc/php/conf.d/memory_limit.ini

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN echo "$USERID";
# Add user for laravel application
RUN groupadd -g $USERID $USERNAME
RUN useradd -u $USERID -ms /bin/bash -g $USERNAME $USERNAME

# Copy existing application directory contents
COPY .. /var/www/

# Copy existing application directory permissions
COPY --chown=$USERNAME:$USERNAME .. /var/www/

# Change current user to www
USER $USERNAME

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
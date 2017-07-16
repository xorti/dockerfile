FROM php:7.1-apache

RUN apt-get update && apt-get install -y \
	git \
	bzip2 \
	libcurl4-openssl-dev \
	libfreetype6-dev \
	libicu-dev \
	libjpeg-dev \
	libldap2-dev \
	libmcrypt-dev \
	libmemcached-dev \
	libpng12-dev \
	libpq-dev \
	libxml2-dev \
	&& rm -rf /var/lib/apt/lists/*

# https://docs.nextcloud.com/server/12/admin_manual/installation/source_installation.html#prerequisites-label
RUN docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
	&& git clone https://github.com/php-memcached-dev/php-memcached /usr/src/php/ext/memcached \
	&& cd /usr/src/php/ext/memcached \
	&& git checkout -b php7 origin/php7 \
	&& rm -rf .git \
	&& docker-php-ext-configure memcached \
	&& docker-php-ext-install ctype \
														dom \
														iconv \
														json \
														exif \
														gd \
														intl \
														ldap \
														mbstring \
														mcrypt \
														opcache \
														pdo_mysql \
														pdo_pgsql \
														pgsql \
														zip \
														memcached

# set recommended PHP.ini settings
# see https://secure.php.net/manual/en/opcache.installation.php
RUN { \
		echo 'opcache.memory_consumption=128'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=60'; \
		echo 'opcache.fast_shutdown=1'; \
		echo 'opcache.enable_cli=1'; \
	} > /usr/local/etc/php/conf.d/opcache-recommended.ini
RUN a2enmod rewrite

# PECL extensions
RUN set -ex \
	&& pecl install APCu-5.1.8 \
	&& pecl install redis-3.1.2 \
	&& docker-php-ext-enable apcu redis

ENV NEXTCLOUD_VERSION 12.0.0
VOLUME /var/www/html

RUN curl -fsSL -o nextcloud.tar.bz2 \
		"https://download.nextcloud.com/server/releases/nextcloud-${NEXTCLOUD_VERSION}.tar.bz2" \
	&& curl -fsSL -o nextcloud.tar.bz2.asc \
		"https://download.nextcloud.com/server/releases/nextcloud-${NEXTCLOUD_VERSION}.tar.bz2.asc" \
	&& export GNUPGHOME="$(mktemp -d)" \
	&& curl -fsSL -o nextcloud.asc "https://nextcloud.com/nextcloud.asc" \
	&& gpg --import nextcloud.asc \
	&& gpg --verify nextcloud.tar.bz2.asc nextcloud.tar.bz2 \
	&& rm -r "$GNUPGHOME" nextcloud.tar.bz2.asc \
	&& tar -xjf nextcloud.tar.bz2 -C /usr/src/ \
	&& rm nextcloud.tar.bz2

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]

FROM ubuntu:20.04

ENV DEFAULT_PHP_VERSION="7.1"

COPY php-qa-tools-install.sh /php-qa-tools-install.sh

RUN set -xe \
	&& DEBIAN_FRONTEND=noninteractive apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common \
	&& LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php \
	&& DEBIAN_FRONTEND=noninteractive apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
	# PHP Packages
	php7.1-cli php7.1-mysql php7.1-xml php7.1-zip php7.1-bz2 php7.1-curl php7.1-gd php7.1-mbstring php7.1-intl php7.1-ldap php7.1-bcmath php7.1-sqlite3 \
	php7.4-cli php7.4-mysql php7.4-xml php7.4-zip php7.4-bz2 php7.4-curl php7.4-gd php7.4-mbstring php7.4-intl php7.4-ldap php7.4-bcmath php7.4-sqlite3 \
	php8.0-cli php8.0-mysql php8.0-xml php8.0-zip php8.0-bz2 php8.0-curl php8.0-gd php8.0-mbstring php8.0-intl php8.0-ldap php8.0-bcmath php8.0-sqlite3 \
	php8.1-cli php8.1-mysql php8.1-xml php8.1-zip php8.1-bz2 php8.1-curl php8.1-gd php8.1-mbstring php8.1-intl php8.1-ldap php8.1-bcmath php8.1-sqlite3 \
	# Other Packages
	locate git subversion patch curl wget mysql-client unzip zip bzip2 sqlite3 python3 rsync \
	# PHP Settings
	&& ( \
	echo '; Local configuration for PHP' \
	echo '; priority=99' \
	echo 'date.timezone = "UTC"' \
	) | tee /etc/php/8.1/mods-available/local.ini \
	&& cp /etc/php/8.1/mods-available/local.ini /etc/php/8.0/mods-available/local.ini \
	&& cp /etc/php/8.1/mods-available/local.ini /etc/php/7.4/mods-available/local.ini \
	&& cp /etc/php/8.1/mods-available/local.ini /etc/php/7.1/mods-available/local.ini \
	&& phpenmod local \
	&& rm /etc/alternatives/php \
	&& ln -s /usr/bin/php$DEFAULT_PHP_VERSION /etc/alternatives/php \
	&& bash -x /php-qa-tools-install.sh \
	# Cleanup
	&& updatedb \
	&& rm /php-qa-tools-install.sh \
	&& rm -rf /var/lib/apt/lists/*

CMD ["php -a"]
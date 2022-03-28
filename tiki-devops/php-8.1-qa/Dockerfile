FROM ubuntu:20.04

COPY php-qa-tools-install.sh /php-qa-tools-install.sh

ENV PHP_VERSION=8.1

RUN set -xe \
	&& DEBIAN_FRONTEND=noninteractive apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common \
	&& LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php \
	&& DEBIAN_FRONTEND=noninteractive apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
	# PHP Packages
	php${PHP_VERSION}-cli php${PHP_VERSION}-mysql php${PHP_VERSION}-xml php${PHP_VERSION}-zip php${PHP_VERSION}-bz2 php${PHP_VERSION}-curl php${PHP_VERSION}-gd php${PHP_VERSION}-mbstring php${PHP_VERSION}-intl php${PHP_VERSION}-ldap php${PHP_VERSION}-bcmath php${PHP_VERSION}-sqlite3\
	# Other Packages
	git subversion patch curl wget mysql-client unzip zip bzip2 sqlite3 python3 rsync \
	# PHP Settings
	&& ( \
	echo '; Local configuration for PHP' \
	echo '; priority=99' \
	echo 'date.timezone = "UTC"' \
	) | tee /etc/php/${PHP_VERSION}/mods-available/local.ini \
	&& phpenmod local \
	&& bash -x /php-qa-tools-install.sh \
	# Cleanup
	&& rm /php-qa-tools-install.sh \
	&& rm -rf /var/lib/apt/lists/*

CMD ["php -a"]
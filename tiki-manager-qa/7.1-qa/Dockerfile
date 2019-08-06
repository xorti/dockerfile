FROM ubuntu:16.04

COPY php-qa-tools-install.sh /php-qa-tools-install.sh

RUN set -xe \
	&& echo 'deb http://ppa.launchpad.net/ondrej/php/ubuntu xenial main' > /etc/apt/sources.list.d/ondrej.list \
	&& LC_ALL=C.UTF-8 apt-key adv --recv-key --keyserver keyserver.ubuntu.com E5267A6C \
	&& DEBIAN_FRONTEND=noninteractive apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
		php7.1-cli php7.1-mysql php7.1-xml php7.1-zip php7.1-bz2 php7.1-curl php7.1-gd php7.1-mbstring php7.1-intl php7.1-mcrypt php7.1-ldap php7.1-sqlite3\
		php-xdebug git subversion patch curl wget mysql-client unzip zip bzip2 sqlite3 python3\
	&& ( \
		echo '; Local configuration for PHP' \
		echo '; priority=99' \
		echo 'date.timezone = "UTC"' \
	) | tee /etc/php/7.1/mods-available/local.ini \
	&& phpenmod local \
	&& bash -x /php-qa-tools-install.sh \
	&& rm /php-qa-tools-install.sh \
  && rm -rf /var/lib/apt/lists/*

CMD ["php -a"]

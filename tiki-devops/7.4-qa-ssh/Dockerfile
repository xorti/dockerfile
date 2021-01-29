FROM ubuntu:20.04

COPY php-qa-tools-install.sh /php-qa-tools-install.sh

RUN set -xe \
	&& DEBIAN_FRONTEND=noninteractive apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common \
	&& LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php \
	&& DEBIAN_FRONTEND=noninteractive apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
	php7.4-cli php7.4-mysql php7.4-xml php7.4-zip php7.4-bz2 php7.4-curl php7.4-gd php7.4-mbstring php7.4-intl php7.4-ldap php7.4-bcmath php7.4-sqlite3\
	php-xdebug git subversion patch curl wget mysql-client unzip zip bzip2 sqlite3 python3 ssh sshpass rsync\
	&& ( \
	echo '; Local configuration for PHP' \
	echo '; priority=99' \
	echo 'date.timezone = "UTC"' \
	) | tee /etc/php/7.4/mods-available/local.ini \
	&& phpenmod local \
	&& bash -x /php-qa-tools-install.sh \
	&& rm /php-qa-tools-install.sh \
	&& rm -rf /var/lib/apt/lists/*

RUN sed -i 's/^#PermitRootLogin .*/PermitRootLogin yes/' /etc/ssh/sshd_config \
	&& echo 'root:docker' | chpasswd \
	&& service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]

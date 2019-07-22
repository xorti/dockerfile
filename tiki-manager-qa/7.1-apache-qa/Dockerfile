FROM xorti/tiki-manager-qa:7.1-qa

RUN set -xe \
	&& echo 'deb http://ppa.launchpad.net/ondrej/php/ubuntu xenial main' > /etc/apt/sources.list.d/ondrej.list \
	&& LC_ALL=C.UTF-8 apt-key adv --recv-key --keyserver keyserver.ubuntu.com E5267A6C \
	&& DEBIAN_FRONTEND=noninteractive apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
	  apache2 \
  && rm -rf /var/lib/apt/lists/*

EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]

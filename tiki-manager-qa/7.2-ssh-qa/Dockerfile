FROM xorti/tiki-manager-qa:7.2-qa

RUN set -xe \
	&& echo 'deb http://ppa.launchpad.net/ondrej/php/ubuntu xenial main' > /etc/apt/sources.list.d/ondrej.list \
	&& LC_ALL=C.UTF-8 apt-key adv --recv-key --keyserver keyserver.ubuntu.com E5267A6C \
	&& DEBIAN_FRONTEND=noninteractive apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
		openssh-server\
	&& echo 'root:root' |chpasswd\
	&& sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config\
	&& mkdir /root/.ssh\
	&& mkdir -p /var/run/sshd\
  	&& rm -rf /var/lib/apt/lists/*

EXPOSE 22
CMD    ["/usr/sbin/sshd", "-D"]

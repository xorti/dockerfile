FROM xorti/tiki-devops:php-8.1-qa

RUN set -xe \
	&& DEBIAN_FRONTEND=noninteractive apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
	# SSH Packages
	ssh sshpass \
	&& \
	# SSH Settings
	sed -i 's/^#PermitRootLogin .*/PermitRootLogin yes/' /etc/ssh/sshd_config \
	&& echo 'root:docker' | chpasswd \
	&& service ssh start \
	# Cleanup
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]

FROM centos:centos7

USER root
RUN yum install -y gcc gcc-c++ \
#    libtool libtool-ltdl \
    make \
    git \
    pkgconfig \
    yum-utils rpm-build rpmdevtools \
    centos-release-scl-rh && \
    yum install openssl wget httpd rh-php71-php-cli rh-php71-php-mbstring rh-php71-php-pdo rh-php71-php-xml -y &&\
    yum clean all


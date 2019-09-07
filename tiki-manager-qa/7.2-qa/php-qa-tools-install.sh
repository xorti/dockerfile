#!/bin/bash

#
# Composer
#

EXPECTED_SIGNATURE=$(wget -q -O - https://composer.github.io/installer.sig)
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
then
    >&2 echo 'ERROR: Invalid installer signature'
    rm composer-setup.php
    exit 1
fi

php composer-setup.php --quiet --install-dir=/usr/local/bin --filename=composer
RESULT=$?
rm composer-setup.php
exit $RESULT

#
# PHP Unit
#

if [ $(php -r "echo version_compare(PHP_VERSION, '5.0.0', '>=') ? 'OK' : 'NOK';") == "OK" ] ; then
	wget -O /usr/local/bin/phpunit-4 https://phar.phpunit.de/phpunit-4.phar
	chmod a+x /usr/local/bin/phpunit-4
fi
if [ $(php -r "echo version_compare(PHP_VERSION, '5.6.0', '>=') ? 'OK' : 'NOK';") == "OK" ] ; then
	wget -O /usr/local/bin/phpunit-5 https://phar.phpunit.de/phpunit-5.phar
	chmod a+x /usr/local/bin/phpunit-5
fi
if [ $(php -r "echo version_compare(PHP_VERSION, '7.0.0', '>=') ? 'OK' : 'NOK';") == "OK" ] ; then
	wget -O /usr/local/bin/phpunit-6 https://phar.phpunit.de/phpunit-6.phar
	chmod a+x /usr/local/bin/phpunit-6
fi
if [ $(php -r "echo version_compare(PHP_VERSION, '7.1.0', '>=') ? 'OK' : 'NOK';") == "OK" ] ; then
	wget -O /usr/local/bin/phpunit-7 https://phar.phpunit.de/phpunit-7.phar
	chmod a+x /usr/local/bin/phpunit-7
fi

#
# Install Box
#

#curl -LSs https://box-project.github.io/box2/installer.php | php
#mv box.phar /usr/local/bin/box
#chmod a+x /usr/local/bin/box

#
# Install paralle lint
#

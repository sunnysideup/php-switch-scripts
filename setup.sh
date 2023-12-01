#!/bin/bash

echo "* Refreshing software repositories..."
sudo apt-get update > /dev/null
sudo apt-get update && sudo apt -y upgrade

echo "* Installing prerequisite software packages..."
sudo apt-get install -y software-properties-common > /dev/null

echo "* Setting up third-party repository to allow installation of multiple PHP versions..."
sudo add-apt-repository -y ppa:ondrej/php > /dev/null

echo "* Refreshing software repositories..."
sudo apt-get update > /dev/null

echo "* run again"
sudo apt update
sudo apt install lsb-release ca-certificates apt-transport-https software-properties-common -y
sudo add-apt-repository ppa:ondrej/php

# apache2 may cause issues 
sudo add-apt-repository ppa:ondrej/apache2
sudo apt update

echo "* Installing PHP 7.2 extensions..."
sudo apt-get install -y php7.2

sudo apt-get install -y php7.2-common

sudo apt-get install -y php7.2-bz2
sudo apt-get install -y php7.2-cli
sudo apt-get install -y php7.2-curl
sudo apt-get install -y php7.2-fpm
sudo apt-get install -y php7.2-gd
sudo apt-get install -y php7.2-intl
sudo apt-get install -y php7.2-json
sudo apt-get install -y php7.2-mbstring
sudo apt-get install -y php7.2-mysql
sudo apt-get install -y php7.2-opcache
sudo apt-get install -y php7.2-readline
sudo apt-get install -y php7.2-snmp
sudo apt-get install -y php7.2-soap
sudo apt-get install -y php7.2-sqlite3
sudo apt-get install -y php7.2-tidy
sudo apt-get install -y php7.2-xml
sudo apt-get install -y php7.2-xsl
sudo apt-get install -y php7.2-zip


echo "* Installing PHP 7.4 extensions..."
sudo apt-get install -y php7.4

sudo apt-get install -y php7.4-common

sudo apt-get install -y php7.4-bz2
sudo apt-get install -y php7.4-cli
sudo apt-get install -y php7.4-curl
sudo apt-get install -y php7.4-fpm
sudo apt-get install -y php7.4-gd
sudo apt-get install -y php7.4-intl
sudo apt-get install -y php7.4-json
sudo apt-get install -y php7.4-mbstring
sudo apt-get install -y php7.4-mysql
sudo apt-get install -y php7.4-opcache
sudo apt-get install -y php7.4-readline
sudo apt-get install -y php7.4-snmp
sudo apt-get install -y php7.4-soap
sudo apt-get install -y php7.4-sqlite3
sudo apt-get install -y php7.4-tidy
sudo apt-get install -y php7.4-xml
sudo apt-get install -y php7.4-xsl
sudo apt-get install -y php7.4-zip
sudo apt-get install -y php7.4-bcmath


echo "* Installing PHP 8.0 extensions..."
sudo apt-get install -y php8.0

sudo apt-get install -y php8.0-common

sudo apt-get install -y php8.0-bz2
sudo apt-get install -y php8.0-cli
sudo apt-get install -y php8.0-curl
sudo apt-get install -y php8.0-fpm
sudo apt-get install -y php8.0-gd
sudo apt-get install -y php8.0-intl
sudo apt-get install -y php8.0-json
sudo apt-get install -y php8.0-mbstring
sudo apt-get install -y php8.0-memcached
sudo apt-get install -y php8.0-mysql
sudo apt-get install -y php8.0-opcache
sudo apt-get install -y php8.0-readline
sudo apt-get install -y php8.0-snmp
sudo apt-get install -y php8.0-soap
sudo apt-get install -y php8.0-tidy
sudo apt-get install -y php8.0-xml
sudo apt-get install -y php8.0-xsl
sudo apt-get install -y php8.0-zip
sudo apt-get install -y php8.0-bcmath


echo "* Installing PHP 8.1 extensions..."
sudo apt-get install -y php8.1

sudo apt-get install -y php8.1-common

sudo apt-get install -y php8.1-bz2
sudo apt-get install -y php8.1-cli
sudo apt-get install -y php8.1-curl
sudo apt-get install -y php8.1-fpm
sudo apt-get install -y php8.1-gd
sudo apt-get install -y php8.1-intl
sudo apt-get install -y php8.1-json
sudo apt-get install -y php8.1-mbstring
sudo apt-get install -y php8.1-memcached
sudo apt-get install -y php8.1-mysql
sudo apt-get install -y php8.1-opcache
sudo apt-get install -y php8.1-readline
sudo apt-get install -y php8.1-snmp
sudo apt-get install -y php8.1-soap
sudo apt-get install -y php8.1-tidy
sudo apt-get install -y php8.1-tidy
sudo apt-get install -y php8.1-xml
sudo apt-get install -y php8.1-xsl
sudo apt-get install -y php8.1-zip
sudo apt-get install -y php8.1-bcmath



echo "* Installing PHP 8.2..."
sudo apt-get install -y php8.2

sudo apt-get install -y php8.2-common

sudo apt-get install -y php8.2-fpm
sudo apt-get install -y php8.2-cli
sudo apt-get install -y php8.2-intl
sudo apt-get install -y php8.2-snmp 
sudo apt-get install -y php8.2-memcached 
sudo apt-get install -y php8.2-mysql
sudo apt-get install -y php8.2-xml
sudo apt-get install -y php8.2-bz2 
sudo apt-get install -y php8.2-curl 
sudo apt-get install -y php8.2-gd 
sudo apt-get install -y php8.2-json 
sudo apt-get install -y php8.2-mbstring 
sudo apt-get install -y php8.2-opcache 
sudo apt-get install -y php8.2-readline 
sudo apt-get install -y php8.2-soap 
sudo apt-get install -y php8.2-tidy 
sudo apt-get install -y php8.2-xsl 
sudo apt-get install -y php8.2-zip 
sudo apt-get install -y php8.2-bcmath

echo "* Installing additional PHP extensions..."
sudo apt-get install -y php-memcache 
sudo apt-get install -y php-memcached 
sudo apt-get install -y php-redis


 sudo service apache2 restart
 sudo apt autoremove

echo "* Setup complete. You may now use the 'switch-to-php-*.*.sh' scripts."
echo "* Setup complete. You may now use the 'switch-to-php-*.*.sh' scripts."
echo "* Setup complete. You may now use the 'switch-to-php-*.*.sh' scripts."
echo "* Setup complete. You may now use the 'switch-to-php-*.*.sh' scripts."

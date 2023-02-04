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
sudo add-apt-repository ppa:ondrej/apache2
sudo apt update


echo "* Installing PHP 5.6..."
sudo apt-get install -y php5.6 php5.6-common php5.6-cli > /dev/null

echo "* Installing PHP 5.6 extensions..."
sudo apt-get install -y php5.6-curl php5.6-mcrypt php5.6-soap php5.6-bz2 php5.6-gd php5.6-mysql php5.6-sqlite3 php5.6-json php5.6-opcache php5.6-xml php5.6-mbstring php5.6-readline php5.6-xmlrpc php5.6-zip php-redis > /dev/null

echo "* Installing PHP 7.0..."
sudo apt-get install -y php7.0 php7.0-common php7.0-cli > /dev/null

echo "* Installing PHP 7.0 extensions..."
sudo apt-get install -y php7.0-gd php7.0-mysql php7.0-sqlite3 php7.0-soap php7.0-xsl php7.0-json php7.0-opcache php7.0-mbstring php7.0-readline php7.0-curl php7.0-mcrypt php7.0-xml php7.0-zip php-redis > /dev/null

echo "* Installing PHP 7.1..."
sudo apt-get install -y php7.1 php7.1-common php7.1-cli > /dev/null

echo "* Installing PHP 7.1 extensions..."
sudo apt-get install -y php7.1-gd php7.1-mysql php7.1-sqlite3 php7.1-soap php7.1-xsl php7.1-json php7.1-opcache php7.1-mbstring php7.1-readline php7.1-curl php7.1-mcrypt php7.1-xml php7.1-zip php-redis > /dev/null

echo "* Installing PHP 7.2..."
sudo apt-get install -y php7.2 php7.2-common php7.2-cli > /dev/null

echo "* Installing PHP 7.2 extensions..."
sudo apt-get install -y php7.2-bz2 php7.2-curl php7.2-gd php7.2-json php7.2-mbstring php7.2-mysql php7.2-opcache php7.2-readline php7.2-soap php7.2-sqlite3 php7.2-tidy php7.2-xml php7.2-xsl php7.2-zip > /dev/null

echo "* Installing PHP 7.3..."
sudo apt-get install -y php7.3 php7.3-common php7.3-cli > /dev/null

echo "* Installing PHP 7.3 extensions..."
sudo apt-get install -y php7.3-bz2 php7.3-curl php7.3-gd php7.3-json php7.3-mbstring php7.3-mysql php7.3-opcache php7.3-readline php7.3-soap php7.3-sqlite3 php7.3-tidy php7.3-xml php7.3-xsl php7.3-zip > /dev/null

echo "* Installing PHP 7.4..."
sudo apt-get install -y php7.4 php7.4-common php7.4-cli > /dev/null

echo "* Installing PHP 7.4 extensions..."
sudo apt-get install -y php7.4 php7.4-common php7.4-cli > /dev/null
sudo apt-get install -y php7.4-bz2 php7.4-curl php7.4-gd php7.4-json php7.4-mbstring php7.4-mysql php7.4-opcache php7.4-readline php7.4-soap php7.4-sqlite3 php7.4-tidy php7.4-xml php7.4-xsl php7.4-zip > /dev/null
sudo apt-get install -y php7.4-mbregex
sudo apt-get install -y php7.4-mbstring
sudo apt-get install -y php7.4-curl
sudo apt-get install -y php7.4-intl
sudo apt-get install -y php7.4-xml

echo "* Installing PHP 8.0..."
sudo apt-get install -y php8.0
sudo apt-get install -y php8.0-fpm
sudo apt-get install -y php8.0-common
sudo apt-get install -y php8.0-cli
sudo apt-get install -y php8.0-intl
sudo apt-get install -y php8.0-snmp 
sudo apt-get install -y php8.0-memcached 
sudo apt-get install -y php8.0-mysql
sudo apt-get install -y php8.0-xml
sudo apt-get install -y php8.0-bz2 
sudo apt-get install -y php8.0-curl 
sudo apt-get install -y php8.0-gd 
sudo apt-get install -y php8.0-json 
sudo apt-get install -y php8.0-mbstring 
sudo apt-get install -y php8.0-opcache 
sudo apt-get install -y php8.0-readline 
sudo apt-get install -y php8.0-soap 
sudo apt-get install -y php8.0-tidy 
sudo apt-get install -y php8.0-xsl 
sudo apt-get install -y php8.0-zip 


echo "* Installing PHP 8.1..."
sudo apt-get install -y php8.1
sudo apt-get install -y php8.1-fpm
sudo apt-get install -y php8.1-common
sudo apt-get install -y php8.1-cli
sudo apt-get install -y php8.1-intl
sudo apt-get install -y php8.1-snmp 
sudo apt-get install -y php8.1-memcached 
sudo apt-get install -y php8.1-mysql
sudo apt-get install -y php8.1-xml
sudo apt-get install -y php8.1-bz2 
sudo apt-get install -y php8.1-curl 
sudo apt-get install -y php8.1-gd 
sudo apt-get install -y php8.1-json 
sudo apt-get install -y php8.1-mbstring 
sudo apt-get install -y php8.1-opcache 
sudo apt-get install -y php8.1-readline 
sudo apt-get install -y php8.1-soap 
sudo apt-get install -y php8.1-tidy 
sudo apt-get install -y php8.1-xsl 
sudo apt-get install -y php8.1-zip 


echo "* Installing PHP 8.2..."
sudo apt-get install -y php8.2
sudo apt-get install -y php8.2-fpm
sudo apt-get install -y php8.2-common
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



# sudo a2enmod proxy_fcgi setenvif
 
# sudo a2enconf php8.0-fpm
# sudo a2enconf php8.1-fpm
# sudo a2enconf php8.2-fpm

 sudo service apache2 restart
 sudo apt autoremove

echo "* Installing additional PHP extensions..."
sudo apt-get install -y php-memcache php-memcached php-redis  > /dev/null

echo "* Setup complete. You may now use the 'switch-to-php-*.*.sh' scripts."

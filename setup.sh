#!/bin/bash

echo "* Refreshing software repositories and upgrading..."
sudo apt-get update -q && sudo apt-get upgrade -y -q > /dev/null

echo "* Installing prerequisite software packages..."
sudo apt-get install -y -q software-properties-common lsb-release ca-certificates apt-transport-https > /dev/null

echo "* Setting up third-party repositories for PHP and Apache..."
sudo add-apt-repository -y ppa:ondrej/php > /dev/null
sudo add-apt-repository -y ppa:ondrej/apache2 > /dev/null
sudo apt-get update -q > /dev/null

# Define PHP versions and extensions
php_versions=("7.2" "7.4" "8.0" "8.1" "8.2" "8.3" "8.4")
php_extensions=("common" "bz2" "cli" "curl" "fpm" "gd" "intl" "mbstring" "mysql" "opcache" "readline" "snmp" "soap" "sqlite3" "tidy" "xml" "xsl" "zip" "bcmath" "memcached" "zip")

# Loop through PHP versions and install extensions
for version in "${php_versions[@]}"; do
    echo "* Installing PHP $version and extensions..."
    
    # Build the package list for this PHP version
    php_packages=()
    for ext in "${php_extensions[@]}"; do
        php_packages+=("php$version-$ext")
    done
    
    # Install all packages for this PHP version in one command
	echo "${php_packages[@]}"
    sudo apt-get install -y -q "${php_packages[@]}" > /dev/null
done

# Install additional shared PHP extensions
echo "* Installing additional PHP extensions..."
sudo apt-get install -y -q php-memcache php-memcached php-redis > /dev/null
sudo apt-get install -y -q php7.2-json > /dev/null
sudo apt-get install -y -q php7.4-json > /dev/null

# Clean up
echo "* Cleaning up..."
sudo apt-get autoremove -y -q > /dev/null
sudo service apache2 restart > /dev/null

echo "* Setup complete. You may now use the 'switch-to-php-*.*.sh' scripts."

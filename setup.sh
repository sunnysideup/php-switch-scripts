#!/bin/bash

LOGFILE='/var/log/php-setup-errors.log'

# Make sure log file exists and is writable
sudo touch "$LOGFILE"
sudo chmod 664 "$LOGFILE"

echo "* Refreshing software repositories and upgrading..."
sudo apt-get update -q > /dev/null 2>> "$LOGFILE"
sudo apt-get upgrade -y -q > /dev/null 2>> "$LOGFILE"

echo "* Installing prerequisite software packages..."
sudo apt-get install -y -q software-properties-common lsb-release ca-certificates apt-transport-https \
    > /dev/null 2>> "$LOGFILE"

echo "* Setting up third-party repositories for PHP and Apache..."
sudo add-apt-repository -y ppa:ondrej/php     > /dev/null 2>> "$LOGFILE"
sudo add-apt-repository -y ppa:ondrej/apache2 > /dev/null 2>> "$LOGFILE"
sudo apt-get update -q > /dev/null 2>> "$LOGFILE"

# Define PHP versions and extensions
php_versions=("7.2" "7.4" "8.0" "8.1" "8.2" "8.3" "8.4")
php_extensions=("common" "bz2" "cli" "curl" "fpm" "gd" "intl" "mbstring" "mysql" "opcache" "readline" "snmp" "soap" "sqlite3" "tidy" "xml" "xsl" "zip" "bcmath" "memcached" "zip")

echo "* Installing PHP versions and extensions..."

# Loop through PHP versions and install extensions
for version in "${php_versions[@]}"; do
    echo "  - PHP $version"

    # install matching Apache module (only exists for some versions)
    sudo apt-get install -y -q "libapache2-mod-php$version" \
        > /dev/null 2>> "$LOGFILE"

    php_packages=()
    for ext in "${php_extensions[@]}"; do
        php_packages+=("php$version-$ext")
    done

    echo "    Installing: ${php_packages[*]}"
    sudo apt-get install -y -q "${php_packages[@]}" \
        > /dev/null 2>> "$LOGFILE"
done

echo "* Installing additional PHP extensions..."
sudo apt-get install -y -q php-memcache php-memcached php-redis \
    > /dev/null 2>> "$LOGFILE"

sudo apt-get install -y -q php7.2-json > /dev/null 2>> "$LOGFILE"
sudo apt-get install -y -q php7.4-json > /dev/null 2>> "$LOGFILE"

echo "* Cleaning up..."
sudo apt-get autoremove -y -q > /dev/null 2>> "$LOGFILE"
sudo service apache2 restart > /dev/null 2>> "$LOGFILE"

echo "* Setup complete. Errors (if any) logged to $LOGFILE"
echo "* You may now use the 'switch-to-php-*.*.sh' scripts."

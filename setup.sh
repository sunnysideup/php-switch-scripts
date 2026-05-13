#!/bin/bash

LOGFILE='/var/log/php-setup-errors.log'

# ─────────────────────────────────────────────
# Helpers
# ─────────────────────────────────────────────
log()  { echo "$1"; }
err()  { echo "  [ERROR] $1" | tee -a "$LOGFILE"; }
run()  { "$@" > /dev/null 2>> "$LOGFILE"; }

sudo touch "$LOGFILE"
sudo chmod 664 "$LOGFILE"
echo "" >> "$LOGFILE"
echo "=== PHP Setup Run: $(date) ===" >> "$LOGFILE"

# ─────────────────────────────────────────────
# System update & prerequisites
# ─────────────────────────────────────────────
log "* Refreshing repositories and upgrading system..."
run sudo apt-get update -q
run sudo apt-get upgrade -y -q

log "* Installing prerequisite packages..."
run sudo apt-get install -y -q \
    software-properties-common \
    lsb-release \
    ca-certificates \
    apt-transport-https

# ─────────────────────────────────────────────
# Repos
# ─────────────────────────────────────────────
log "* Adding ondrej/php and ondrej/apache2 PPAs..."
run sudo add-apt-repository -y ppa:ondrej/php
run sudo add-apt-repository -y ppa:ondrej/apache2
run sudo apt-get update -q

# ─────────────────────────────────────────────
# Detect all available PHP versions from apt
# rather than maintaining a hardcoded list
# ─────────────────────────────────────────────
log "* Detecting available PHP versions..."
available_versions=$(apt-cache search --names-only '^php[0-9]+\.[0-9]+-cli$' \
    | grep -oP 'php\K[\d.]+' \
    | sort -V)

if [ -z "$available_versions" ]; then
    err "No PHP versions found in apt. Did the PPA add correctly?"
    exit 1
fi

log "  Found: $(echo $available_versions | tr '\n' ' ')"

# ─────────────────────────────────────────────
# Extensions to install for every version
# Note: snmp excluded — causes systemd startup hangs
#       zip deduplicated
#       json excluded — built into PHP 8.0+, handled separately below
# ─────────────────────────────────────────────
php_extensions=(
    "common"
    "bcmath"
    "bz2"
    "cli"
    "curl"
    "fpm"
    "gd"
    "intl"
    "mbstring"
    "mysql"
    "opcache"
    "readline"
    "soap"
    "sqlite3"
    "tidy"
    "xml"
    "xsl"
    "zip"
    "imagick"
    "redis"
    "memcached"
)

# ─────────────────────────────────────────────
# Install PHP versions
# ─────────────────────────────────────────────
log "* Installing PHP versions and extensions..."

for version in $available_versions; do
    log "  - PHP $version"

    packages=()

    # Apache module (not available for all versions, failure is OK)
    apache_mod="libapache2-mod-php$version"
    if apt-cache show "$apache_mod" > /dev/null 2>&1; then
        packages+=("$apache_mod")
    fi

    # Core extensions
    for ext in "${php_extensions[@]}"; do
        pkg="php$version-$ext"
        if apt-cache show "$pkg" > /dev/null 2>&1; then
            packages+=("$pkg")
        fi
    done

    # json: separate package in PHP 7.x, built-in from 8.0+
    if [[ "$version" == 7.* ]]; then
        if apt-cache show "php$version-json" > /dev/null 2>&1; then
            packages+=("php$version-json")
        fi
    fi

    if [ ${#packages[@]} -eq 0 ]; then
        err "No packages found for PHP $version, skipping."
        continue
    fi

    if ! run sudo apt-get install -y -q "${packages[@]}"; then
        err "Some packages failed for PHP $version — check $LOGFILE"
    fi

    # ── Apply systemd Type=simple fix ──────────
    # Prevents FPM hanging forever waiting for a notify signal
    override_dir="/etc/systemd/system/php${version}-fpm.service.d"
    override_file="$override_dir/override.conf"
    if [ ! -f "$override_file" ] || ! grep -q "Type=simple" "$override_file"; then
        sudo mkdir -p "$override_dir"
        sudo bash -c "cat > $override_file << EOF
[Service]
Type=simple
EOF"
        log "    Applied Type=simple systemd override"
    fi

    # ── Disable SNMP ───────────────────────────
    # SNMP causes startup hangs when MIB files are missing
    run sudo phpdismod -v "$version" snmp

done

# ─────────────────────────────────────────────
# Shared extensions (version-agnostic)
# ─────────────────────────────────────────────
log "* Installing shared PHP extensions..."
run sudo apt-get install -y -q php-memcache php-memcached php-redis

# ─────────────────────────────────────────────
# Finalise
# ─────────────────────────────────────────────
log "* Reloading systemd and restarting Apache..."
run sudo systemctl daemon-reload
run sudo service apache2 restart

log "* Cleaning up..."
run sudo apt-get autoremove -y -q
run sudo apt-get clean -q

# ─────────────────────────────────────────────
# Summary
# ─────────────────────────────────────────────
echo ""
echo "================================================"
echo "  Installed PHP Versions"
echo "================================================"
for version in $available_versions; do
    binary="/usr/bin/php$version"
    if [ -f "$binary" ]; then
        ver_string=$($binary -r 'echo PHP_VERSION;' 2>/dev/null)
        echo "  php$version → $ver_string"
    fi
done

echo ""
echo "* Setup complete."
echo "* Errors (if any) logged to $LOGFILE"
echo "* Run 'php-switch <version>' to activate a version."
echo ""

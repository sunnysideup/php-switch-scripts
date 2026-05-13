# php-switch

> Install every version of PHP you'll ever need — and switch between them instantly.

Built for Ubuntu/Debian developers who juggle multiple projects across different PHP versions. One setup script, one command to switch.

---

## Quick Start

```shell
git clone https://github.com/sunnysideup/php-switch-scripts.git
cd php-switch
sudo bash setup.sh
cd -
rm ./php-switch -rf
```

That's it. Every available PHP version will be installed and ready to use.

---

## Switching Versions

```shell
php-switch 8.3
```

```
* Switching to PHP 8.3...
  - Disabling Apache module: php8.1
  - Enabling Apache module: php8.3
  - Restarting Apache...
  - Switching CLI PHP to 8.3...
  - Starting php8.3-fpm...

* Done. Now running:
PHP 8.3.x (cli)
```

One command switches Apache, PHP-FPM, and the CLI — all at once.

---

## What Gets Installed

`setup.sh` automatically detects every PHP version available in the [ondrej/php](https://launchpad.net/~ondrej/+archive/ubuntu/php) PPA and installs them all, including:

| Extension | Extension | Extension |
|-----------|-----------|-----------|
| bcmath | bz2 | cli |
| common | curl | fpm |
| gd | imagick | intl |
| mbstring | memcached | mysql |
| opcache | readline | redis |
| soap | sqlite3 | tidy |
| xml | xsl | zip |

Version-specific handling is automatic — for example, `json` is installed as a separate package on PHP 7.x (where it's built-in on 8.x), and `snmp` is intentionally excluded as it causes startup issues when MIB files are missing.

---

## What `php-switch` Does

When you run `php-switch <version>` it:

1. Disables all active PHP Apache modules
2. Enables the Apache module for the target version
3. Restarts Apache
4. Updates the CLI `php` binary via `update-alternatives`
5. Stops other PHP-FPM versions to free memory
6. Starts the target PHP-FPM cleanly
7. Confirms the switch with `php -v`

---

## System Update

A `php-switch-system-update` script is also included that runs a full apt upgrade cycle and re-applies all PHP fixes afterwards (apt upgrades can occasionally reset service files):

```shell
php-switch-system-update
```

---

## Requirements

- Ubuntu 20.04 / 22.04 / 24.04 (or compatible Debian-based distro)
- Apache2
- `sudo` access

---

## Scripts

| Script | Location | Purpose |
|--------|----------|---------|
| `setup.sh` | repo root | One-time install of all PHP versions |
| `php-switch` | `/usr/local/bin/php-switch` | Switch active PHP version |
| `php-switch-system-update` | `/usr/local/bin/php-switch-system-update` | Full system update with PHP fixes |

---

## Logs

Installation errors are written to:

```
/var/log/php-setup-errors.log
```

---

## License

MIT

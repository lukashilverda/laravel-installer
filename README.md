# Laravel Ubuntu Installer

A simple Bash script that installs Laravel and all required dependencies on a fresh Ubuntu installation.

## Features

* Installs PHP and common Laravel extensions
* Installs Composer
* Installs the Laravel Installer
* Automatically configures the PATH
* Displays installation progress
* Works on Ubuntu and Ubuntu WSL

---

## Requirements

* Ubuntu 22.04 or newer
* Internet connection
* User account with sudo privileges

---

## Installation

Clone the repository:

```bash
git clone https://github.com/yourusername/laravel-installer.git
cd laravel-installer
```

Make the script executable:

```bash
chmod +x install-laravel.sh
```

Run the installer:

```bash
./install-laravel.sh
```

---

## What Gets Installed

### System Packages

* curl
* unzip
* git
* software-properties-common

### PHP

* php
* php-cli
* php-common
* php-curl
* php-mbstring
* php-xml
* php-zip
* php-bcmath
* php-intl
* php-sqlite3

### Development Tools

* Composer
* Laravel Installer

---

## Verify Installation

Check PHP:

```bash
php --version
```

Check Composer:

```bash
composer --version
```

Check Laravel:

```bash
laravel --version
```

---

## Creating a New Laravel Project

Using the Laravel Installer:

```bash
laravel new my-project
```

Or using Composer:

```bash
composer create-project laravel/laravel my-project
```

---

## Troubleshooting

### "laravel: command not found"

Reload your shell:

```bash
source ~/.bashrc
```

Or open a new terminal window.

### "php: command not found"

Verify PHP is installed:

```bash
php --version
```

If PHP is missing, rerun the installer.

### PATH Issues

Verify the Laravel installer directory is included in PATH:

```bash
echo $PATH
```

You should see:

```bash
$HOME/.config/composer/vendor/bin
```

---

## License

MIT License

#!/bin/bash

# =====================================================
# Laravel Full Installer for Ubuntu
# Installs:
# - PHP
# - Composer
# - Laravel Installer
# - Required PHP extensions
# - PATH configuration
# =====================================================

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

TOTAL_STEPS=8
CURRENT_STEP=0

progress() {
    CURRENT_STEP=$((CURRENT_STEP + 1))
    PERCENT=$((CURRENT_STEP * 100 / TOTAL_STEPS))

    FILLED=$((PERCENT / 5))
    EMPTY=$((20 - FILLED))

    printf "\n${BLUE}["
    printf "%0.s#" $(seq 1 $FILLED)
    printf "%0.s-" $(seq 1 $EMPTY)
    printf "] %d%%${NC}\n" "$PERCENT"
}

echo -e "${GREEN}"
echo "====================================="
echo " Laravel Ubuntu Installer"
echo "====================================="
echo -e "${NC}"

# -----------------------------------------------------
# Step 1 - Update package lists
# -----------------------------------------------------
progress
echo "Updating package lists..."
sudo apt update

# -----------------------------------------------------
# Step 2 - Install system dependencies
# -----------------------------------------------------
progress
echo "Installing system dependencies..."
sudo apt install -y \
    curl \
    unzip \
    git \
    software-properties-common

# -----------------------------------------------------
# Step 3 - Install PHP and extensions
# -----------------------------------------------------
progress
echo "Installing PHP..."

sudo apt install -y \
    php \
    php-cli \
    php-common \
    php-curl \
    php-mbstring \
    php-xml \
    php-zip \
    php-bcmath \
    php-intl \
    php-sqlite3

# -----------------------------------------------------
# Step 4 - Install Composer
# -----------------------------------------------------
progress
echo "Installing Composer..."

if ! command -v composer >/dev/null 2>&1; then
    curl -sS https://getcomposer.org/installer \
        | php

    sudo mv composer.phar /usr/local/bin/composer
fi

# -----------------------------------------------------
# Step 5 - Install Laravel Installer
# -----------------------------------------------------
progress
echo "Installing Laravel Installer..."

composer global require laravel/installer

# -----------------------------------------------------
# Step 6 - Configure PATH
# -----------------------------------------------------
progress
echo "Configuring PATH..."

COMPOSER_BIN="$HOME/.config/composer/vendor/bin"

if ! grep -q "$COMPOSER_BIN" ~/.bashrc 2>/dev/null; then
    echo "" >> ~/.bashrc
    echo "# Laravel Installer" >> ~/.bashrc
    echo "export PATH=\"\$PATH:$COMPOSER_BIN\"" >> ~/.bashrc
fi

export PATH="$PATH:$COMPOSER_BIN"

# -----------------------------------------------------
# Step 7 - Verify installations
# -----------------------------------------------------
progress
echo "Verifying installations..."

php --version
composer --version

# -----------------------------------------------------
# Step 8 - Verify Laravel
# -----------------------------------------------------
progress
echo "Checking Laravel..."

if command -v laravel >/dev/null 2>&1; then
    laravel --version
else
    echo -e "${RED}Laravel command not found.${NC}"
    echo "Open a new terminal and run:"
    echo "source ~/.bashrc"
fi

echo
echo -e "${GREEN}====================================="
echo " Installation Complete!"
echo "====================================="
echo -e "${NC}"

echo "Create a project with:"
echo
echo "    laravel new my-project"
echo
echo "or"
echo
echo "    composer create-project laravel/laravel my-project"
echo

#!/bin/bash

apt-get update
apt-get install -y git zip sudo vim
apt-get install -y zlib1g-dev g++ libicu-dev libzip-dev
docker-php-ext-install intl opcache pdo pdo_mysql
pecl install apcu
pecl install xdebug
docker-php-ext-enable apcu
docker-php-ext-enable xdebug
docker-php-ext-configure zip
docker-php-ext-install zip

# Installing composer
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Installing symfony installer
curl -sS https://get.symfony.com/cli/installer | bash
mv /root/.symfony/bin/symfony /usr/local/bin/symfony

# Creating project user
useradd -rm -d /home/project -s /bin/bash -g root -G sudo -u 1000 project
echo 'project:project' | chpasswd
echo 'project ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

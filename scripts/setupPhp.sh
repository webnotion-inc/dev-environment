#!/bin/bash

function init {
  sudo apt-get install php -y
  sudo apt-get install composer -y
  cd /vagrant
  composer init --name=webnotion/dev-environemnt --type=project --license=MIT --stability=stable --author="Webnotion <info@webnotion.eu>" --require=symfony/yaml:5.2 --no-interaction
  composer install --no-interaction
}

init

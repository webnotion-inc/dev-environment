#!/bin/bash

SETUP_DIR=$2

function init() {
  echo '##### Setting up environment'
  sudo apt-get update

  sudo mkdir -p /var/www
  sudo chown vagrant:vagrant /var/www

  sudo mkdir -p /var/setup
  sudo chown vagrant:vagrant /var/setup
}

init

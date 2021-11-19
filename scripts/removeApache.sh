#!/bin/bash

function init() {
  echo '##### Removing apache from debian'
  # Stop and remove apache, otherwise port 80 is not free for docker containers
  sudo service apache2 stop
  sudo apt-get purge apache2 -y
  sudo apt-get purge apache2-utils -y
}

init

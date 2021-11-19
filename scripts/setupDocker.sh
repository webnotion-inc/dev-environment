#!/bin/bash

function init {
  echo '### Installing and configuring docker'
  sudo apt-get install docker -y
  sudo apt-get install docker-compose -y
  sudo groupadd -f docker
  sudo usermod -aG docker vagrant
}

init

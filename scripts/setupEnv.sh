#!/bin/bash

PROJECTS_DIR=$1
SETUP_DIR=$2

function init() {
  echo '##### Setting up environment'
  sudo apt-get update

  sudo mkdir -p $PROJECTS_DIR
  sudo chown vagrant:vagrant $PROJECTS_DIR

  sudo mkdir -p $SETUP_DIR
  sudo chown vagrant:vagrant $SETUP_DIR
}

init

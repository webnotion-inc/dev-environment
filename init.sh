#!/bin/bash

set -e
set -x

PROJECTS_DIR="/var/www"
SETUP_DIR="/var/setup"

/vagrant/scripts/setupEnv.sh $PROJECTS_DIR $SETUP_DIR
/vagrant/scripts/setupNfs.sh
/vagrant/scripts/setupSSH.sh
/vagrant/scripts/setupDocker.sh
/vagrant/scripts/setupPhp.sh
/vagrant/scripts/setupGit.php
/vagrant/scripts/removeApache.sh
/vagrant/scripts/setupProjects.php

echo "cd $PROJECTS_DIR" >> /home/vagrant/.bashrc

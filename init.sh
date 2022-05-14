#!/bin/bash

set -e
set -x

source /vagrant/tools/bash/load_dot_env.sh
loadDotEnv '/vagrant'

/vagrant/scripts/setupEnv.sh
/vagrant/scripts/setupNfs.sh
/vagrant/scripts/setupSSH.sh
/vagrant/scripts/setupDocker.sh
/vagrant/scripts/setupPhp.sh
/vagrant/scripts/setupGit.php
/vagrant/scripts/removeApache.sh
/vagrant/scripts/setupProjects.php

echo "cd /var/www" >> /home/vagrant/.bashrc

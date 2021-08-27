#!/bin/bash

echo '##### Setting up SSH keys'
cp /vagrant/.ssh/id_rsa /home/vagrant/.ssh/id_rsa
cp /vagrant/.ssh/id_rsa.pub /home/vagrant/.ssh/id_rsa.pub
chown vagrant:vagrant /home/vagrant/.ssh/id_rsa
chown vagrant:vagrant /home/vagrant/.ssh/id_rsa.pub
eval $(ssh-agent) && ssh-add /home/vagrant/.ssh/id_rsa

echo '##### Configuring SSH'

# expose x11 to docker containers for GUI apps inside docker
sudo chmod o+w /etc/ssh/sshd_config
sudo sed -ri 's#^X11UseLocalhost.*$##g' /etc/ssh/sshd_config
sudo echo 'X11UseLocalhost no' >> /etc/ssh/sshd_config

# listen only on primary addresses to keep port 22 free for all docker IPs
### IPs hardcoded while normal acquisition does not work on jessie
sudo chmod o+w /etc/default/ssh
sudo echo 'SSHD_OPTS="-o ListenAddress=10.0.2.15 -o ListenAddress=10.24.0.2"' >> /etc/default/ssh
sudo chmod o+w /etc/ssh/sshd_config
sudo sed -ri 's/^Port.*$/#\0/g' /etc/ssh/sshd_config
### Don't allow locale env variables
sudo sed -ri 's/AcceptEnv LANG.*//' /etc/ssh/sshd_config
sudo service sshd restart

## dont check host keys to avoid annoying questions
sudo touch /home/vagrant/.ssh/config
sudo chown vagrant:vagrant /home/vagrant/.ssh/config
sudo echo -e "StrictHostKeyChecking no\n" > /home/vagrant/.ssh/config

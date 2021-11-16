#!/bin/bash

function init {
  echo "### Install nfs and configure share ..."
  sudo apt-get install -y nfs-kernel-server nfs-common
  sudo chmod o+w /etc/exports
  sudo chmod o+w /etc/default/nfs-kernel-server
  sudo echo "/var/www *(rw,async,all_squash,anonuid=1000,anongid=1000,insecure,nohide,crossmnt)" > /etc/exports
  sudo echo -e '\n# hack to force nfs v3 (remote file lock problem)\nRPCNFSDCOUNT="$RPCNFSDCOUNT --no-nfs-version 4"\n' >> /etc/default/nfs-kernel-server
  sudo systemctl enable rpcbind.service
  # rpc-statd.service needs to be enabled for MacOS to mount the disk
  sudo systemctl enable rpc-statd.service
  sudo systemctl restart nfs-kernel-server
}

init

#!/bin/bash

function downloadRemoteHostsFile() {
  echo -e "\n## Downloading /etc/hosts file from VM"
  scp $(vagrant ssh-config | awk 'NR>1 {print " -o "$1"="$2}') vagrant@10.24.8.2:/etc/hosts ./vagrant_hosts
}

function copyHostsToLocalHostsFile() {
  echo -e "\n## Copying downloaded hosts to local machine /etc/hosts file"
  lineNumber=1
  while read line; do
    if [ $lineNumber -gt 6 ]; then

      if ! grep -q "$line" "/etc/hosts"; then
         echo $line | sudo tee -a /etc/hosts;
      fi

    fi

    lineNumber=$((lineNumber+1))
  done < ./vagrant_hosts
}

function removeDownloadedRemoteHostsFile() {
  echo -e "\n## Removing downloaded /etc/hosts file"
  rm -f ./vagrant_hosts
}

downloadRemoteHostsFile
copyHostsToLocalHostsFile
removeDownloadedRemoteHostsFile

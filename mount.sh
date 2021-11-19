#!/bin/bash

source ./tools/bash/load_dot_env.sh
loadDotEnv

echo 'Mounting projects path on path: '${LOCAL_PROJECTS_PATH}
mkdir -p ${LOCAL_PROJECTS_PATH}
sudo mount -t nfs -o vers=3 -o nolocks ${VM_IP}:/var/www ${LOCAL_PROJECTS_PATH}

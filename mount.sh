#!/bin/bash

set -e
set -x

mkdir -p  ~/Desktop/Webnotion/projects
sudo mount -t nfs -o vers=3 -o nolocks 10.24.0.2:/var/www ~/Desktop/Webnotion/projects

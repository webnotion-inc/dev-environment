#!/bin/bash

set -e
set -x

mkdir -p  ~/Desktop/Persokit/projects
sudo mount -t nfs -o vers=3 -o nolocks 10.24.8.2:/var/www ~/Desktop/Persokit/projects

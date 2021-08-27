#!/bin/bash

set -e
set -x

sudo mount -t nfs -o vers=3 -o nolocks 10.24.1.2:/var/www /Users/dainiusslezas/webnotion-projects


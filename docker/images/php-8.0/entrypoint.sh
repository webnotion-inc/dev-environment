#!/bin/bash

function run_boot_script() {
  if [ ! -z "$BOOT_SCRIPT" ];
  then
    echo "Development environment boot script is defined. Executing..."
    $BOOT_SCRIPT
  else
      echo "Development environment boot script is NOT defined. Ignoring..."
  fi
}

run_boot_script

# Start PHP FPM
php-fpm

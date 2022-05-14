#!/bin/bash

function loadDotEnv() {
  root_path=$1
  source "${root_path}/tools/bash/colors.sh"

  if [ -f "${root_path}/.env" ]
  then
    export $(cat .env | sed 's/#.*//g' | xargs)
  else
    echo -e "${COLOR_RED}Missing .env file in project root${COLOR_END}"
    exit 1
  fi
}

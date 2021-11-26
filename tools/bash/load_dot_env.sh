#!/bin/bash


function loadDotEnv() {
  if [ -f .env ]
  then
    export $(cat .env | sed 's/#.*//g' | xargs)
  fi
}

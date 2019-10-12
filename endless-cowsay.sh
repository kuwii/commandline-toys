#!/bin/bash

TIME=10

while [ -n "$1" ];
do
  case "$1" in
    -t|--time)
      TIME=$2
      MATCH="^[0-9]+(\.[0-9]+)?[smhd]?$"
      if [[ "$TIME" =~ $MATCH ]]
      then
        shift 2
      else
        echo "Error: invalid time interval \"$TIME\"."
        exit 1
      fi
      ;;
    -h|--help)
      echo "Usage: endless-cowsay [-t timeInterval]"
      exit 1
      ;;
    *)
      echo "Error: invalid parameter \"$1\"."
      echo "Use --help to get usage."
      exit 1
      ;;
  esac
done

clear
while true; do
  fortune | cowsay
  echo ""
  echo ""
  echo ""
  sleep $TIME
done


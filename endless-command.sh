#!/bin/bash

TIME=1
CMD='echo "hello, world"'

# /^[0-9][0-9]*/

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
    -c|--command)
      CMD=$2
      shift 2
      ;;
    -h|--help)
      echo "endless-command is a script that will repeatly run given command forever."
      echo "Usage: endless [-t timeInterval] [-c command]"
      exit 1
      ;;
    *)
      echo "Error: invalid parameter \"$1\"."
      echo "Use --help to get usage."
      exit 1
      ;;
  esac
done

while true; do
  eval $CMD
  sleep $TIME
done


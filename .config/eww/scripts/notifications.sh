#!/bin/bash



write () {
  TEXT_FILE="$HOME/.cache/eww-notif"

  echo "a"
}

get () {
  TEXT_FILE="$HOME/.cache/eww-notif"
  cat "$TEXT_FILE"
}

clear () {
  TEXT_FILE="$HOME/.cache/eww-notif"
  printf "" > "$TEXT_FILE"
}

if [ "$1" == "write" ]; then
  write
elif [ "$1" == "get" ]; then
  get
elif [ "$1" == "clear" ]; then
  clear
fi
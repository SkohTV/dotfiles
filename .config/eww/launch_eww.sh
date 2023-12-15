#!/bin/bash


# Restart eww
if [[ ! $(pidof eww) ]]; then
  eww daemon
  sleep 1
fi

eww close bar
eww open bar

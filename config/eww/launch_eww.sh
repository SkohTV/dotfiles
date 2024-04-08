#!/usr/bin/env bash

# Restart eww
if [[ ! $(pidof eww) ]]; then
  eww daemon
fi

eww open bar
eww open bar2

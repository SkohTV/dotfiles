#!/usr/bin/env bash

# Restart eww
if [[ ! $(pidof eww) ]]; then
  eww daemon
fi

# Close all
eww close-all


# Start
eww open bar


# Set default vals
if [[ $(pidof gammastep) ]]; then
  eww update night=true
else
  eww update night=false
fi

if [ $(pamixer --get-volume-human) = "muted" ]; then
  eww update mute=true
else
  eww update mute=false
fi
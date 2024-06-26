#!/usr/bin/env bash


mute=$(pamixer --get-volume-human)
volume=$(pamixer --get-volume)

if [ "$volume" -lt 33 ]; then
  mute_return="󰕿";
elif [ "$volume" -lt 66 ]; then
  mute_return="󰖀";
else
  mute_return="󰕾";
fi

eww update var_volume="{\"state_raw\":\"$mute\",\"state\":\"$mute_return\",\"value\":$volume}"

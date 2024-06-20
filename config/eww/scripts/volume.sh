#!/usr/bin/env bash


mute=$(pamixer --get-volume-human)
volume=$(pamixer --get-volume)

if [ ! "$mute" = "muted" ]; then
  if [ "$volume" -lt 33 ]; then
    mute_return="󰕿";
  elif [ "$volume" -lt 66 ]; then
    mute_return="󰖀";
  else
    mute_return="󰕾";
  fi
else
  mute_return="󰝟";
fi

echo "{\"state_raw\":\"$mute\",\"state\":\"$mute_return\",\"value\":$volume}"

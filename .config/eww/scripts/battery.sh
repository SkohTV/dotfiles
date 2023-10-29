#!/bin/bash

file=$(upower -e | grep 'BAT' | tr -d '\n')
data=$(upower -i "$file" | grep -E "state|percentage|time to full|time to empty" | tr -d "%")

state=$(echo $data | grep -oP 'state: \K\w+')
percentage=$(echo $data | grep -oP 'percentage: \K\d+')
charging=""
time_remain=$(echo $data | awk -F'[: ]+' '/time to (empty|full):/ {print $6, $7}')
state_return="NA"

if [ "$time_remain" = "" ]; then
  time_remain="NA"
fi

if [ "$state" = "discharging" ]; then
  charging="Fully empty in"
  if [ "$percentage" -lt 10 ]; then
    state_return="󰁺";
  elif [ "$percentage" -lt 20 ]; then
    state_return="󰁻";
  elif [ "$percentage" -lt 30 ]; then
    state_return="󰁼";
  elif [ "$percentage" -lt 40 ]; then
    state_return="󰁽";
  elif [ "$percentage" -lt 50 ]; then
    state_return="󰁾";
  elif [ "$percentage" -lt 60 ]; then
    state_return="󰂀";
  elif [ "$percentage" -lt 70 ]; then
    state_return="󰂀";
  elif [ "$percentage" -lt 80 ]; then
    state_return="󰂁";
  elif [ "$percentage" -lt 90 ]; then
    state_return="󰂂";
  else
    state_return="󰁹";
  fi
else
  if [ "$percentage" -eq 100 ]; then
    state_return="󰂃";
    charging="You are fully charged !"
  else
    charging="Fully charged in"
    state_return="󰂄";
  fi
fi

ret=$(printf "{\"state\":\"%s\",\"value\":%s,\"charging\":\"%s\",\"time\":\"%s\"}" "$state_return" "$percentage" "$charging" "$time_remain")
echo "$ret"
#!/usr/bin/env bash


data=$(nmcli -t -f active,ssid,bars dev wifi | grep '^yes')
network_name=$(echo "$data" | cut -d: -f2)
bars=$(echo "$data" | cut -d: -f3)

if [ -z "$network_name" ]; then
  network_name="N/A"
  state="󰤭"
else
  case ${#bars} in
    0) state="󰤯" ;;
    1) state="󰤟" ;;
    2) state="󰤢" ;;
    3) state="󰤥" ;;
    4) state="󰤨" ;;
  esac
fi

echo "{\"state\":\"$state\",\"value\":\"$network_name\"}"

#!/usr/bin/env bash



while true; do
  val=$(eww get EWW_BATTERY);
  capacity=$(echo "$val" | jq '.["BAT1"]["capacity"]');
  status=$(echo "$val" | jq '.["BAT1"]["status"]');

  if [[ $capacity < 16 && $status == '"Discharging"' ]]; then
    dunstify --urgency=critical "Battery" "Only $capacity% remaining";
  fi

  if [[ $capacity -eq 100 && $status == '"Charging"' ]]; then
    dunstify --urgency=low "Battery" "Charged at 100%"
  fi

  sleep 9;
done

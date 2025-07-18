#!/usr/bin/env bash

# shellcheck disable=SC1091
source "$HOME"/dev/scripts/.weather.env

sky='91d7e3'
yellow='eed49f'
pink='f5bde6'
blue='8aadf4'
mauve='c6a0f6'
maroon='ee99a0'
white='ffffff'


# Tmp folder
tmp_weather="/tmp/weather"
tmp_weather_stat=$tmp_weather/weather-stat
tmp_weather_degree=$tmp_weather/weather-degree
tmp_weather_hex=$tmp_weather/weather-hex
tmp_weather_icon=$tmp_weather/weather-icon

# Create if non existant
if [ ! -d $tmp_weather ]; then
  mkdir -p $tmp_weather
fi


# Consants
KEY="$WEATHER_API"
ID="3029241"
UNIT="metric"
LNG="en"


while true; do

  # Fetch api
  weather=$(curl -sf "http://api.openweathermap.org/data/2.5/weather?APPID=${KEY}&id=${ID}&units=${UNIT}&lang=${LNG}")
  echo "$weather"

  if [ -n "$weather" ]; then
    weather_temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)
    weather_icon_code=$(echo "$weather" | jq -r ".weather[].icon" | head -1)
    weather_description=$(echo "$weather" | jq -r ".weather[].description" | head -1 | sed -e "s/\b\(.\)/\u\1/g")

    #Big long if statement of doom
    if [ "$weather_icon_code" == "50d"  ]; then
        weather_icon=""
        weather_hex="${sky}"
      elif [ "$weather_icon_code" == "50n"  ]; then
        weather_icon=""
        weather_hex="${sky}"
    elif [ "$weather_icon_code" == "01d"  ]; then
        weather_icon=""
        weather_hex="${yellow}"
      elif [ "$weather_icon_code" == "01n"  ]; then
        weather_icon=""
        weather_hex="${pink}"
      elif [ "$weather_icon_code" == "02d"  ]; then
        weather_icon=""
        weather_hex="${blue}"
      elif [ "$weather_icon_code" == "02n"  ]; then
        weather_icon=""
        weather_hex="${blue}"
      elif [ "$weather_icon_code" == "03d"  ]; then
        weather_icon=""
        weather_hex="${blue}"
      elif [ "$weather_icon_code" == "03n"  ]; then
        weather_icon=""
        weather_hex="${blue}"
      elif [ "$weather_icon_code" == "04d"  ]; then
        weather_icon=""
        weather_hex="${blue}"
      elif [ "$weather_icon_code" == "04n"  ]; then
        weather_icon=""
        weather_hex="${blue}"
      elif [ "$weather_icon_code" == "09d"  ]; then
        weather_icon=""
        weather_hex="${mauve}"
      elif [ "$weather_icon_code" == "09n"  ]; then
        weather_icon=""
        weather_hex="${mauve}"
      elif [ "$weather_icon_code" == "10d"  ]; then
        weather_icon=""
        weather_hex="${mauve}"
      elif [ "$weather_icon_code" == "10n"  ]; then
        weather_icon=""
        weather_hex="${mauve}"
      elif [ "$weather_icon_code" == "11d"  ]; then
        weather_icon=""
        weather_hex="${maroon}"
      elif [ "$weather_icon_code" == "11n"  ]; then
        weather_icon=""
        weather_hex="${maroon}"
      elif [ "$weather_icon_code" == "13d"  ]; then
        weather_icon=""
        weather_hex="${white}"
      elif [ "$weather_icon_code" == "13n"  ]; then
        weather_icon=""
        weather_hex="${white}"
      elif [ "$weather_icon_code" == "40d"  ]; then
        weather_icon=""
        weather_hex="${sky}"
      elif [ "$weather_icon_code" == "40n"  ]; then
        weather_icon=""
        weather_hex="${sky}"
      else 
        weather_icon=""
        weather_hex="${blue}"
      fi
        echo "$weather_icon" >  $tmp_weather_icon
        echo "$weather_description" > $tmp_weather_stat
        
        # desc_count=$(wc -c < /tmp/weather/weather-stat)
        # if [[ "$desc_count" -lt 20 ]]; then
        echo "$weather_description" > $tmp_weather_stat      
        # else 
        #   echo "$(cut -c1-12 /tmp/weather/weather-stat)""..." > $tmp_weather_stat
        # fi
        echo "$weather_temp""°C" > $tmp_weather_degree
        echo "$weather_hex" > $tmp_weather_hex
      else
        echo "Weather Unavailable" > $tmp_weather_stat
        echo " " > $tmp_weather_icon
        echo "-" > $tmp_weather_degree
        echo "${blue}" > $tmp_weather_hex
  fi

  # Wait a minute
  sleep 60

done

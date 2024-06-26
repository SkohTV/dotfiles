#!/usr/bin/env bash


bright="$(brightnessctl | grep 'backlight' -A1 | tail -1 | awk '{print $4}' | head -c -3 | cut -c 2-)"
eww update var_brightness=$bright

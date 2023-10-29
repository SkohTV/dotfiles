#!/bin/bash


current=$(hyprctl monitors -j | jq '.[] | select(.focused) | .activeWorkspace.id')
echo "$current"

#!/usr/bin/env bash


while true; do
    date=$(date +'%d')
    sleep 5
    new_date=$(date +'%d')

    if [[ $date != $new_date ]]; then
        pkill ags
        pkill hyprpaper
        echo "- changed wp"
    fi

    echo $new_date
done


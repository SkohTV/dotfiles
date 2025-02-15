#!/usr/bin/env bash


grim -g "$(slurp)" "/tmp/screenshot.png" && wl-copy < /tmp/screenshot.png && imv /tmp/screenshot.png

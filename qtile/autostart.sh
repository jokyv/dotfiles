#!/usr/bin/env bash

# systray battery icon
# cbatticon -u 5 &
# systray volume
# volumeicon &

# change the wallpaper
xargs feh --bg-fill $(shuf -n 1 -e ~/pics/wallpapers/*) &

# start dunst
dunst &

#!/usr/bin/env bash

# change the wallpaper
xargs feh --bg-fill $(shuf -n 1 -e ~/pics/wallpapers/*) &

# start dunst
dunst &

#!/bin/bash

CWD=$(pwd)

WALLPAPER_DIR="$HOME/.config/wallpapers"

cd "$WALLPAPER_DIR"

IFS=$'\n'

SELECTED_WALLPAPER=$(for image in *.jpg *.png; do echo -en "$image\0icon\x1f$image\n" ; done | rofi -dmenu -p "")

if [ -n "$SELECTED_WALLPAPER" ]; then
  matugen image "$SELECTED_WALLPAPER"
fi

cd "$CWD"

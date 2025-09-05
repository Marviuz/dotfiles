#!/bin/bash

PROJECTS_DIR=~/Projects

choice=$(find "$PROJECTS_DIR" \
  \( -type d \( -name node_modules -o -name vendor -o -name .git -o -name .next -o -name dist -o -name .cache -o -name build \) -prune \) -o \
  \( -type d -printf "D %P\n" \) -o \
  \( -type f -printf "F %P\n" \) |
  sort -k1,1 -k2,2 |
  cut -c3- |
  fzf --prompt="Projects > " --height=40% --reverse)

if [[ -n "$choice" ]]; then
  full="$PROJECTS_DIR/$choice"
  if [[ -d "$full" ]]; then
    echo "cd \"$full\""
  elif [[ -f "$full" ]]; then
    echo "cd \"$(dirname "$full")\""
  fi
fi

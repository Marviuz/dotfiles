#!/bin/bash

opacityValue=$(hyprctl getoption decoration:active_opacity | grep -oP '(?<=float: )\d+\.\d+')
    
if (( $(echo "$opacityValue < 1"| bc -l) )); then 
    # hyprctl --batch "keyword decoration:active_opacity 1; keyword decoration:inactive_opacity 1"
    active=1
    inactive=1
else
    # hyprctl --batch "keyword decoration:active_opacity 0.9; keyword decoration:inactive_opacity 0.8" # Reference the hyprland config for the default values
    active=0.9
    inactive=0.8
fi

hyprctl --batch "keyword decoration:active_opacity $active; keyword decoration:inactive_opacity $inactive"

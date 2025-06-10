#!/bin/bash

opacityValue=$(hyprctl getoption decoration:active_opacity | grep -oP '(?<=float: )\d+\.\d+')
    
if (( $(echo "$opacityValue < 1"| bc -l) )); then 
    active=1
    inactive=1
else
    active=0.8
    inactive=0.7
fi

hyprctl --batch "keyword decoration:active_opacity $active; keyword decoration:inactive_opacity $inactive"

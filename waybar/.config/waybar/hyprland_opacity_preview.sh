#!/bin/bash

opacityValue=$(hyprctl getoption decoration:active_opacity | grep -oP '(?<=float: )\d+\.\d+')

if (( $(echo "$opacityValue < 1"| bc -l) )); then 
    echo ""
else
    echo ""
fi

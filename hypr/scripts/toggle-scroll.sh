#!/bin/bash

WORKSPACE=$(hyprctl activeworkspace -j | jq -r '.id')
LAYOUT=$(hyprctl activeworkspace -j | jq -r '.tiledLayout')
if [[ "$LAYOUT" == "dwindle" ]]; then
  hyprctl keyword workspace "$WORKSPACE, layout:scrolling"
elif [[ "$LAYOUT" == "scrolling" ]]; then
  hyprctl keyword workspace "$WORKSPACE, layout:dwindle"
fi

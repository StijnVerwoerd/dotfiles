#!/usr/bin/env bash

# Names of your outputs
LAPTOP="eDP-1"
MONITOR="DP-2"

# Get list of active outputs
ACTIVE=$(swaymsg -t get_outputs | jq -r '.[] | select(.active) | .name')

if echo "$ACTIVE" | grep -q "$LAPTOP"; then
    # Laptop is active → switch to monitor
    swaymsg output "$LAPTOP" disable
    swaymsg output "$MONITOR" enable
else
    # Monitor is active → switch to laptop
    swaymsg output "$MONITOR" disable
    swaymsg output "$LAPTOP" enable
fi

#!/bin/bash

# Get the primary monitor's name
# PRIMARY_MONITOR=$(xrandr | grep " connected primary" | awk '{print $1}')
PRIMARY_MONITOR="eDP-1-1"

# Set the primary monitor's position to the left
xrandr --fb 3520x2560 --output $PRIMARY_MONITOR --auto --primary --pos 0x740 --rotate normal

# Check if there is a second monitor connected via HDMI

if xrandr | grep -q "^DP-1-1 connected"; then
    echo "DP-1-1 is connected"
    SECONDARY_MONITOR=$(xrandr | grep "^DP-1-1 connected" | awk '{print $1}')
else
    echo "HDMI-0 is connected"
    SECONDARY_MONITOR=$(xrandr | grep "^HDMI-0 connected" | awk '{print $1}')
fi

# Set the second monitor's position to the right of the primary monitor if SECONDARY_MONITOR is not empty
if [ -n "$SECONDARY_MONITOR" ]; then
    echo "主屏：${PRIMARY_MONITOR}，副屏：${SECONDARY_MONITOR}"
    echo "设置中（副屏竖屏）......"
    # xrandr --output $SECONDARY_MONITOR --auto --right-of $PRIMARY_MONITOR --rotate right
    xrandr --fb 3520x2560 --output $SECONDARY_MONITOR --auto --pos 1920x0 --right-of $PRIMARY_MONITOR --rotate right
fi


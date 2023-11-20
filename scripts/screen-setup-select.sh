#!/bin/bash

# Get the primary monitor's name
# PRIMARY_MONITOR=$(xrandr | grep " connected primary" | awk '{print $1}')
PRIMARY_MONITOR="eDP-1-1"

# Set the primary monitor's position to the left
xrandr --output $PRIMARY_MONITOR --auto --primary --pos 0x0 --rotate normal

# Check if there is a second monitor connected via HDMI

if xrandr | grep -q "^DP-1-1 connected"; then
    echo "DP-1-1 is connected"
    SECONDARY_MONITOR=$(xrandr | grep "^DP-1-1 connected" | awk '{print $1}')
else
    echo "HDMI-0 is connected"
    SECONDARY_MONITOR=$(xrandr | grep "^HDMI-0 connected" | awk '{print $1}')
fi

# Prompt the user to choose a rotation option
options=("normal" "left" "right" "inverted")
echo "请为辅助显示器选择旋转选项："
select opt in "${options[@]}"
do
    case $opt in
        "normal")
            rotation="normal"
            break
            ;;
        "left")
            rotation="left"
            break
            ;;
        "right")
            rotation="right"
            break
            ;;
        "inverted")
            rotation="inverted"
            break
            ;;
        *) echo "Invalid option";;
    esac
done

# Set the second monitor's position to the right of the primary monitor if SECONDARY_MONITOR is not empty
if [ -n "$SECONDARY_MONITOR" ]; then
    echo "主屏：${PRIMARY_MONITOR}，副屏：${SECONDARY_MONITOR}"
    echo "副屏设置中【方向：${rotation}】......"
    xrandr --output $SECONDARY_MONITOR --auto --right-of $PRIMARY_MONITOR --rotate ${rotation}
fi


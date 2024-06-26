#!/bin/bash

# Get the primary monitor's name
# PRIMARY_MONITOR=$(xrandr | grep " connected primary" | awk '{print $1}')
PRIMARY_MONITOR="eDP-1-1"

# Set the primary monitor's position to the left
xrandr --output $PRIMARY_MONITOR --auto --primary --pos 0x0 --rotate normal

# Check if there is a second monitor connected via HDMI

# 检测是否有 DP 接口显示器
if xrandr | grep -q "^DP-1-1 connected"; then
    echo "DP-1-1 is connected"
    SECONDARY_MONITOR_DP=$(xrandr | grep "^DP-1-1 connected" | awk '{print $1}')
else
    echo "DP-1-1 is not connected"
    # SECONDARY_MONITOR_DP=$(xrandr | grep "^HDMI-0 connected" | awk '{print $1}')
fi


# 检测是否有 HDMI 接口显示器
if xrandr | grep -q "^HDMI-0 connected"; then
    echo "HDMI-0 is connected"
    SECONDARY_MONITOR_HDMI=$(xrandr | grep "^HDMI-0 connected" | awk '{print $1}')
else
    echo "HDMI-0 is not connected"
    # SECONDARY_MONITOR_HDMI=$(xrandr | grep "^HDMI-0 connected" | awk '{print $1}')
fi

# DP 接口设置
OPTION=$(whiptail --title "显示器方向" --menu "请选择副屏旋转方向" 15 60 4 \
	"right" "右旋" \
	"normal" "正常" \
	"left" "左旋" \
	"inverted" "翻倒" 3>&1 1>&2 2>&3)

exitstatus=$?

if [ $exitstatus = 0 ]; then
	{
		for ((i = 0 ; i <= 100 ; i+=2)); do
			sleep 0.005
			echo $i
		done
    } | whiptail --title "任务进度" --gauge "Please wait, setting is in progress" 6 60 0

	if [ -n "$SECONDARY_MONITOR_DP" ]; then
		echo "主屏：${PRIMARY_MONITOR}，副屏：${SECONDARY_MONITOR_DP}"
		echo "副屏设置完成【方向：$OPTION】......"
		xrandr --output $SECONDARY_MONITOR_DP --auto --left-of $PRIMARY_MONITOR --rotate $OPTION
	fi
else
	echo "您未做出选择！"
fi


# HDMI 接口设置
OPTION=$(whiptail --title "显示器方向" --menu "请选择副屏旋转方向" 15 60 4 \
	"right" "右旋" \
	"normal" "正常" \
	"left" "左旋" \
	"inverted" "翻倒" 3>&1 1>&2 2>&3)

exitstatus=$?

if [ $exitstatus = 0 ]; then
	{
		for ((i = 0 ; i <= 100 ; i+=2)); do
			sleep 0.005
			echo $i
		done
    } | whiptail --title "任务进度" --gauge "Please wait, setting is in progress" 6 60 0

	if [ -n "$SECONDARY_MONITOR_HDMI" ]; then
		echo "主屏：${PRIMARY_MONITOR}，副屏：${SECONDARY_MONITOR_HDMI}"
		echo "副屏设置完成【方向：$OPTION】......"
		xrandr --output $SECONDARY_MONITOR_HDMI --auto --right-of $PRIMARY_MONITOR --rotate $OPTION
	fi
else
	echo "您未做出选择！"
fi

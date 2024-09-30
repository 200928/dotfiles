#!/bin/bash
#
# 切换麦克风开启/关闭
pactl set-source-mute @DEFAULT_SOURCE@ toggle

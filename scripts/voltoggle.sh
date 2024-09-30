#!/bin/bash
# amixer sset Master toggle
#
pactl set-sink-mute @DEFAULT_SINK@ toggle

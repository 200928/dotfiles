#!/bin/bash
# amixer sset Master 5%+ unmute
# 
sh -c "pactl set-sink-mute @DEFAULT_SINK@ false ; pactl set-sink-volume @DEFAULT_SINK@ +5%"

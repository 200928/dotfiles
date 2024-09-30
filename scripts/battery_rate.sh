#!/bin/bash

rote=$(upower -i $(upower -e | grep 'battery') | awk '/energy-rate/ {print $2}')

rote_format=$(awk "BEGIN {printf \"%.1f\", $rote}")

echo ${rote_format}瓦

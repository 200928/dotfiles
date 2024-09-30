#!/bin/bash
sensors | awk '/Package/{t=1}{if(t)s=length(s)?s$0:$0}/high/{t=0;if(s~/+*°C/)print s;s=""}' | awk -F '[+(]' '{ print $2}'

governor=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)

# 获取最小频率和最大频率
min=$(cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_min_freq | head -n 1)
max=$(cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq | head -n 1)

# 转换为千兆赫兹 (GHz)
min_ghz=$(awk "BEGIN {printf \"%.1f\", $min/1000000}")
max_ghz=$(awk "BEGIN {printf \"%.1f\", $max/1000000}")

echo ${governor}-${min_ghz}-${max_ghz}

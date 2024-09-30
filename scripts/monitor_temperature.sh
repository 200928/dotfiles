#!/bin/bash

# 文件名: monitor_temperature.sh

# 输出文件路径
output_file="temperature_log.txt"

# 每2秒钟监控一次
while true
do
    # 获取CPU温度
    cpu_temp=$(sensors | grep "Package" | awk '{print $4}')

    # 获取显卡温度，假设用nvidia-smi命令获取
    gpu_temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)

    # 获取当前时间
    current_time=$(date +"%Y-%m-%d %H:%M:%S")

    # 输出到文件
    echo "$current_time - CPU 温度: $cpu_temp, 显卡 温度: $gpu_temp" >> "$output_file"

    # 等待2秒钟
    sleep 2
done

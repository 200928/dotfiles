#!/bin/bash

LOG_FILE="/tmp/dpms_status.log"

while true; do
    # 获取当前时间，并格式化为可读的时间戳
    CURRENT_TIME=$(date "+%Y-%m-%d %H:%M:%S")
    
    # 获取当前DPMS状态并添加时间戳到日志文件
    echo "$CURRENT_TIME - $(xset -q | grep 'Monitor is')" >> "$LOG_FILE"
    
    # 每10秒记录一次状态
    sleep 5
done

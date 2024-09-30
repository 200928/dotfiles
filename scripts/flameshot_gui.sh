#!/bin/bash

# 设置截图保存路径
SAVE_PATH="/home/ming/Pictures"

# 检查flameshot是否安装
if ! command -v flameshot &> /dev/null; then
  echo "flameshot未安装。请先安装flameshot。"
  exit 1
fi

# 终止所有flameshot进程
killall flameshot &> /dev/null

# 检查killall命令是否成功
if [ $? -eq 0 ]; then
  echo "所有flameshot进程已终止。"
else
  echo "没有运行的flameshot进程或终止失败。"
fi

# 检查保存路径是否存在
if [ ! -d "$SAVE_PATH" ]; then
  echo "保存路径$SAVE_PATH不存在。创建路径..."
  mkdir -p "$SAVE_PATH"
  if [ $? -ne 0 ]; then
    echo "创建路径失败。请检查权限。"
    exit 1
  fi
fi

# 启动flameshot GUI进行截图
flameshot gui -p "$SAVE_PATH"

# 检查flameshot GUI是否成功启动
if [ $? -eq 0 ]; then
  echo "截图已保存到$SAVE_PATH。"
else
  echo "flameshot GUI启动失败。"
  exit 1
fi

#!/bin/bash

# 定义源目录和目标目录
SOURCE_DIR="$HOME/workspace/"
DEST_DIR="/mnt/tpdata/backup/workspace"
LOG_FILE="$HOME/log/rsync_backup.log"

# 获取当前时间
start_time=$(date "+%Y-%m-%d %H:%M:%S")

# 使用 rsync 同步文件并捕获输出
rsync_output=$(rsync -avzi --delete --exclude 'node_modules' "$SOURCE_DIR" "$DEST_DIR" 2>&1)
rsync_exit_code=$?

# 获取结束时间
end_time=$(date "+%Y-%m-%d %H:%M:%S")

# 计算耗时
start_time_seconds=$(date -d "$start_time" +%s)
end_time_seconds=$(date -d "$end_time" +%s)
elapsed_time=$((end_time_seconds - start_time_seconds))

# 检查 rsync 命令是否成功
if [ $rsync_exit_code -eq 0 ]; then
    status="SUCCESS"
else
    status="FAILURE"
    # 将错误输出写入日志
    echo "$rsync_output" >> "$LOG_FILE"
fi

# 写入同步结果和时间到日志文件
echo "[$start_time] ${SOURCE_DIR} =====> [${end_time}] ${DEST_DIR} backup ${status}, elapsed time: ${elapsed_time} seconds" >> "$LOG_FILE"

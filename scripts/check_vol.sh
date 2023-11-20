#!/bin/bash
# amixer sget Master | awk -F "[][]" ' /Mono:/ { print $2 }'
amixer sget Master | awk -F "[][]" '/Front Left:/ { print $2 }'

# minghui@Arch:/mnt/audiovisual/Music
# % amixer sget Master                                        23-08-28 - 13:01:15
# Simple mixer control 'Master',0
#   Capabilities: pvolume pswitch pswitch-joined
#   Playback channels: Front Left - Front Right
#   Limits: Playback 0 - 65536
#   Mono:
#   Front Left: Playback 0 [0%] [on]
#   Front Right: Playback 0 [0%] [on]
#
# amixer sget Master: 查询声音控制的状态，获取音量和开关状态等信息。
#
# |: 管道操作符，将前一个命令的输出传递给后一个命令作为输入。
#
# awk -F "[][]" '/Front Left:/ { print $2 }':
# awk: 文本处理工具，用于处理文本文件中的行和列。
#     -F "[][]": 指定字段分隔符为方括号 []，这样 awk 会将方括号作为分隔符来解析每行。
#     /Front Left:/: 正则表达式匹配，在包含 "Front Left:" 的行上执行后面的操作。
#     { print $2 }: 当匹配的行被找到时，打印该行的第二个字段，即方括号内的内容，即百分比值 "44%"。

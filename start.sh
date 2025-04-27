#!/bin/bash

# 设置错误时退出
set -e

# 定义颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 检查并创建软链接函数
create_symlink() {
    source_path="$1"
    target_path="$2"

    # 检查源文件是否存在
    if [ ! -e "$source_path" ]; then
        echo -e "${RED}错误: 源文件不存在: $source_path${NC}"
        return 1
    fi

    # 如果目标是软链接，检查它的指向
    if [ -L "$target_path" ]; then
        # 获取软链接的实际指向
        current_target=$(readlink -f "$target_path")
        # 获取源文件的实际路径
        expected_target=$(readlink -f "$source_path")
        # 检查软链接的指向是否正确
        if [ "$current_target" = "$expected_target" ]; then
            echo -e "${GREEN}软链接已存在且指向正确: $target_path -> $source_path${NC}"
            return 0
        else
            echo -e "${YELLOW}警告: 软链接指向不正确${NC}"
            echo -e "${YELLOW}当前指向: $current_target${NC}"
            echo -e "${YELLOW}期望指向: $expected_target${NC}"
            read -p "是否更新软链接？[y/N] " -n 1 -r
            echo # 换行
            if [[ ! $REPLY =~ ^[Yy]$ ]]; then
                echo -e "${YELLOW}保持现有软链接不变${NC}"
                return 0
            fi
            rm "$target_path"
        fi
    # 如果目标存在但不是软链接，创建备份
    elif [ -e "$target_path" ]; then
        current_target=$(readlink -f "$target_path")
        # 确定是否备份，用新的软链接替换
        read -p "$target_path已存在 (不是软链接)，是否备份已存在的文件？[y/N] " -n 1 -r
        echo # 换行
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            echo -e "${YELLOW}保持现有文件 $target_path 不变${NC}"
            return 0
        fi
        backup_path="${target_path}.backup.$(date +%Y%m%d_%H%M%S)"
        echo -e "${YELLOW}备份已存在的文件: $target_path -> $backup_path${NC}"
        mv "$target_path" "$backup_path"
    fi

    # 创建软链接
    ln -s "$source_path" "$target_path"
    echo -e "${GREEN}创建了软链接: $target_path -> $source_path${NC}"
}

# 确保 .config 目录存在
mkdir -p "$HOME/.config"

# 设置配置文件的路径
dotfiles_path="$HOME/dotfiles"

# 定义配置文件映射
# 键是配置文件的名称，值是配置文件的路径（也就是实际配置文件的路径）
declare -A configs=(
    ["alacritty"]="$HOME/.config/alacritty"
    ["nvim"]="$HOME/.config/nvim"
    ["scripts"]="$HOME/scripts"
    [".tmux.conf"]="$HOME/.tmux.conf"
    [".picgo"]="$HOME/.picgo"
    ["hypr"]="$HOME/.config/hypr"
    ["hypr/waybar"]="$HOME/.config/waybar"
    ["hypr/mako"]="$HOME/.config/mako"
    ["atuin"]="$HOME/.config/atuin"
    ["picom.conf"]="$HOME/.config/picom.conf"
)

# 遍历并创建软链接
for source in "${!configs[@]}"; do
    create_symlink "$dotfiles_path/$source" "${configs[$source]}"
done

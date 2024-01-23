#!/bin/bash

# 检查并创建软链接函数
create_symlink() {
    source_path="$1"
    target_path="$2"

    # 检查目标路径是否已经存在
    if [ -e "$target_path" ]; then
        echo "链接已存在: $target_path"
    else
        # 创建软链接
        ln -s "$source_path" "$target_path"
        echo "创建了软链接: $target_path -> $source_path"
    fi
}

# 设置配置文件的路径
dotfiles_path="$HOME/dotfiles"

# 调用函数创建软链接
create_symlink "$dotfiles_path/alacritty" "$HOME/.config/alacritty"
# create_symlink "$dotfiles_path/JetBrainsConfig" "$HOME/.JetBrainsConfig"
create_symlink "$dotfiles_path/nvim" "$HOME/.config/nvim"
create_symlink "$dotfiles_path/scripts" "$HOME/scripts"
# create_symlink "$dotfiles_path/suckless" "$HOME/.suckless"
create_symlink "$dotfiles_path/.tmux.conf" "$HOME/.tmux.conf"
create_symlink "$dotfiles_path/tmux" "$HOME/.config/tmux"

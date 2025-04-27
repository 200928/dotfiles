#!/bin/zsh

# 读取 $HOME/.venv 目录下的所有虚拟环境
venvs=($HOME/.venv/*(N))
menu_items=()

# 为每个虚拟环境创建菜单项
for venv in $venvs; do
    venv_name=${venv:t} # 获取目录名
    menu_items+=($venv_name "Python虚拟环境 - $HOME/.venv/$venv_name")
done

# 用 whiptail 选择虚拟环境
selected_venv=$(whiptail --title "选择Python虚拟环境" \
    --menu "请选择要激活的Python虚拟环境:" \
    15 60 5 \
    "${menu_items[@]}" \
    3>&1 1>&2 2>&3)

# 如果用户选择了环境则输出激活命令
if [ $? -eq 0 ]; then
    echo "source \"$HOME/.venv/$selected_venv/bin/activate\""
fi

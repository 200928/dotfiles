#!/bin/bash

echo '您将切换至独显'
echo '输入密码回车将重启，请将工作区文件保存好！！！'

# 删除自动加载的acpi_call模块
sudo rm -rf /etc/modules-load.d/acpi_call.conf

# 将systemd启动时加载的文件删除(该文件是将独显断电)
sudo rm -rf /etc/tmpfiles.d/acpi_call.conf

#获取NVIDIA显卡的BusID
NVIDIA_BusID=`lspci | egrep 'VGA|3D' | grep 'NVIDIA' | cut -d ' ' -f 1 | sed -r 's/0?(.)/\1/' | sed -e 's/:0/:/g' -e 's/\./:/g'`

#写入Xorg配置文件
echo 'Section "Module"
	Load "modesetting"
EndSection
Section "Device"
	Identifier "nvidia"
	Driver "nvidia"
	BusID "PCI:'$NVIDIA_BusID'"      
	Option "AllowEmptyInitialConfiguration"
EndSection' | sudo tee /etc/X11/xorg.conf.d/20-nvidia.conf > /dev/null

reboot

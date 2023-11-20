#!/bin/bash

echo '您将切换至核显(独显将会断电)'
echo '输入密码回车将重启，请将工作区文件保存好！！！'

#删除配置文件
sudo rm -rf /etc/X11/xorg.conf.d/20-nvidia.conf

#将内核模块添加到模块列表以在引导时加载
echo 'acpi_call' | sudo tee /etc/modules-load.d/acpi_call.conf

# 将/etc/tmpfiles.d/acpi_call.conf文件由systemd启动时加载
echo 'w /proc/acpi/call - - - - \\_SB.PCI0.PEG0.PEGP._OFF' | sudo tee /etc/tmpfiles.d/acpi_call.conf

reboot

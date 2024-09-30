#!/bin/sh

xrandr --auto
# xrandr --dpi 96
# xrandr --dpi 144 # 150
# xrandr --dpi 168 # 175
# xrandr --dpi 192 # 200
# xrandr --dpi 288 # 300
xrandr --output eDP --mode 3072x1920 --scale 1 --refresh 120

# export GDK_SCALE=2
# 解决IDEA显示问题
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
wmname LG3D

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
# sysresources=/etc/X11/xinit/.Xresources
sysresources=~/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login

exec fcitx5 &
exec slstatus &
exec picom &

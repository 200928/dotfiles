#!/bin/bash
killall trayer
if [ $? != 0 ];then
	trayer --edge bottom --widthtype request --heighttype request --height 26
fi

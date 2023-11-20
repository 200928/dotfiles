#!/bin/bash
killall redshift
if [ $? != 0 ];then
	kstart5 redshift
fi

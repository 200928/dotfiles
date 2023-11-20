#/bin/bash
#拦截ctrl+c
trap 'echo "[[^C";sleep $[RANDOM%5+1]' 2
while :
do
#随机回车10次以内卡住2333秒
	for i in $(seq $[RANDOM%10+1])
	do
		read -p "grub rescue>" comm
		if [ $comm ]
		then
			echo "$comm command not found"
		else
			echo "		"
		fi
	done
	echo "Kernel Panic - Not syncing : Fatal Exception"
	sleep 2333
done
exit

#! /bin/bash
 random(){
        min=$1
        max=$2
        time=$(date +%s)
        num=$[$max-$min+1]
        out=$[$time%$num+$min]
}
random 1 5

case $out in
    1)
        bash ~/.config/rofi/launchers/colorful/launcher.sh
        ;;
    2)
        bash ~/.config/rofi/launchers/misc/launcher.sh
        ;;
    3) 
        bash ~/.config/rofi/launchers/text/launcher.sh
        ;;
    4) 
        bash ~/.config/rofi/launchers/ribbon/launcher.sh
        ;;
    5) 
        bash ~/.config/rofi/launchers/slate/launcher.sh
        ;;
    *)  
        echo "error"
        ;;
esac


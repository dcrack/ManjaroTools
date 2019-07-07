#!/bin/bash
echo
echo "*Manjaro亮度调节"
echo "* via Moecola.com"
echo
echo -e "最大亮度："
echo `cat /sys/class/backlight/intel_backlight/max_brightness`
echo
function main(){
echo -e "当前亮度："
echo `cat /sys/class/backlight/intel_backlight/brightness`
echo
echo -e "请输入亮度："
read -e brt
sudo sh -c "echo $brt > /sys/class/backlight/intel_backlight/brightness"
echo 
main
}
main
#!/bin/bash
echo
echo "*Manjaro独立显卡调整脚本"
echo "*     via Moecola.com"
echo
function main(){
i="sudo"
x=`pacman -Qq| grep $i`
if [ `pacman -Qq| grep $i |wc -l` -ne 0 ];then
echo -e
else
pacman -S sudo
fi
modprobe bbswitch
read -e input
case $input in
1) 
echo
echo "开启独立显卡..."
sudo tee /proc/acpi/bbswitch <<<ON
echo "启动成功"
report
main
echo;;
2)
echo
echo "关闭独立显卡..."
sudo tee /proc/acpi/bbswitch <<<OFF
echo "关闭成功"
report
main
echo;;
3)
echo
echo "查看独立显卡面板"
optirun -b none nvidia-settings -c :8
echo "打开成功"
report
main
echo;;
4)
exit;;
esac
}
function firstreport(){
echo "1、开启独立显卡"
echo "2、关闭独立显卡"
echo "3、查看独立显卡面板"
echo "4、退出"
}
function report(){
echo 
t=`cat /proc/acpi/bbswitch |awk '{print $2}'`
echo "独立显卡状态：$t"
echo
echo -e "请输入："
}
firstreport
report
main

# скрипт применяет необходимые конфиги для postgresql и jvm для трех конфигураций железок

#!/bin/bash
function 4gb_2core {
clear
cp -rf /opt/postgresql_jvm_fix/4-2/postgresql.conf /etc/postgresql/10/main
sed '/-Xmx/d' /usr/bin/ultima-vmc > /opt/ultima-vmc-xmx
cp -rf /opt/ultima-vmc-xmx /usr/bin/ultima-vmc
rm -f /opt/ultima-vmc-xmx
}
function  8gb_4core {
clear
cp -rf /opt/postgresql_jvm_fix/8-4/postgresql.conf /etc/postgresql/10/main
sed '/-Xmx/d' /usr/bin/ultima-vmc > /opt/ultima-vmc-xmx
sed -e '/run "$@"/i \addJava "-Xmx3g"' /opt/ultima-vmc-xmx > /opt/ultima-vmc-xmx.bak
cp -rf /opt/ultima-vmc-xmx.bak /usr/bin/ultima-vmc
rm -f /opt/ultima-vmc-xmx /opt/ultima-vmc-xmx.bak
}
function 16gb_8core {
clear
cp -rf /opt/postgresql_jvm_fix/16-8/postgresql.conf /etc/postgresql/10/main
sed '/-Xmx/d' /usr/bin/ultima-vmc > /opt/ultima-vmc-xmx
sed -e '/run "$@"/i \addJava "-Xmx6g"' /opt/ultima-vmc-xmx > /opt/ultima-vmc-xmx.bak
cp -rf /opt/ultima-vmc-xmx.bak /usr/bin/ultima-vmc
rm -f /opt/ultima-vmc-xmx /opt/ultima-vmc-xmx.bak
}

function reboot_system {
clear
read -p "Are you sure to reboot system (y/n)?" choice
case "$choice" in
  y|Y ) reboot ;;
  n|N ) exit ;;
  * ) echo invalid choice;;
esac
}

function menu {
clear
echo
echo -e "\t\t\tPlease, select your server configuration to choose the right jvm and database settings\n"
echo -e "\t1. 4GB RAM + 2 core"
echo -e "\t2. 8GB RAM + 4 core"
echo -e "\t3. 16GB RAM + 8 core"
echo -e "\t4. Reboot system"
echo -e "\t0. Exit"
echo -en "\t\tPlease, enter the parameter number: "
read -n 1 option
}

while [ $? -ne 1 ]
do
        menu
        case $option in
0)
        break ;;
1)
        4gb_2core ;;
2)
        8gb_4core ;;
3)
        16gb_8core ;;
4)
        reboot_system ;;
*)
        clear
echo "You need to select a configuration";;
esac
echo -en "\n\n\t\t\tPress any key to continue"
read -n 1 line
done
clear

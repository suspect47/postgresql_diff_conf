#!/bin/bash
function 4gb_2core {
clear
cp -rf /opt/postgresql_diff_conf/4-2/postgresql.conf /etc/postgresql/10/main
}
function  8gb_4core {
clear
cp -rf /opt/postgresql_diff_conf/8-4/postgresql.conf /etc/postgresql/10/main
}
function 16gb_8core {
clear
cp -rf /opt/postgresql_diff_conf/16-8/postgresql.conf /etc/postgresql/10/main
}

function menu {
clear
echo
echo -e "\t\t\tPlease, select your server configuration to choose the right database settings\n"
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
		reboot ;;
*)
        clear
echo "You need to select a configuration";;
esac
echo -en "\n\n\t\t\tPress any key to continue"
read -n 1 line
done
clear

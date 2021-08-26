#!/bin/bash

echo "#Architecture: $(uname -a)"
echo "#CPU physical: $(lscpu | awk ' NR==5 {print $2}')"
echo "#vCPU : $(lscpu | awk ' NR==9 {print $2}')"
echo "#Memory Usage: $(free --mega | awk 'NR==2 {printf "%s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }')"
echo "#Disk Usage: $(df -h | awk 'NR==4 {printf "%.1f/%.1fGB (%s)\n", $3 / 1024,$2,$5}')"
echo "#CPU Load: $(top -bn 1 | awk 'NR==3 {printf "%.2f%%\n", $4 + $2}')"
echo "#Last boot: $(who -b | awk ' {print $3,$4}')"
echo "#LVM use: $(/usr/sbin/lvm pvdisplay | grep Allocatable | awk '{print $2}')"
echo "#Connetions TCP: $(ss -s | grep TCP | awk 'NR==2 {printf "%d ESTABLISHED\n", $3}')"
echo "#User log: $(who | wc -l)"
echo "#Network: IP $(hostname -I)$(ip a | grep link/ether | awk '{printf "(%s)\n", $2}')"
echo "#Sudo: $(cat /var/log/sudo/sudo.log | grep COMMAND | wc -l | awk '{printf "%d cmd\n", $0}')"

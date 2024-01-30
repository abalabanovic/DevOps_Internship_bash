#!/bin/bash

#generate report file

$today=$(date)
echo "Date and time: $today" > report.txt
echo "User:$USER" >> report.txt
linux_version=$(uname -rs)
echo "Linux version:$linux_version" >> report.txt
up=$(uptime)
echo "Uptime:$up" >> report.txt
cpu=$(head -12 /proc/cpuinfo)
echo "Cpu: $cpu" >> report.txt
mem=$(df -h)
echo "Memory:$mem" >> report.txt
ram_total=$(cat /proc/meminfo | grep MemTotal)
echo "Total RAM memory:$ram_total" >> report.txt
private_ip=$(hostname -I)
echo "Private IP : $private_ip" >> report.txt
public_ip=$(curl ifconfig.me)
echo "Public IP : $public_ip" >> report.txt



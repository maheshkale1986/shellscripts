#!/bin/bash
#Mahesh Kale
#17-02-2018


echo -e "Sytem Health Check" '\n'


# Define Variable tempvar
tempvar=$(tput sgr0)


# Check OS Type
os=$(cat /etc/redhat-release)
echo -e '\E[32m'"Operating System Type :"  $tempvar $os

# Check hostname
echo -e '\E[32m'"Hostname :" $tempvar $HOSTNAME

# Check Internal IP
internalip=$(hostname -I)
echo -e '\E[32m'"Internal IP :"  $tempvar $internalip

# Check Load Average
loadaverage=$(top -n 1 -b | grep "load average:" | awk '{print $10 $11 $12}')
echo -e '\E[32m'"Load Average :" $tempvar $loadaverage

# Check System Uptime
tecuptime=$(uptime | awk '{print $3,$4}' | cut -f1 -d,)
echo -e '\E[32m'"System Uptime Days/(HH:MM) :" $tempvar $tecuptime

# Check RAM and SWAP Usages
free -h | grep -v + > /tmp/ramcache
echo -e '\E[32m'"Ram Usages :" $tempvar
cat /tmp/ramcache | grep -v "Swap"
echo -e '\E[32m'"Swap Usages :" $tempvar
cat /tmp/ramcache | grep -v "Mem"

# Check Disk Usages
df -h| grep 'Filesystem\|/dev/md*' > /tmp/diskusage
echo -e '\E[32m'"Disk Usages :" $tempvar 
cat /tmp/diskusage

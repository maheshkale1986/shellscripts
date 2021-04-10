#!/bin/bash

load= cat /proc/loadavg | awk {'print $2'}

echo $load

if [ $load > 10 ] ; then

echo " Load is above 10"

cat /proc/loadavg  > /mnt/load.txt

#Add task and logic here


mailx -a  /mnt/load.txt -s 'Server load alert' mahesh.kale@gmail.com << EOF
Server load spiked so that flushing buffer cache.
EOF


else

echo "Load is below 10"

cat /proc/loadavg  > /mnt/load.txt

#Add task and logic here
mailx -a  /mnt/load.txt -s 'Server load is normal' mahesh.kale@gmail.com << EOF
Server is stable
EOF

fi

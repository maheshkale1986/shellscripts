freemem= cat /proc/meminfo | grep MemFree | awk {'print $2'}
echo $freemem
if [[ $freemem < 137636 ]] ; then


echo "Low memoey on server"
#echo 1 > /proc/sys/vm/drop_caches
else
echo "Sufficient memory on server"
fi


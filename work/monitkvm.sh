#!/bin/bash

if [ $1 ]; then
	SLEEP=$1
else
	SLEEP=15
fi

INDEX=0
LC_NUMERIC=C

NET_IN_OLD=0
NET_OUT_OLD=0

echo "time:CPU:MEM:USERS:NET_IN_MB:NET_OUT_MB:NET_INT_KB:NET_OUT_KB"

while true;
do

	CPU=`zabbix_get -s 200.129.21.20 -k "system.cpu.util[,,avg1]"`

	BUFFERS=`zabbix_get -s 200.129.21.20 -k "vm.memory.size[buffers]"`
	CACHED=`zabbix_get -s 200.129.21.20 -k "vm.memory.size[cached]"`
	USED=`zabbix_get -s 200.129.21.20 -k "vm.memory.size[used]"`
	MEM_USED=`expr $USED - $BUFFERS - $CACHED`
	MEM_USED=`expr $MEM_USED / 1024 / 1024`


	NET_IN=`zabbix_get -s 200.129.21.20 -k "net.if.in[eth0,bytes]"`
	NET_OUT=`zabbix_get -s 200.129.21.20 -k "net.if.out[eth0,bytes]"`
	NET_IN_SUM=`expr $NET_IN - $NET_IN_OLD`
	NET_OUT_SUM=`expr $NET_OUT - $NET_OUT_OLD`

	NET_IN_MB=`expr $NET_IN_SUM / 1024 / 1024`
	NET_OUT_MB=`expr $NET_OUT_SUM / 1024 / 1024`

	NET_IN_KB=`expr $NET_IN_SUM / 1024`
	NET_OUT_KB=`expr $NET_OUT_SUM / 1024`

	NET_IN_OLD=$NET_IN
	NET_OUT_OLD=$NET_OUT

	USERS=`php userskvm.php`


	echo -n "$INDEX:"
	#echo $CPU:$MEM_USED"M"
	printf "%0.2f:%dM:%dusers:%dMBps:%dMBps:%dKBps:%dKBps\n" $CPU $MEM_USED $USERS $NET_IN_MB $NET_OUT_MB $NET_IN_KB $NET_OUT_KB

	INDEX=`expr $INDEX + $SLEEP`
	sleep $SLEEP
done

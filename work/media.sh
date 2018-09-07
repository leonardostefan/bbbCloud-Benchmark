#!/bin/bash


if [ ! $1 ]; then
	echo "usage: $0 logname"
	exit 1
fi

CPU_MEAN_ARRAY=
MEM_MEAN_ARRAY=

LOG=$1
TOTAL_USERS=`tail -n 1 $LOG | awk -F: '{print $4}' | awk -F'users' '{print $1}'`

X=1

while [ $X -le $TOTAL_USERS ]; do

	CPU_ARRAY=`grep "${X}users" $LOG | awk -F: '{print $2}'`
	CPU_ARRAY_NUM=`grep "${X}users" $LOG | awk -F: '{print $2}' | wc -l`
	MEM_ARRAY=`grep "${X}users" $LOG | awk -F: '{print $3}' | awk -FM '{print $1}'`
	MEM_ARRAY_NUM=`grep "${X}users" $LOG | awk -F: '{print $3}' | awk -FM '{print $1}' | wc -l`

	SUM=0
	echo "user: $X"

	for CPU in $CPU_ARRAY; do
		SUM=`echo "scale = 2; $SUM + $CPU" | bc`
	done

	if [ $CPU_ARRAY_NUM = 0 ]; then
		echo "user $X not found!"
		CPU_MEAN=0
	else
		CPU_MEAN=`echo "scale = 2; $SUM / $CPU_ARRAY_NUM" | bc`
	fi

	
	SUM=0
	for MEM in $MEM_ARRAY; do
		SUM=`echo "scale = 2; $SUM + $MEM" | bc`
	done
	
	if [ $MEM_ARRAY_NUM = 0 ]; then
		echo "mem $X not found!"
		MEM_MEAN=0
	else
		MEM_MEAN=`echo "scale = 2; $SUM / $MEM_ARRAY_NUM" | bc`
	fi

	CPU_MEAN_ARRAY[$X]=$CPU_MEAN;
	MEM_MEAN_ARRAY[$X]=$MEM_MEAN;
	

	X=`expr $X + 1`
	
done




echo "CPU:"
for NUM in ${CPU_MEAN_ARRAY[@]}; do
        echo -n "$NUM, "
done

echo
echo "MEM:"
for NUM in ${MEM_MEAN_ARRAY[@]}; do
        echo -n "$NUM, "
done

echo

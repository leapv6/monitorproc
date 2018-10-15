#!/bin/bash

if [ -n $1 ];then 
	checkname=$1
	checknum=$2
	checkcmdline=$3

	echo $checkname
	echo $checknum
	echo $checkcmdline


	AA=`ss -tln | grep "$checkname" | grep -v "grep" | wc -l`			

	echo "__________AA=$AA"
	
	if [ $AA -lt 1 ];then

		eval $checkcmdline
	
	fi
		
#	echo "--------------Time"
	
fi

exit 0

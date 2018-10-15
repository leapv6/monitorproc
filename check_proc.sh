#!/bin/bash

if [ -n $1 ];then
        checkname=$1
        checknum=$2
        checkcmdline=$3
	
	echo $checkname

	existnum=0
	for procnum in /proc/*;
	do
		if [ -f "${procnum}/cmdline" ]
		then
		    cmdline=`cat ${procnum}/cmdline`
		    if [[ $cmdline == *$checkname* ]]
		    then
			echo $procnum
			echo $cmdline
			existnum=`expr $existnum + 1`	
		    fi				
		fi
		
	done
	
	for((i=0;i<=`expr $checknum - $existnum`;i++))
	do
	     echo "________________for_lt=$i"  
         eval $checkcmdline
	done	
	echo "________________________checknum=$checknum"	
	echo "________________________existnum=$existnum"
fi
exit 0

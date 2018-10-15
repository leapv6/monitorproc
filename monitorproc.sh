#!/bin/bash

while read IPstr
do
#	echo $IPstr
#	echo '__________________________';
	checkname=""
	checknum=""
	checkcmdline=""
        checktype=""
	i=1
	while((1==1))
	do
		split=`echo $IPstr|cut -d "|" -f$i`
		if [ "$split" != "" ]
		then
			case $i in
				1 )
					checkname=$split 
					;;
				2 )
					checknum=$split 
					;;
				3 )
					checkcmdline=$split 
					;;
				4 ) 	
					checktype=$split
					;;
				*)
					exit 1
					;;
			esac	
			((i++))
		else
			break;
		fi
	done
#	echo $checkname
#	echo $checknum
#	echo $checkcmdline
#	echo $checktype
	
	if [ "$checktype" = "port" ]
	then
		./check_port.sh "$checkname" "$checknum" "$checkcmdline"							
#		echo 'port______________________'
	fi

	if [ "$checktype" = "proc" ]
	then
		./check_proc.sh "$checkname" "$checknum" "$checkcmdline"							
#		echo 'proc______________________'
	fi
#	sleep 0.1
done < config.cfg

#!/bin/sh

FLAG=$(/usr/bin/hciconfig | grep 'hci0')
if [[ $FLAG == "" ]]; then 
	/usr/bin/hciattach /dev/ttymxc0 bcm43xx 3000000 flow -t 20 
fi

FLAG=$(/usr/bin/hciconfig | grep 'UP RUNNING')
if [[ $FLAG == "" ]]; then
	/usr/bin/hciconfig hci0 up
fi

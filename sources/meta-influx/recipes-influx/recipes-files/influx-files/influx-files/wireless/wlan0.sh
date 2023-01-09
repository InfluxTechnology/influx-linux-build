#!/bin/sh

FLAG=$(/sbin/ifconfig wlan0 | grep 'inet addr:' | cut -d: -f2)
if [[ $FLAG == "" ]]; then
        killall wpa_supplicant
        killall dhclient
        # start wlan communication
        /sbin/ifconfig wlan0 up
        rm /var/run/wpa_supplicant/wlan0

        /usr/sbin/wpa_supplicant -B -i wlan0 -D wext -c /etc/wpa_supplicant.conf
        /usr/sbin/dhcpcd wlan0

fi


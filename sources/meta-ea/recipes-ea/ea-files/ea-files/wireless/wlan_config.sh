#!/bin/sh

# check for Download Enter stage
if test -f /data/mender/Download-Enter; then
	exit 
fi 

/usr/bin/crontab -u root -l |  /bin/grep -v "* /etc/mender/scripts/ArtifactReboot_Leave_00" |  /usr/bin/crontab -

# check IP of wlan0 is assigned
FLAG=$(/sbin/ifconfig wlan0 | grep 'inet addr:' | cut -d: -f2)
if [[ $FLAG != "" ]]; then
        ping -I wlan0 -q -c5 8.8.8.8 > /dev/null
        if [[ $? -eq 0 ]]; then
                /opt/influx/mender_client_start.sh
                exit
        fi
fi

#/opt/influx/mender_client_start.sh
#sleep 3

# start wlan communication
/sbin/ifconfig wlan0 up
#if test -f /var/run/wpa_supplicant/wlan0; then
    rm /var/run/wpa_supplicant/wlan0
#fi
/usr/sbin/wpa_supplicant -B -i wlan0 -D wext -c /etc/wpa_supplicant.conf 
/sbin/dhclient wlan0 

#sleep 2
FLAG=$(/sbin/ifconfig wlan0 | grep 'inet addr:' | cut -d: -f2)
if [[ $FLAG != "" ]]; then
        /opt/influx/mender_client_start.sh
fi


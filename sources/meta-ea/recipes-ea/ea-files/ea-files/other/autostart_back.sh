#!/bin/sh

# Extract node.js modules (web3, dotenv, bleno)
if test -f node_modules.tar; then
    cd /home/root
    tar -xzf node_modules.tar
    rm node_modules.tar
fi

# Set some permisions
if test -f /home/root/rexusb/rexgen; then
    chmod +x /home/root/rexusb/rexgen
fi

# disable splash service
#enabled_splash=$(systemctl is-enabled psplash-quit.service)
#if [ "$enabled_splash" == "enabled" ];
#then
#    systemctl disable psplash-quit.service
#    systemctl stop psplash-quit.service
#fi 

#echo 510 > /sys/class/gpio/export 
#echo high > /sys/class/gpio/gpio510/direction

# enable autostart service
enabled=$(systemctl is-enabled autostart.service)
if [ "$enabled" != "enabled" ];
then
    systemctl enable autostart.service
    systemctl start autostart.service
fi

# enable awake service
#enabled=$(systemctl is-enabled awake.service)
#if [ "$enabled" != "enabled" ];
#then
#    systemctl enable awake.service
#    systemctl start awake.service
#fi

## Set these GPIO like outputs
# JB02
GPIO0=$(cat /sys/kernel/debug/gpio | grep 'gpio-0 ')
if [ "$GPIO0" == "" ]; then 
    echo 0 > /sys/class/gpio/export			
    echo out > /sys/class/gpio/gpio0/direction
fi
# JB04
GPIO1=$(cat /sys/kernel/debug/gpio | grep 'gpio-1 ')
if [ "$GPIO1" == "" ]; then 
    echo 1 > /sys/class/gpio/export			
    echo out > /sys/class/gpio/gpio1/direction
fi 
# JB09
GPIO6=$(cat /sys/kernel/debug/gpio | grep 'gpio-6 ')
if [ "$GPIO6" == "" ]; then 
    echo 6 > /sys/class/gpio/export			
    echo out > /sys/class/gpio/gpio6/direction
fi
echo 0 > /sys/class/gpio/gpio6/value # uncomment in operational mode
# JB10
GPIO7=$(cat /sys/kernel/debug/gpio | grep 'gpio-7 ')
if [ "$GPIO7" == "" ]; then 
    echo 7 > /sys/class/gpio/export			
    echo out > /sys/class/gpio/gpio7/direction
fi
# JB14
GPIO9=$(cat /sys/kernel/debug/gpio | grep 'gpio-9 ')
if [ "$GPIO9" == "" ]; then 
    echo 9 > /sys/class/gpio/export			
    echo out > /sys/class/gpio/gpio9/direction
fi
echo 0 > /sys/class/gpio/gpio9/value # uncomment in operational mode
# JB40 - LED green
GPIO140=$(cat /sys/kernel/debug/gpio | grep gpio-140)
if [ "$GPIO140" == "" ]; then 
    echo 140 > /sys/class/gpio/export			
    echo out > /sys/class/gpio/gpio140/direction
fi
echo 1 > /sys/class/gpio/gpio140/value # uncomment in operational mode
# JB42
GPIO139=$(cat /sys/kernel/debug/gpio | grep gpio-139)
if [ "$GPIO139" == "" ]; then 
    echo 139 > /sys/class/gpio/export			
    echo out > /sys/class/gpio/gpio139/direction
fi
echo 0 > /sys/class/gpio/gpio139/value # uncomment in operational mode
# JB44 - LED red
GPIO141=$(cat /sys/kernel/debug/gpio | grep gpio-141)
if [ "$GPIO141" == "" ]; then 
    echo 141 > /sys/class/gpio/export			
    echo out > /sys/class/gpio/gpio141/direction
fi

# move old BT firm ware
if [ -f /etc/firmware/BCM4345C0_003.001.025.0144.0266.1MW.hcd ]; then
    mv /etc/firmware/BCM4345C0_003.001.025.0144.0266.1MW.hcd /etc/firmware/murata-master/_BCM4345C0_003.001.025.0144.0266.1MW.hcd
fi

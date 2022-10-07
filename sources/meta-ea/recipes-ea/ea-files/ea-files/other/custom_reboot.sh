#!/bin/sh
# after reboot, may  see real booting time with: cat /opt/influx/etc/custom.log

echo "" > /opt/influx/etc/custom_reboot 
/opt/influx/cust_log.sh "reboot" && reboot



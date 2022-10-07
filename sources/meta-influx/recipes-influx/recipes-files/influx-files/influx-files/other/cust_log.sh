#!/bin/sh

DATE=$(/bin/date)
echo $DATE "|" $1 >> /opt/influx/etc/custom.log

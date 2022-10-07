#!/bin/sh

EDITOR=nano	# crontab uses this editor

# Set some GPIO pins like outputs
/opt/influx/set_gpio.sh

# prepare config files for LTE communication
if test -f /opt/influx/options; then
    mv /opt/influx/options /etc/ppp/
    mv /opt/influx/pap-secrets /etc/ppp/
fi

# to add this jobs in crontab just one time
/usr/bin/crontab -u root -l |  /bin/grep -v "* /etc/mender/scripts/ArtifactReboot_Leave_00" |  /usr/bin/crontab -
/usr/bin/crontab -u root -l | { cat; echo "*/5 * * * * /etc/mender/scripts/ArtifactReboot_Leave_00"; } | /usr/bin/crontab -
/usr/bin/crontab -u root -l |  /bin/grep -v "* /opt/influx/wlan_config.sh" |  /usr/bin/crontab -

# Basic patching system
/usr/bin/crontab -u root -l |  /bin/grep -v "* /opt/influx/release_check.sh" |  /usr/bin/crontab -
/usr/bin/crontab -u root -l |  /bin/grep -v "* /opt/influx/reboot.sh" |  /usr/bin/crontab -

# load to RexGen proper configuration
#/home/root/rexusb/rexgen configure /home/root/rexusb/config/Structure_v7.rxc

rm /data/mender/Download-Enter	# for safe


#!/bin/sh

# rexgen support
if test -f /home/root/rexusb/rexgen; then
	chmod +x /home/root/rexusb/rexgen

        # create link to gexgen
        if [ ! -f /usr/local/bin/rexgen ]; then
                ln -s /home/root/rexusb/rexgen /usr/local/bin/rexgen
        fi
fi
if test -f /home/root/rexusb/rexgen_stream; then
	chmod +x /home/root/rexusb/rexgen_stream
fi

# move old BT firm ware
if [ -f /etc/firmware/BCM4345C0_003.001.025.0144.0266.1MW.hcd ]; then
	mv /etc/firmware/BCM4345C0_003.001.025.0144.0266.1MW.hcd /etc/firmware/murata-master/_BCM4345C0_003.001.025.0144.0266.1MW.hcd
fi

# enable autostart service
as_enabled=$(systemctl is-enabled autostart.service)
if [ "$as_enabled" != "enabled" ];
then
	systemctl enable autostart.service
	systemctl start autostart.service
fi

# enable send/receiveCAN messages service
if test -f /home/root/rexusb/rexgen_stream; then
	chmod +x /home/root/rexusb/rexgen_stream
fi
rd_enabled=$(systemctl is-enabled rexgen_data.service)
if [ "$rd_enabled" != "enabled" ];
then
	systemctl enable rexgen_data.service
	systemctl start rexgen_data.service
fi

# enable mender-connect service
if test -f /opt/influx/mender-connect; then
	chmod +x /opt/influx/mender-connect
	mv /opt/influx/mender-connect /usr/bin/       
fi 

# copy mender.conf
if test -f /opt/influx/mender.conf; then
	mv /opt/influx/mender.conf /etc/mender/mender.conf
fi

if test -f /opt/influx/preserved-files; then
	mv /opt/influx/preserved-files /data/mender/preserved-files
fi

# kernel modules
if ls /opt/influx/etc/*.ko 1> /dev/null 2>&1; then
	if [ ! -d /lib/modules/$(uname -r)/extra ]; then 
		mkdir /lib/modules/$(uname -r)/extra/
	fi
        mv /opt/influx/etc/*.ko /lib/modules/$(uname -r)/extra/
        depmod -a
fi

# crontab uses this editor
EDITOR=nano	
/usr/bin/crontab -u root -l |  /bin/grep -v "* /etc/profile.d/firststart.sh" |  /usr/bin/crontab -

# uhubctl tool 
if test -f /opt/influx/uhubctl; then
	chmod +x /opt/influx/uhubctl
	mv /opt/influx/uhubctl /usr/local/bin/
fi
if test -f /usr/local/bin/uhubctl; then 
	chmod +x /usr/local/bin/uhubctl
fi

# rc.local 
if test -f /opt/influx/rc.local; then
	chmod +x /opt/influx/rc.local
	mv /opt/influx/rc.local /etc/
fi

# cmake
if [ ! -f /usr/bin/cmake ]; then 
	mv cmake-3.23.0-linux-aarch64.archive cmake-3.23.0-linux-aarch64.tar.gz
	/opt/influx/cmake/cmake-3.23.0-linux-aarch64.sh --skip-license --prefix=/opt/influx/cmake/
	if [ -f/opt/influx/cmake/bin/cmake ]; then
		ln -s /opt/influx/cmake/bin/cmake /usr/bin/cmake
	fi
fi

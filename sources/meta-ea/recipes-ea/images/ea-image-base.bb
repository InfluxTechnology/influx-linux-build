SUMMARY = "A console-only image that fully supports the target device \
hardware."

IMAGE_FEATURES += "splash ssh-server-openssh"

LICENSE = "MIT"

IMAGE_INSTALL = "\
   ${CORE_IMAGE_BASE_INSTALL} \
   i2c-tools-misc \
   i2c-tools \
   pciutils \
   can-utils \
   iproute2 \
   evtest \
   alsa-utils \
   fbida \
   wget \
   nano \
   python-subprocess \
   python-pyserial \
   python-argparse \
   python-pip \
   gdbserver \
   openssh-sftp-server \
   sqlite3 \
   v4l-utils \
   packagegroup-fsl-gstreamer1.0 \
   packagegroup-fsl-gstreamer1.0-full \
   backporttool-linux \
   kernel-modules-pcie8997 \
   linux-firmware-pcie8997 \
   kernel-modules-sdio8997 \
   bluez5 \
   bluez5-noinst-tools \
   bluez5-obex \
   murata-binaries \
   openobex \
   obexftp \
   glibc-gconv-utf-16 \
   glibc-utils \
   cyw-supplicant \
   iperf3 \
   tslib \
   tslib-tests \
   tslib-calibrate \
   tslib-dev \
   mtdev \
   ea-files \
   influx-files \
   mmc-utils \
   hostap-conf \
   hostap-utils \
   hostapd \
   memtester \
   screen \
   u-boot-fw-utils \
   u-boot-script-ea \
   ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'weston-init', '', d)} \
   ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'weston-examples', '', d)} \
"

IMAGE_INSTALL_append_imx8mnea-ucom = "\
   ea-resizefs \
"

inherit core-image

# User/Group modifications"
# - Adding user 'tester' without password"
# - Setting password for user 'root' to 'pass'"
# - For more options see extrausers.bbclass"

inherit extrausers
#EXTRA_USERS_PARAMS = " \
#  useradd -p '' tester; \
#  usermod -s /bin/sh tester; \
#  usermod -P 'pass' root \
#"

EXTRA_USERS_PARAMS = " \
	usermod -P 'pass' root; \
"

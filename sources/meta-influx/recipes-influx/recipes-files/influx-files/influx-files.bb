SUMMARY = "Miscellaneous files for the base system"
DESCRIPTION = "The ea-files package adds some files referenced in documentation."
SECTION = "base"
LICENSE = "MIT"
LIC_FILES_CHKSUM="file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://rexusb/libusb.so \
	file://rexusb/rexgen \
	file://rexusb/demo/canreader.js \
	file://rexusb/demo/canreader.py \
	file://rexusb/demo/cansend.py \
	file://rexusb/demo/gnss2can.js \
	file://rexusb/rexgen_data.service \
	file://rexusb/rexgen_stream \
	file://rexusb/firmware/firmware_3.21.bin \
	file://rexusb/config/Structure_v7.rxc \
	file://rexusb/config/Structure_v8_4CAN.rxc \
	file://rexusb/config/Structure_v7.xml \
	file://rexusb/config/Structure_v8_4CAN.xml \
	file://rexusb/rexgen_usb/uhubctl \
	file://rexusb/rexgen_usb/rexgen_usb.conf \
	file://rexusb/rexgen_usb/rexgen_usb.ko \
	file://rexusb/rexgen_usb/driver_reconnect.sh \
	file://rexusb/rexgen_usb/pipes_reconnect.sh \
	file://rexusb/rexgen_usb/usb_restore.sh \
	file://ppp/ppp_generic.ko \
	file://ppp/ppp_generic.conf \
	file://ppp/slhc.ko \
	file://ppp/slhc.conf \
	file://ppp/ppp_deflate.ko \
	file://ppp/ppp_deflate.conf \
	file://ppp/ppp_async.ko \
	file://ppp/ppp_async.conf \
	file://ppp/bsd_comp.ko \
	file://ppp/bsd_comp.conf \
	file://ppp/crc-ccitt.ko \
	file://ppp/crc-ccitt.conf \
	file://other/node_modules.tar \
	file://other/autostart.sh \
	file://other/autostart.service \
	file://other/gnssdata.service \
	file://other/set_gpio.sh \
	file://other/firststart.sh \
	file://other/release_check.sh \
	file://other/rc.local \
	file://other/install_streamr.sh \
	file://other/interfaces \
	file://other/VERSION \
	file://wireless/wakeup_BT.sh \
	file://wireless/wlan_config.sh \
	file://wireless/wlan0.sh \
	file://wireless/hci0.sh \
	file://wireless/BCM4345C0_003.001.025.0175.0000_Murata_1MW_SXM_TEST_ONLY.hcd \
	file://lte/SARA-R510M8S-00B-01_FW02.06_A00.01_IP.upd \
	file://lte/SARA-R510M8S-01B-00_FW03.03_A00.01_PT.dof \
	file://lte/options \
	file://lte/1nce.provider \
	file://lte/1nce.BG.provider \
	file://lte/pap-secrets \
	file://lte/1nce-new.chat \
	file://lte/1nce-new.BG.chat \
	file://lte/wvdial.conf \
	file://lte/ublox-up-down-pin.sh \
	file://lte/lte_start_ppp.sh \
	file://lte/lte_start_wvdial.sh \
	file://crypto/dm-mod.conf \
	file://crypto/dm-crypt.conf \
	file://crypto/caam-keygen \
	file://mender/mender-connect \
	file://mender/mender-connect.service \
	file://mender/mender-connect.conf \
	file://mender/demo.crt \
        file://mender/directory \
	file://mender/mender.conf \
	file://mender/mender-device-identity_ppp \
	file://mender/mender_client_start.sh \
	file://mender/preserved-files \
	file://mender/scripts/ArtifactCommit_Enter_00 \
	file://mender/scripts/ArtifactCommit_Leave_00 \
	file://mender/scripts/ArtifactCommit_Leave_01_cron-job \
	file://mender/scripts/ArtifactInstall_Enter_01_info \
	file://mender/scripts/ArtifactInstall_Error_00 \
	file://mender/scripts/ArtifactInstall_Leave_00 \
	file://mender/scripts/ArtifactReboot_Enter_01_info \
	file://mender/scripts/ArtifactReboot_Leave_00 \
	file://mender/scripts/Download_Enter_00 \
	file://mender/scripts/Download_Error_00 \
	file://mender/scripts/Download_Leave_00 \
	file://mender/scripts/Sync_Enter_01_info \
	file://gnss/gnssdata \
	file://gnss/escape.minicom \
	file://gnss/GNSS.v3.dbc \
	file://gnss/AccelGyro.dbc \
	file://gnss/DigitalADC.dbc \
	file://gnss/gnssdata_start.sh \
	file://gnss/minirc.dfl \
	file://gnss/gnssinit.py \
	file://cmake/cmake-3.23.0-linux-aarch64.sh \
	file://cmake/cmake-3.23.0-linux-aarch64.archive \
	"

S = "${WORKDIR}"

INFLUX_FILES_644 ?= ""
INFLUX_FILES_755 ?= ""
INFLUX_FILES_DIRS ?= ""

#SYSTEMD_SERVICE_${PN} = " autostart.service"
#SYSTEMD_AUTO_ENABLE_${PN} = " enable"

do_install () {
    	install -m 0755 -d ${D}${sysconfdir}/systemd/network
    	install -m 0755 -d ${D}${systemd_system_unitdir}
	install -m 0755 -d ${D}/opt
    	install -m 0755 -d ${D}/opt/ea

	# Influx Technology
	# to find kernel release, type 'uname -r' on device and fill here  
    	EXTRA_DIR="/lib/modules/5.4.47-2.2.0+g161bda044/extra/"
    	MODULE_DIR="/lib/modules/5.4.47-2.2.0+g161bda044/"

    	HOME_DIR="/home/root/"
	REX_USB_DIR="/home/root/rexusb/"
    	REX_FRM_DIR="/home/root/rexusb/firmware"
    	REX_CFG_DIR="/home/root/rexusb/config"
    	INFLUX_DIR="/opt/influx/"

    	install -m 0755 -d ${D}${EXTRA_DIR}
    	install -m 0755 -d ${D}${REX_USB_DIR}
    	install -m 0755 -d ${D}${REX_USB_DIR}/demo/
    	install -m 0755 -d ${D}${REX_FRM_DIR}
    	install -m 0755 -d ${D}${REX_CFG_DIR}
    	install -m 0755 -d ${D}${INFLUX_DIR}
    	install -m 0755 -d ${D}${INFLUX_DIR}/etc/
    	install -m 0755 -d ${D}${INFLUX_DIR}/cmake/
    	install -m 0755 -d ${D}/etc/modules-load.d/
    	install -m 0755 -d ${D}/home/root/
    	install -m 0755 -d ${D}/etc/profile.d/
    	install -m 0755 -d ${D}/etc/ppp/
    	install -m 0755 -d ${D}/etc/ppp/peers/
    	install -m 0755 -d ${D}/etc/chatscripts/
    	install -m 0755 -d ${D}/etc/systemd/system/
    	install -m 0755 -d ${D}/etc/firmware/
    	install -m 0755 -d ${D}/etc/firmware/murata-master/
    	install -m 0755 -d ${D}/etc/mender/
    	install -m 0755 -d ${D}/etc/network/
    	install -m 0755 -d ${D}/etc/mender/scripts/
    	install -m 0755 -d ${D}/usr/share/mender/
    	install -m 0755 -d ${D}/usr/share/mender/modules/v3/
    	install -m 0755 -d ${D}/usr/local/bin/

	for d in ${INFLUX_FILES_DIRS}; do
		install -m 0755 -d ${D}${d}
	done

	# Influx Technology
    	# RexGen support
    	install -m 0644 ${WORKDIR}/rexusb/libusb.so ${D}${REX_USB_DIR}/libusb.so
    	install -m 0644 ${WORKDIR}/rexusb/rexgen ${D}${REX_USB_DIR}/rexgen
    	install -m 0644 ${WORKDIR}/rexusb/rexgen_stream ${D}${REX_USB_DIR}/rexgen_stream
    	install -m 0644 ${WORKDIR}/rexusb/demo/canreader.js ${D}${REX_USB_DIR}/demo/canreader.js
    	install -m 0644 ${WORKDIR}/rexusb/demo/canreader.py ${D}${REX_USB_DIR}/demo/canreader.py
    	install -m 0644 ${WORKDIR}/rexusb/demo/cansend.py ${D}${REX_USB_DIR}/demo/cansend.py
    	install -m 0644 ${WORKDIR}/rexusb/demo/gnss2can.js ${D}${REX_USB_DIR}/demo/gnss2can.js
    	install -m 0644 ${WORKDIR}/rexusb/rexgen_data.service ${D}/etc/systemd/system/rexgen_data.service
    	install -m 0644 ${WORKDIR}/rexusb/firmware/firmware_3.21.bin ${D}${REX_FRM_DIR}/firmware_3.21.bin
    	install -m 0644 ${WORKDIR}/rexusb/config/Structure_v7.rxc ${D}${REX_CFG_DIR}/Structure_v7.rxc
	install -m 0644 ${WORKDIR}/rexusb/config/Structure_v7.xml ${D}${REX_CFG_DIR}/Structure_v7.xml
    	install -m 0644 ${WORKDIR}/rexusb/config/Structure_v8_4CAN.rxc ${D}${REX_CFG_DIR}/Structure_v8_4CAN.rxc
	install -m 0644 ${WORKDIR}/rexusb/config/Structure_v8_4CAN.xml ${D}${REX_CFG_DIR}/Structure_v8_4CAN.xml

    	# rexgen_usb driver	
    	install -m 0644 ${WORKDIR}/rexusb/rexgen_usb/uhubctl ${D}/usr/local/bin/uhubctl
    	install -m 0755 ${WORKDIR}/rexusb/rexgen_usb/driver_reconnect.sh ${D}${INFLUX_DIR}/driver_reconnect.sh
    	install -m 0755 ${WORKDIR}/rexusb/rexgen_usb/pipes_reconnect.sh ${D}${INFLUX_DIR}/pipes_reconnect.sh
    	install -m 0755 ${WORKDIR}/rexusb/rexgen_usb/usb_restore.sh ${D}${INFLUX_DIR}/usb_restore.sh
    	install -m 0755 ${WORKDIR}/rexusb/rexgen_usb/rexgen_usb.ko ${D}${EXTRA_DIR}/rexgen_usb.ko
    
    	# gnssdata support
    	install -m 0644 ${WORKDIR}/gnss/GNSS.v3.dbc ${D}${INFLUX_DIR}/etc/GNSS.v3.dbc
    	install -m 0644 ${WORKDIR}/gnss/AccelGyro.dbc ${D}${INFLUX_DIR}/etc/AccelGyro.dbc
    	install -m 0644 ${WORKDIR}/gnss/DigitalADC.dbc ${D}${INFLUX_DIR}/etc/DigitalADC.dbc
    	install -m 0644 ${WORKDIR}/gnss/escape.minicom ${D}${INFLUX_DIR}/escape.minicom
    	install -m 0755 ${WORKDIR}/gnss/gnssdata_start.sh ${D}${INFLUX_DIR}/gnssdata_start.sh
    	install -m 0644 ${WORKDIR}/gnss/minirc.dfl ${D}/etc/minirc.dfl
    	install -m 0755 ${WORKDIR}/gnss/gnssinit.py ${D}${INFLUX_DIR}/gnssinit.py

    	# ppp support
    	install -m 0755 ${WORKDIR}/ppp/ppp_generic.ko ${D}${EXTRA_DIR}/ppp_generic.ko
    	install -m 0755 ${WORKDIR}/ppp/slhc.ko ${D}${EXTRA_DIR}/slhc.ko
    	install -m 0755 ${WORKDIR}/ppp/ppp_deflate.ko ${D}${EXTRA_DIR}/ppp_deflate.ko
    	install -m 0755 ${WORKDIR}/ppp/ppp_async.ko ${D}${EXTRA_DIR}/ppp_async.ko
    	install -m 0755 ${WORKDIR}/ppp/bsd_comp.ko ${D}${EXTRA_DIR}/bsd_comp.ko
    	install -m 0755 ${WORKDIR}/ppp/crc-ccitt.ko ${D}${EXTRA_DIR}/crc-ccitt.ko

    	# crypto support
#    install -m 0755 ${WORKDIR}/crypto/caam-keygen ${D}${USR_BIN_DIR}/caam-keygen

    	# wireless
    	install -m 0755 ${WORKDIR}/wireless/wakeup_BT.sh ${D}${INFLUX_DIR}/wakeup_BT.sh
    	install -m 0755 ${WORKDIR}/wireless/wlan0.sh ${D}${INFLUX_DIR}/wlan0.sh
    	install -m 0755 ${WORKDIR}/wireless/hci0.sh ${D}${INFLUX_DIR}/hci0.sh
    	install -m 0755 ${WORKDIR}/wireless/BCM4345C0_003.001.025.0175.0000_Murata_1MW_SXM_TEST_ONLY.hcd ${D}/etc/firmware/BCM4345C0_003.001.025.0175.0000_Murata_1MW_SXM_TEST_ONLY.hcd

    	# LTE
    	install -m 0644 ${WORKDIR}/lte/SARA-R510M8S-00B-01_FW02.06_A00.01_IP.upd ${D}${INFLUX_DIR}/SARA-R510M8S-00B-01_FW02.06_A00.01_IP.upd
    	install -m 0644 ${WORKDIR}/lte/SARA-R510M8S-01B-00_FW03.03_A00.01_PT.dof ${D}${INFLUX_DIR}/SARA-R510M8S-01B-00_FW03.03_A00.01_PT.dof
    	install -m 0644 ${WORKDIR}/lte/options ${D}${INFLUX_DIR}/options 		
    	install -m 0644 ${WORKDIR}/lte/1nce.provider ${D}/etc/ppp/peers/1nce.provider
    	install -m 0644 ${WORKDIR}/lte/pap-secrets ${D}${INFLUX_DIR}/pap-secrets	
    	install -m 0644 ${WORKDIR}/lte/1nce-new.chat ${D}/etc/chatscripts/1nce-new.chat
    	install -m 0644 ${WORKDIR}/lte/wvdial.conf  ${D}/etc/wvdial.conf
    	install -m 0755 ${WORKDIR}/lte/ublox-up-down-pin.sh ${D}${INFLUX_DIR}/ublox-up-down-pin.sh
    	install -m 0755 ${WORKDIR}/lte/lte_start_ppp.sh ${D}${INFLUX_DIR}/lte_start_ppp.sh
    	install -m 0755 ${WORKDIR}/lte/lte_start_wvdial.sh ${D}${INFLUX_DIR}/lte_start_wvdial.sh

    	# mender 
    	install -m 0644 ${WORKDIR}/mender/mender-connect ${D}${INFLUX_DIR}/mender-connect
    	install -m 0644 ${WORKDIR}/mender/mender-connect.conf ${D}/etc/mender/mender-connect.conf
    	install -m 0644 ${WORKDIR}/mender/mender-connect.service ${D}/etc/systemd/system/mender-connect.service
    	install -m 0755 ${WORKDIR}/mender/mender_client_start.sh ${D}${INFLUX_DIR}/mender_client_start.sh
    	install -m 0755 ${WORKDIR}/mender/mender_client_start.sh ${D}${INFLUX_DIR}/etc/mender_client_start.sh
    	install -m 0644 ${WORKDIR}/mender/demo.crt ${D}/usr/share/mender/demo.crt
    	install -m 0755 ${WORKDIR}/mender/directory ${D}/usr/share/mender/modules/v3/directory
    	install -m 0600 ${WORKDIR}/mender/mender.conf ${D}${INFLUX_DIR}/mender.conf
    	install -m 0644 ${WORKDIR}/mender/preserved-files ${D}${INFLUX_DIR}/preserved-files

    	install -m 0755 ${WORKDIR}/mender/scripts/ArtifactReboot_Leave_00 ${D}/etc/mender/scripts/ArtifactReboot_Leave_00
    	install -m 0755 ${WORKDIR}/mender/scripts/Download_Enter_00 ${D}/etc/mender/scripts/Download_Enter_00
    	install -m 0755 ${WORKDIR}/mender/scripts/Download_Error_00 ${D}/etc/mender/scripts/Download_Error_00
    	install -m 0755 ${WORKDIR}/mender/scripts/Download_Leave_00 ${D}/etc/mender/scripts/Download_Leave_00

    	# other
    	install -m 0755 ${WORKDIR}/other/VERSION ${D}${INFLUX_DIR}/VERSION
    	install -m 0755 ${WORKDIR}/other/autostart.sh ${D}${INFLUX_DIR}/autostart.sh
    	install -m 0755 ${WORKDIR}/other/interfaces ${D}/etc/network/interfaces
    	install -m 0755 ${WORKDIR}/other/firststart.sh ${D}/etc/profile.d/firststart.sh
    	install -m 0755 ${WORKDIR}/other/set_gpio.sh ${D}${INFLUX_DIR}/set_gpio.sh
    	install -m 0755 ${WORKDIR}/other/release_check.sh ${D}${INFLUX_DIR}/release_check.sh
    	install -m 0644 ${WORKDIR}/other/autostart.service ${D}/etc/systemd/system/autostart.service
    	install -m 0644 ${WORKDIR}/other/rc.local ${D}${INFLUX_DIR}/rc.local
    	install -m 0644 ${WORKDIR}/other/install_streamr.sh ${D}${INFLUX_DIR}/install_streamr.sh

    	# cmake
    	install -m 0755 ${WORKDIR}/cmake/cmake-3.23.0-linux-aarch64.sh ${D}${INFLUX_DIR}/cmake/cmake-3.23.0-linux-aarch64.sh
    	install -m 0755 ${WORKDIR}/cmake/cmake-3.23.0-linux-aarch64.archive ${D}${INFLUX_DIR}/cmake/cmake-3.23.0-linux-aarch64.archive

    	# load kernel modules at start
    	install -m 0644 ${WORKDIR}/ppp/ppp_generic.conf ${D}/etc/modules-load.d/ppp_generic.conf
    	install -m 0644 ${WORKDIR}/ppp/slhc.conf ${D}/etc/modules-load.d/slhc.conf
    	install -m 0644 ${WORKDIR}/ppp/ppp_deflate.conf ${D}/etc/modules-load.d/ppp_deflate.conf
    	install -m 0644 ${WORKDIR}/ppp/ppp_async.conf ${D}/etc/modules-load.d/ppp_async.conf
    	install -m 0644 ${WORKDIR}/ppp/bsd_comp.conf ${D}/etc/modules-load.d/bsd_comp.conf
    	install -m 0644 ${WORKDIR}/ppp/crc-ccitt.conf ${D}/etc/modules-load.d/crc-ccitt.conf
    	install -m 0644 ${WORKDIR}/crypto/dm-mod.conf ${D}/etc/modules-load.d/dm-mod.conf
    	install -m 0644 ${WORKDIR}/crypto/dm-crypt.conf ${D}/etc/modules-load.d/dm-crypt.conf
    	install -m 0644 ${WORKDIR}/rexusb/rexgen_usb/rexgen_usb.conf ${D}/etc/modules-load.d/rexgen_usb.conf


	for d in ${INFLUX_FILES_644}; do
		f_in=$(echo "${d}" | cut -d":" -f1)
		f_out=$(echo "$d" | cut -d":" -f2)
		if [ "${f_in#/}" = "${f_in}" ]] ;
		then
			install -m 0644 ${TOPDIR}/${f_in} ${D}${f_out}
		else
			install -m 0644 ${f_in} ${D}${f_out}
		fi
	done
	for d in ${INFLUX_FILES_755}; do
		f_in=$(echo "${d}" | cut -d":" -f1)
		f_out=$(echo "$d" | cut -d":" -f2)
		if [ "${f_in#/}" = "${f_in}" ]] ;
		then
			install -m 0755 ${TOPDIR}/${f_in} ${D}${f_out}
		else
			install -m 0755 ${f_in} ${D}${f_out}
		fi
	done
}

PACKAGES = "${PN}"
FILES_${PN} = "/"

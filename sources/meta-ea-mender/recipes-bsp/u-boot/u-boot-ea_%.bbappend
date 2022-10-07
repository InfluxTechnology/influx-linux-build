require recipes-bsp/u-boot/u-boot-mender.inc

FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append_imx8mmea-ucom = " file://0001-Mender-req-configurations-8mm.patch"
SRC_URI_append_imx8mnea-ucom = " file://0002-Mender-req-configurations-8mn.patch"
SRC_URI_append_imx8mqea-com = " file://0003-Mender-req-configurations-8mq.patch"

MENDER_UBOOT_STORAGE_DEVICE_imx8mmea-ucom = "2"
MENDER_UBOOT_STORAGE_DEVICE_imx8mnea-ucom = "2"
MENDER_UBOOT_STORAGE_DEVICE_imx8mqea-ucom = "0"

MENDER_UBOOT_AUTO_CONFIGURE = "0"


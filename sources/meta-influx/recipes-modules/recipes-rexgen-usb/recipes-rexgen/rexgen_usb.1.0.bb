SUMMARY = "ReXgen kernel module for Linux provides socketCAN"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"

inherit module

SRC_URI = "file://Makefile \
           file://rexgen_def.h \
           file://rexgen_socketcan.c \
           file://rexgen_usb_func.c \
          "

S = "${WORKDIR}"

# The inherit of module.bbclass will automatically name module packages with
# "kernel-module-" prefix as required by the oe-core build environment.

RPROVIDES_${PN} += "kernel-module-rexgen_usb"

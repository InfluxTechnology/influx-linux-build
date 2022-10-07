SUMMARY="Caam-keygen tool"
SECTION="examples"
LICENSE="MIT"
LIC_FILES_CHKSUM="file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI="file://caam-keygen.c \
    file://caam-keygen.h \
    file://caam-keygen_priv.h \
    "

S="${WORKDIR}"

do_compile() {
    ${CC} caam-keygen.c -o caam-keygen
}

do_install() {
    install -d ${D}${bindir}
    install -m 0755 caam-keygen ${D}${bindir}
}

INSANE_SKIP_${PN}="ldflags"
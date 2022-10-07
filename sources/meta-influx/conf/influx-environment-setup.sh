
# Environment setup script
#
# i.MX Yocto Project Build Environment Setup Script
#
# Copyright 2022 Influx Technology LTD
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

. ea-setup-release.sh $@

sed -i '/meta-nxp-demo-experience/d' conf/bblayers.conf

echo "" >> conf/bblayers.conf
echo "# Mender related layers" >> conf/bblayers.conf
echo "BBLAYERS += \" \${BSPDIR}/sources/meta-mender-community/meta-mender-imx \"" >> conf/bblayers.conf
echo "BBLAYERS += \" \${BSPDIR}/sources/meta-mender/meta-mender-core \"" >> conf/bblayers.conf
echo "BBLAYERS += \" \${BSPDIR}/sources/meta-ea-mender \"" >> conf/bblayers.conf

echo "" >> conf/bblayers.conf
echo "# Influx Technology layers" >> conf/bblayers.conf
echo "BBLAYERS += \" \${BSPDIR}/sources/meta-influx/recipes-image \""  >> conf/bblayers.conf
echo "BBLAYERS += \" \${BSPDIR}/sources/meta-influx/recipes-influx \""  >> conf/bblayers.conf

sed -i 's/EXTRA_IMAGE_FEATURES += "package-management"/EXTRA_IMAGE_FEATURES += "package-management debug-tweaks"/' conf/local.conf
cat ../sources/meta-influx/conf/local.conf.influx >> conf/local.conf
cat ../sources/meta-mender-community/templates/local.conf.append >> conf/local.conf
sed -i 's/MENDER_ARTIFACT_NAME = "release-1"/MENDER_ARTIFACT_NAME = "redge_v.1.1"/' conf/local.conf
cat ../sources/meta-influx/conf/local.conf.mender >> conf/local.conf


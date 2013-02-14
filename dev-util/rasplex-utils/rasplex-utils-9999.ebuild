# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils flag-o-matic git-2 toolchain-funcs

DESCRIPTION="Rasplex - Plex home theatre for raspberry pi"
HOMEPAGE="http://srvthe.net"
EGIT_REPO_URI="https://github.com/dalehamel/rasplex-utils.git"
#EGIT_COMMIT="2d9bddd5a1f910e3f8fc20109ad0450f4aa5701a"
EGIT_BRANCH="master"

#http://forums.plexapp.com/index.php/topic/56099-experimental-ubuntu-package-for-plexht/

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm"
IUSE=""



#note: it is quite likely that not all of these are required
# This dependency list is taken from xbmc ebuild, and dependencies for
# 
RDEPEND="
app-admin/sudo
app-editors/vim
app-portage/gentoolkit
dev-util/oprofile
dev-util/google-perftools:1
net-misc/ntp
net-misc/wicd[-gtk]
sys-apps/usbutils
sys-block/parted
sys-devel/gdb
"

src_install(){

	bash -lc "cp -r ${S}/* ${D} || exit 1"  || die "Could not copy rasplex files"
}

pkg_postinst(){

	echo "Initializing rasplex..."
	bash -lc "/usr/bin/init-rasplex.sh"
}

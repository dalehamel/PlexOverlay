# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/libcec/libcec-2.0.5.ebuild,v 1.1 2012/12/07 21:33:22 thev00d00 Exp $

EAPI=4

inherit eutils flag-o-matic git-2 toolchain-funcs


DESCRIPTION="Library for communicating with the Pulse-Eight USB HDMI-CEC Adaptor"
HOMEPAGE="http://libcec.pulse-eight.com"
#SRC_URI="http://github.com/Pulse-Eight/${PN}/tarball/${P} -> ${P}.tar.gz"

EGIT_REPO_URI="https://github.com/Pulse-Eight/libcec.git"
EGIT_BRANCH="master"



LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="debug static-libs"

RDEPEND="virtual/udev"
DEPEND="${RDEPEND}
	dev-libs/lockdev
	virtual/pkgconfig"



src_configure() {

	env -i bash -lc "./bootstrap || exit 1" || die " Could not bootstrap"
	env -i bash -lc "./configure \
	--enable-optimisation \
	--enable-rpi \
	--with-rpi-include-path=/opt/vc/include \
	--with-rpi-lib-path=/opt/vc/lib || exit 1" || die "Could not configure"
}


src_install() {
	default
#	use static-libs || find "${ED}" -name '*.la' -delete
}

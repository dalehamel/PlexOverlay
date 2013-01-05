# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Raspberry PI precompiled userspace VideoCoreIV"
HOMEPAGE="https://github.com/raspberrypi/firmware"
SRC_URI="hardfp? ( http://xmw.de/mirror/raspberrypi-firmware/${PN/-bin/}-hardfp-${PV}.tar.xz )
	!hardfp? ( http://xmw.de/mirror/raspberrypi-firmware/${P/-bin/}.tar.xz )"

LICENSE="${PN}"
SLOT="0"
KEYWORDS="~arm -*"
IUSE="+hardfp"

S=${WORKDIR}

src_prepare() {
	rm opt/vc/LICENCE || die
}

src_install() {
	mv opt ${D} || die
	doenvd "${FILESDIR}"/04${PN}
}

# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils flag-o-matic git-2 toolchain-funcs

DESCRIPTION="command line media player for the Raspberry Pi"
HOMEPAGE="https://github.com/huceke/omxplayer"
EGIT_REPO_URI="https://github.com/huceke/omxplayer.git"
EGIT_COMMIT="ec7ac68fa65eabcb491684d371899673cae93fbf" #verified to work, may work on newer

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""
DEPEND="
		>=sys-devel/gcc-4.6.0
		media-video/omxplayer-ffmpeg
        dev-libs/libpcre
        media-libs/raspberrypi-videocore-bin
        dev-libs/boost
        media-libs/freetype"
RDEPEND="${RDEPEND}
        sys-apps/fbset"

src_prepare() {
        einfo "If your emerge fails with an error complaining that"
        einfo "'OMX_CONFIG_BRCMAUDIODOWNMIXCOEFFICIENTS' was not"
        einfo "declared in this scope, then you need to update"
        einfo "your firmware on the Raspberry Pi before continuing."
        einfo ""
        einfo "See https://github.com/Hexxeh/rpi-update/ for"
        einfo "more information."
        einfo ""
        epatch "${FILESDIR}"/${P}-Makefile.patch
        tc-export CXX
        filter-ldflags -Wl,--as-needed
}

src_compile()
{
	make || die "Could not compile omx player"
	make dist || die "Could not create dist"
}

src_install() {
	cp -r omxplayer-dist/* ${D}
}

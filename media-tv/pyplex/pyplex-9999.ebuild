# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_COMPAT=( python{2_6,2_7} )
inherit eutils flag-o-matic git-2 toolchain-funcs distutils

DESCRIPTION="Interfaceless Plex client for Raspberry Pi"
HOMEPAGE="https://github.com/dalehamel/pyplex"
EGIT_REPO_URI="https://github.com/dalehamel/pyplex.git"
#EGIT_COMMIT="ec7ac68fa65eabcb491684d371899673cae93fbf" #verified to work, may work on newer


LICENSE="MIT"
SLOT="0"
KEYWORDS="~arm"
IUSE=""

DEPEND="
	dev-python/setuptools
	dev-python/pexpect
	dev-python/pip
	dev-python/requests
	www-servers/tornado
	media-video/omxplayer
	>=net-dns/avahi-0.6.30-r3[dbus,gtk,python]
	>=dev-libs/DirectFB-1.4.9-r1[X,fbcon]
	>=media-libs/libsdl-1.2.15-r2[X,alsa,audio,dga,directfb,fbcon,opengl,video]
	>=dev-python/pygame-1.9.2_pre20120101-r1[X]
	"

RDEPEND="
${DEPEND}
	"


python_prepare_all() {
	distutils_python_prepare_all
}

pkg_postinst()
{
	rc-update add avahi-daemon
	rc-config start avahi-daemon
}

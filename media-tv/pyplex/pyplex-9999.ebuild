# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )
inherit eutils flag-o-matic git-2 toolchain-funcs distutils-r1

DESCRIPTION="Interfaceless Plex client for Raspberry Pi"
HOMEPAGE="https://github.com/dalehamel/pyplex"
EGIT_REPO_URI="https://github.com/dalehamel/pyplex.git"
#EGIT_COMMIT="ec7ac68fa65eabcb491684d371899673cae93fbf" #verified to work, may work on newer





LICENSE="MIT"
SLOT="0"
KEYWORDS="~arm"
IUSE=""

RDEPEND="
	"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	media-video/omxplayer
	www-servers/tornado
	dev-python/requests
	>=dev-libs/DirectFB-1.4.9-r1[X,fbcon]
	>=media-libs/libsdl-1.2.15-r2[X,alsa,audio,dga,directfb,fbcon,opengl,video]
	>=dev-python/pygame-1.9.2_pre20120101-r1[X]
	"


python_prepare_all() {
	distutils-r1_python_prepare_all
}


# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit autotools

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="git://github.com/amejia1/libshairport.git"
	inherit git-2
else
	SRC_URI="http://mirrors.xbmc.org/build-deps/darwin-libs/${P}_lib.tar.gz"
	KEYWORDS="~amd64 ~x86"
	inherit eutils
fi

DESCRIPTION="Emulates an AirPort Express for the purpose of streaming music from iTunes and compatible iPods"
HOMEPAGE="https://github.com/amejia1/libshairport"

LICENSE="GPL-2"
SLOT="0"
IUSE="static-libs"

S="${WORKDIR}/${P}_lib"

COMMON_DEPEND=">=dev-libs/openssl-1.0.0
media-libs/libao"
RDEPEND="${COMMON_DEPEND}"
DEPEND="${COMMON_DEPEND}"

src_unpack() {
	default

	if [[ ${PV} == "9999" ]] ; then
		git-2_src_unpack
	fi
}

src_prepare() {
	if [[ ${PV} != "9999" ]] ; then
		epatch "${FILESDIR}"/01-${P}-add_ao.patch
		epatch "${FILESDIR}"/02-${P}-fix_install_header.patch
		epatch "${FILESDIR}"/03-${P}-fix_deadlock.patch
		epatch "${FILESDIR}"/04-${P}-fix_bad_access.patch
		epatch "${FILESDIR}"/05-${P}-fix_shutdown.patch
		epatch "${FILESDIR}"/06-${P}-no_printf.patch
		epatch "${FILESDIR}"/07-${P}-fix_syslog_defines.patch
		epatch "${FILESDIR}"/08-${P}-add_missing_libs.patch
		epatch "${FILESDIR}"/09-${P}-fix_ipv6.patch
		epatch "${FILESDIR}"/10-${P}-handle_metadata.patch
	fi

	eautoreconf
}

src_configure() {
	econf \
		$(use_enable static-libs static)
}

src_install() {
	default
	use static-libs || find "${ED}" -name '*.la' -delete
}

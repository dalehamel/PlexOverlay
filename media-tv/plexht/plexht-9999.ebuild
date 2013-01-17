# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils flag-o-matic git-2 toolchain-funcs

DESCRIPTION="Plex home theatre"
HOMEPAGE="https://github.com/plexinc/plex-home-theater-public.git"
EGIT_REPO_URI="https://github.com/plexinc/plex-home-theater-public.git"
#EGIT_COMMIT="52373003d750a8d979e5d2c716b8abb05aaa1a23" #verified to work, may work on newer

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""
RDEPEND="
app-i18n/enca
app-doc/doxygen
dev-db/mysql
dev-db/sqlite
dev-lang/python:2.7
dev-util/cmake
dev-libs/yajl
dev-libs/lzo 
dev-libs/libcdio
dev-libs/fribidi
dev-libs/boost
dev-libs/tinyxml
dev-python/pysqlite
dev-util/gperf
dev-vcs/cvs
dev-lang/swig
net-fs/samba
<=net-libs/libmicrohttpd-0.9.21
net-libs/libssh
net-misc/curl
media-libs/gd
media-libs/glew
media-sound/qmmp
media-video/vlc
media-video/rtmpdump
media-sound/moc
media-sound/wavpack
media-libs/alsa-lib
media-libs/flac
media-libs/fontconfig
media-libs/freetype
media-libs/faac
media-libs/faad2
media-libs/jbigkit
media-libs/jasper
media-libs/libmms
media-libs/libmodplug
media-libs/libmpeg2
media-libs/libogg
media-libs/libpng
media-libs/libass
media-libs/libbluray
media-libs/libjpeg-turbo
media-libs/libmad
media-libs/libmms
media-libs/libsamplerate
media-libs/libsdl[audio,opengl,video,X]
media-libs/sdl-gfx
media-libs/sdl-mixer
media-libs/sdl-sound
media-libs/tiff
>=media-libs/taglib-1.8-r1
>=media-libs/sdl-image-1.2.10[gif,jpeg,png]
sys-apps/lsb-release
sys-apps/pmount
sys-apps/dbus
virtual/jdk
x11-proto/xineramaproto
x11-apps/xdpyinfo

"

DEPEND="${RDEPEND}
"

src_configure() {
	./bootstrap
	./configure
}

#src_compile()
#{
#}
#
#src_install() {
#}

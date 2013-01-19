# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils flag-o-matic git-2 toolchain-funcs

DESCRIPTION="Plex home theatre"
HOMEPAGE="https://github.com/plexinc/plex-home-theater-public.git"
EGIT_REPO_URI="https://github.com/plexinc/plex-home-theater-public.git"
#EGIT_COMMIT="2d9bddd5a1f910e3f8fc20109ad0450f4aa5701a" #verified to work, may work on newer
EGIT_BRANCH="pht-frodo"

#http://forums.plexapp.com/index.php/topic/56099-experimental-ubuntu-package-for-plexht/

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

#Note: you must set XBMC_HOME with
#export XBMC_HOME=/usr/local/share/XBMC
#in order to run.
#To do: make a wrapper


#note: it is quite likely that not all of these are required
# This dependency list is taken from xbmc ebuild, and dependencies for
# 
RDEPEND="
app-pda/libplist
app-i18n/enca
app-doc/doxygen
dev-db/mysql
dev-db/sqlite
dev-lang/python:2.7
dev-util/cmake
>=dev-libs/libcec-2.0.5
dev-libs/yajl
dev-libs/lzo 
dev-libs/libcdio
=dev-libs/fribidi-0.19.2
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
>=media-video/ffmpeg-0.10.3
media-sound/moc
media-sound/wavpack
media-sound/lame
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
=media-libs/libshairport-9999
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
x11-libs/qt-core[qt3support]
x11-libs/libvdpau
"

DEPEND="${RDEPEND}
"

src_configure() {
#	./bootstrap || die "Could not bootstrap"
#	./configure || die "Could not configure"
	cmake . || die "Could not run cmake"
}

#src_compile()
#{
#}
##
#src_install() {
#}

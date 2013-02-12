# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils flag-o-matic git-2 toolchain-funcs

DESCRIPTION="Plex home theatre"
HOMEPAGE="https://github.com/plexinc/plex-home-theater-public.git"
EGIT_REPO_URI="https://github.com/dalehamel/plex-home-theatre.git"
#EGIT_COMMIT="2d9bddd5a1f910e3f8fc20109ad0450f4aa5701a" #verified to work, may work on newer
#EGIT_BRANCH="pht-frodo"
EGIT_BRANCH="unstable"

#http://forums.plexapp.com/index.php/topic/56099-experimental-ubuntu-package-for-plexht/

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm"
IUSE=""

#Note: you must set XBMC_HOME with
#export XBMC_HOME=/usr/local/share/XBMC
#in order to run.
#To do: make a wrapper


#note: it is quite likely that not all of these are required
# This dependency list is taken from xbmc ebuild, and dependencies for
# 
# Note to self, java is actually required for build. Re-add it asap
#app-misc/lirc
RDEPEND="
app-arch/zip
app-pda/libplist
app-i18n/enca
dev-db/sqlite
dev-lang/python:2.7
dev-util/cmake
=dev-libs/libcec-9999
dev-libs/yajl
dev-libs/lzo 
dev-libs/libcdio
=dev-libs/fribidi-0.19.2
=dev-libs/boost-1.49.0-r2
dev-libs/tinyxml
dev-python/pysqlite
dev-util/gperf
media-libs/gd
media-video/rtmpdump
media-sound/moc
media-sound/wavpack
media-sound/lame
=media-libs/elbo-ffmpeg-9999
media-libs/flac
media-libs/fontconfig
media-libs/freetype
media-libs/faac
media-libs/faad2
media-libs/libmodplug
media-libs/libmpeg2
=media-libs/libshairport-9999
media-libs/libogg
media-libs/libpng
media-libs/libass
media-libs/libjpeg-turbo
media-libs/libmad
media-libs/libmms
media-libs/tiff
media-libs/libsamplerate
=media-libs/raspberrypi-userland-9999
>=media-libs/taglib-1.8-r1
>=net-dns/avahi-0.6.30-r3[dbus,python]
<=net-libs/libmicrohttpd-0.9.21
net-libs/libssh
net-misc/curl
net-wireless/bluez
"
#net-fs/samba
#dev-util/ninja
#=net-fs/afpfs-ng-9999
#media-libs/libsdl[audio,opengl,video]
#media-libs/sdl-gfx
#>=media-libs/sdl-image-1.2.10[gif,jpeg,png]

#x11-libs/libva[opengl]
#=x11-libs/libva-1.1.0
#x11-libs/libvdpau
#x11-proto/xineramaproto
#media-sound/pulseaudio
#media-libs/alsa-lib

#virtual/jdk have to make my own for rbp based on java 8
#http://jdk8.java.net/fxarmpreview/


DEPEND="${RDEPEND}
"

#-GNinja should be faster
src_configure() {
	cmake -DCMAKE_BUILD_TYPE=Debug . || die "Could not run cmake"
}

#src_compile()
#{
#}
##
#src_install() {
#}

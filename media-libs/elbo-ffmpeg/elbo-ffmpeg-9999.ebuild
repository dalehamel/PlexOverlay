# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils flag-o-matic git-2 toolchain-funcs

DESCRIPTION="ffmpeg for command line media player for the Raspberry Pi"
HOMEPAGE="https://github.com/huceke/omxplayer"
EGIT_REPO_URI="https://github.com/dalehamel/plex-home-theatre.git"
EGIT_BRANCH="unstable"


LICENSE="GPL-2"
SLOT="0"
KEYWORDS="arm"
IUSE=""
DEPEND="
>=sys-devel/make-3.81
"
RDEPEND="${RDEPEND}"
WORK_DIR="${S}/lib/ffmpeg"
INST_DIR="${D}usr/local"

src_configure()
{
	echo "Installing to $INST_DIR"
	bash -lc "mkdir -p $INST_DIR || exit 1" || die "Could not create install dir"
	cd $WORK_DIR	

	CFLAGS="-D__STDC_CONSTANT_MACROS -D__STDC_LIMIT_MACROS -DTARGET_POSIX -D_LINUX -fPIC -DPIC -D_REENTRANT -D_HAVE_SBRK -D_LARGEFILE64_SOURCE -DHAVE_CMAKE_CONFIG -DHAVE_VMCS_CONFIG -D_REENTRANT -DUSE_VCHIQ_ARM -DVCHI_BULK_ALIGN=1 -DVCHI_BULK_GRANULARITY=1 -DEGL_SERVER_DISPMANX -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D__VIDEOCORE4__ -DGRAPHICS_X_VG=1 -U_FORTIFY_SOURCE -Wall -DHAVE_OMXLIB -DUSE_EXTERNAL_FFMPEG  -DHAVE_LIBAVCODEC_AVCODEC_H -DHAVE_LIBAVUTIL_MEM_H -DHAVE_LIBAVUTIL_AVUTIL_H -DHAVE_LIBAVFORMAT_AVFORMAT_H -DHAVE_LIBAVFILTER_AVFILTER_H -DOMX -DOMX_SKIP64BIT"

	myconf="--extra-cflags=\"-mfpu=vfp -mfloat-abi=hard -mno-apcs-stack-check -mstructure-size-boundary=32 -mno-sched-prolog\" --enable-shared --disable-static --arch=arm --cpu=arm1176jzf-s --target-os=linux --disable-muxers --enable-muxer=spdif --enable-muxer=adt --disable-encoders --enable-encoder=ac3 --enable-encoder=aac --disable-decoder=mpeg_xvmc --disable-devices --disable-ffprobe --disable-ffplay --disable-ffserver --disable-ffmpeg --enable-shared --disable-doc --enable-postproc --enable-gpl --enable-protocol=http --enable-pthreads --disable-runtime-cpudetect --enable-pic --disable-armv5te --disable-neon --enable-armv6t2 --enable-armv6 --enable-armvfp --enable-hardcoded-tables --disable-runtime-cpudetect --disable-debug"

	confcommand="CLFLAGS=\"$CFLAGS\" LDFLAGS=\"\" ./configure $myconf --prefix=$INST_DIR"
	echo "$confcommand"
	
	bash -c "$confcommand" || die "Could not complete configure"

}

src_compile()
{
	cd $WORK_DIR
	echo "$WORK_DIR"
	make || die "Failed to make"
}

src_install()
{
	cd $WORK_DIR
	echo "$WORK_DIR"
	make install || die "Failed to install"
}

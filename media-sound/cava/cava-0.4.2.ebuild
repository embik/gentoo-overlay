# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit linux-info

DESCRIPTION="Console-based Audio Visualizer for ALSA (=CAVA)"
HOMEPAGE="https://github.com/karlstav/cava"
SRC_URI="https://github.com/karlstav/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	sys-libs/ncurses
	dev-libs/iniparser"
DEPEND="${RDEPEND}
	sci-libs/fftw"

pkg_setup() {
	if linux_config_exists ; then
		einfo "Checking kernel configuration at $(linux_config_path)..."
		if ! linux_chkconfig_present SND_ALOOP ; then
			ewarn 'Kernel option CONFIG_SND_ALOOP=[ym] needed but missing'
		fi
	fi
}

src_configure() {
	./autogen.sh
	# Build with support for 'legacy' dev-libs/iniparser (< 4.0)
	./configure --enable-legacy_iniparser
}

src_compile() {
	emake SYSTEM_INIPARSER=1 VERSION=${PV}
}

src_install() {
	dodoc README.md
	emake DESTDIR="${D}" PREFIX=/usr SYSTEM_INIPARSER=1 install || die
}

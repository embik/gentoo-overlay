# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eutils toolchain-funcs

DESCRIPTION="A keyboard-centric VTE-based terminal"
HOMEPAGE="https://github.com/thestinger/termite"
SRC_URI="https://github.com/thestinger/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz \
	https://github.com/thestinger/util/archive/master.tar.gz -> util.tar.gz"
KEYWORDS="~amd64 ~x86"

LICENSE="LGPL-2+ MIT"
SLOT="0"
IUSE=""

DEPEND="
	>=x11-libs/gtk+-3.0
	=x11-libs/vte-0.46.1"
RDEPEND="${DEPEND}"

pkg_setup() {
	CXXFLAGS="-O0 ${CXXFLAGS}"
}

src_unpack() {
	unpack ${A}
	cd "${WORKDIR}"
	mv util-master/* termite-${PV}/util/
}

src_prepare() {
	epatch "${FILESDIR}/add-decorated-config-option-to-disable-csd.patch"
	sed -i -e 's/VERSION = .*/VERSION = ${PV}/' Makefile || die "sed failed!"
	eapply_user
}

src_compile() {
	emake LDFLAGS="${LDFLAGS}"
}

src_install() {
	emake DESTDIR="${D}" PREFIX=/usr install
}

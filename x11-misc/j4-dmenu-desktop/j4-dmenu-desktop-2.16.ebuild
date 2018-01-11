# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="A rewrite of i3-dmenu-desktop, which is much faster"
HOMEPAGE="https://github.com/enkore/j4-dmenu-desktop"
SRC_URI="https://github.com/enkore/${PN}/archive/r${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

S="${WORKDIR}/${PN}-r${PV}"

DEPEND=""
RDEPEND="${DEPEND}
	x11-misc/dmenu"

src_configure() {
	local mycmakeargs=(
		-DNO_TESTS=1
	)
	cmake-utils_src_configure
}

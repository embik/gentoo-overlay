# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="TSM is a state machine for DEC VT100-VT520 compatible terminal emulators. "
HOMEPAGE="http://www.freedesktop.org/wiki/Software/libtsm/"
SRC_URI="http://freedesktop.org/software/kmscon/releases/${P}.tar.xz"

LICENSE=""
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="static-libs"

DEPEND="x11-libs/libxkbcommon"
RDEPEND="${DEPEND}"

src_configure(){

	econf $(use_enable static-libs static)
}

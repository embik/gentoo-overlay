# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="highly flexible status line for the i3 window manager"
HOMEPAGE="https://github.com/vivien/i3blocks"
SRC_URI="https://github.com/vivien/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64 ~x86"

SLOT="0"
LICENSE="GPL-3"
RDEPEND="app-admin/sysstat
	|| ( x11-wm/i3 dev-libs/sway )"
DEPEND="${RDEPEND}
	app-text/ronn
	"

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install
}

# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit eutils qmake-utils

DESCRIPTION="Application to sync files and documents from L2P (RWTH Aachen University)"
HOMEPAGE="https://github.com/Sync-my-L2P/Sync-my-L2P"
SRC_URI="https://github.com/Sync-my-L2P/Sync-my-L2P/archive/v${PV}.tar.gz -> ${P}.tar.gz \
	https://github.com/justin-time/Sync-my-L2P-Linux/archive/master.tar.gz -> Sync-my-L2P-Linux.tar.gz"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-qt/qtwidgets-5.4.0
		>=dev-qt/qtgui-5.4.0
		>=dev-qt/qtnetwork-5.4.0
		>=dev-qt/qtxml-5.4.0
		>=dev-qt/qtcore-5.4.0
		dev-libs/openssl"

DEPEND="${RDEPEND}"

src_unpack() {
	unpack ${A}
	cd "${WORKDIR}"
	mv "Sync-my-L2P-Linux-master/RPM support/Makefile" "${P}/Makefile.linux"
}

src_prepare() {
	epatch "${FILESDIR}/0001-Add-install-target.patch"

	[[ ! -z "$L2P_API_KEY" ]] || die "\$L2P_API_KEY does not exist in ebuild environment"
	sed -i -e "s/INSERT YOUR CLIENT ID HERE/$L2P_API_KEY/" ./clientId.h || die "Adding L2P API key failed!"
	sed -i -e "/#error ERROR: NO CLIENTID IN CLIENTID.H DEFINED/g" ./clientId.h

	eapply_user
}

src_compile() {
	QT_SELECT=qt5 qmake
	emake
}

src_install() {
	emake DESTDIR="${D}usr" install -f Makefile.linux
}

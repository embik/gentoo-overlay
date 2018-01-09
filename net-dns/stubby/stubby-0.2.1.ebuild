# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit user autotools systemd

DESCRIPTION="local DNS Privacy stub resolver using DNS-over-TLS"
HOMEPAGE="https://dnsprivacy.org/wiki/display/DP/DNS+Privacy+Daemon+-+Stubby"
SRC_URI="https://github.com/getdnsapi/stubby/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="systemd"

DEPEND=">=net-dns/getdns-1.2.0
	dev-libs/libyaml"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}

src_configure() {
	econf
}

src_compile() {
	emake
}

pkg_postinst() {
	use systemd && \
		enewgroup stubby && \
		enewuser stubby -1 -1 -1 "stubby" && \
		systemd_tmpfiles_create stubby.conf
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc README.md ChangeLog

	use systemd && \
		systemd_dotmpfilesd systemd/stubby.conf && \
		systemd_dounit systemd/stubby.service
}

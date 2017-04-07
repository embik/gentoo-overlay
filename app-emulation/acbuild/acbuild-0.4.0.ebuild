# Copyright 2017 Marvin Beckers
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Another build tool for container images"
HOMEPAGE="https://github.com/containers/build"
SRC_URI="https://github.com/containers/build/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

S="${WORKDIR}/build-${PV}"

DEPEND=">=dev-lang/go-1.5.0"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e "s/^VERSION=.*$/VERSION=${PV}/" build
	eapply_user
}

src_compile() {
	./build
}

src_install() {
	dobin bin/acbuild
	dodoc CHANGELOG.md README.md
	use examples && dodoc -r examples
}

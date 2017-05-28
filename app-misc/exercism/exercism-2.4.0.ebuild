# Copyright 2017 Marvin Beckers
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="A command line tool for exercism.io"
HOMEPAGE="http://exercism.io"
SRC_URI="https://github.com/exercism/cli/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/cli-${PV}"
_DEST="${WORKDIR}/src/github.com/exercism"

DEPEND=">=dev-lang/go-1.6.0"
RDEPEND=""

src_compile() {
	mkdir -p ${_DEST}

	ln -s ${WORKDIR}/cli-${PV} ${_DEST}/cli
	GOPATH=${WORKDIR} go install github.com/exercism/cli/exercism
}

src_install() {
	dobin ${WORKDIR}/bin/exercism
	dodoc ${WORKDIR}/cli-${PV}/LICENSE
	dodoc ${WORKDIR}/cli-${PV}/README.md
}

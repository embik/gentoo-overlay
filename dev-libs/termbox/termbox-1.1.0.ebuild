# Copyright 2017 Marvin Beckers
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_{4,5,6}} )
PYTHON_REQ_USE="threads"

inherit distutils-r1 waf-utils

DESCRIPTION="Library for writing text-based user interfaces"
HOMEPAGE="https://github.com/nsf/termbox"
SRC_URI="https://github.com/nsf/termbox/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples +python"

DEPEND=""
RDEPEND="${DEPEND}"

pkg_setup() {
	python_setup
}

src_configure() {
	waf-utils_src_configure
}

src_compile() {
	waf-utils_src_compile
}

src_install() {
	waf-utils_src_install

	use python && \
		distutils-r1_src_install

	if use examples ; then
		docinto demo
		dodoc src/demo/*.c
	fi
}

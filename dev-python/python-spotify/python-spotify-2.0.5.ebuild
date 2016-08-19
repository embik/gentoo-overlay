# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=(python2_7)

inherit eutils distutils-r1

DESCRIPTION="Python bindings for libspotify"
HOMEPAGE="https://github.com/mopidy/pyspotify"
SRC_URI="https://github.com/mopidy/pyspotify/archive/v${PV}.tar.gz -> pyspotify-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="dev-python/cffi[${PYTHON_USEDEP}]"
DEPEND="test? ( ${RDEPEND}
	dev-python/mock[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]"

S=${WORKDIR}/pyspotify-${PV}

pkg_setup() {
	distutils-r1_pkg_setup
}

src_install() {
	distutils-r1_src_install
}

python_test() {
	py.test || die
}

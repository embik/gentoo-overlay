# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=(python2_7)

inherit eutils distutils-r1

DESCRIPTION="Mopidy extension for playing music from Spotify"
HOMEPAGE="http://www.mopidy.com"
SRC_URI="https://github.com/mopidy/mopidy-spotify/archive/v${PV}.tar.gz -> mopidy-spotify-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="media-sound/mopidy[${PYTHON_USEDEP}]
	dev-python/python-spotify[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/pykka[${PYTHON_USEDEP}]"
DEPEND="test? ( ${RDEPEND}
	dev-python/mock[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]"

pkg_setup() {
	distutils-r1_pkg_setup
}

src_install() {
	distutils-r1_src_install
}

python_test() {
	py.test || die
}

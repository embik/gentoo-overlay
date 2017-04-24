# Copyright 2017 Marvin Beckers
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=(python2_7)

inherit eutils distutils-r1

DESCRIPTION="Mopidy local library proxy extension for handling embedded album art"
HOMEPAGE="https://github.com/mopidy/mopidy-local-images"
SRC_URI="https://github.com/mopidy/mopidy-local-images/archive/v${PV}.tar.gz -> mopidy-local-images-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="media-sound/mopidy[${PYTHON_USEDEP}]
	dev-python/pykka[${PYTHON_USEDEP}]
	dev-python/uritools[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	test? ( dev-python/mock[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]"

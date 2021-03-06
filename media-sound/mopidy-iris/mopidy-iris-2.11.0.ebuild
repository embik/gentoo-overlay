# Copyright 2017 Marvin Beckers
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=(python2_7)

inherit eutils distutils-r1

DESCRIPTION="Spotify-like frontend extension for Mopidy"
HOMEPAGE="https://github.com/jaedb/Iris"
#SRC_URI="https://github.com/jaedb/Iris/archive/${PV}.tar.gz -> mopidy-iris-${PV}.tar.gz"
SRC_URI="mirror://pypi/M/Mopidy-Iris/Mopidy-Iris-${PV}.tar.gz"

S="${WORKDIR}/Mopidy-Iris-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="media-sound/mopidy[${PYTHON_USEDEP}]
	media-sound/mopidy-local-images[${PYTHON_USEDEP}]
	dev-python/spotipy[${PYTHON_USEDEP}]
	dev-python/python-spotify[${PYTHON_USEDEP}]
	dev-python/pylast[${PYTHON_USEDEP}]
	dev-python/configobj[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	test? ( dev-python/mock[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]"

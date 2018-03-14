# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="Python framework for handling large composed or structured matrices."
HOMEPAGE="https://github.com/EMS-TU-Ilmenau/${PN}"
SRC_URI="https://github.com/EMS-TU-Ilmenau/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
#IUSE="doc lapack test"
IUSE="matplotlib"

RDEPEND="
	>=dev-python/numpy-1.7[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	sci-libs/scipy[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	matplotlib? ( dev-python/matplotlib[${PYTHON_USEDEP}] )"
DEPEND="${RDEPEND}
	>=dev-python/cython-0.18[${PYTHON_USEDEP}]"

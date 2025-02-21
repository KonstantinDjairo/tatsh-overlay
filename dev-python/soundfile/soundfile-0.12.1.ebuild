# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10,11} )
inherit distutils-r1

DESCRIPTION="An audio library based on libsndfile, CFFI and NumPy"
HOMEPAGE="https://pypi.org/project/soundfile/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${PN}-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="media-libs/libsndfile
	virtual/python-cffi[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

S="${WORKDIR}/${PN}-${PV}"

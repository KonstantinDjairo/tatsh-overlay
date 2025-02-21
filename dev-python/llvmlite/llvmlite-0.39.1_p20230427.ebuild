# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10,11} )
inherit distutils-r1

DESCRIPTION="A lightweight LLVM python binding for writing JIT compilers"
HOMEPAGE="https://pypi.org/project/llvmlite/"
SHA="24be5e873577f0791259e5738d5b8140e8eda5e1"
SRC_URI="https://github.com/numba/llvmlite/archive/${SHA}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="sys-devel/llvm:14"

S="${WORKDIR}/${PN}-${SHA}"

python_compile() {
	export "LLVM_CONFIG=${EPREFIX}/usr/lib/llvm/14/bin/llvm-config"
	distutils-r1_python_compile
}

distutils_enable_tests pytest

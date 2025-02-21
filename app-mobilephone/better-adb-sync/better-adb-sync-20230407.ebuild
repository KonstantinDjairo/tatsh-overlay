# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10,11} )
inherit python-single-r1

DESCRIPTION="Completely rewritten adbsync with proper --exclude."
HOMEPAGE="https://github.com/jb2170/better-adb-sync"
SHA="30dcd280c6f006899fdfac01624fcb684ea41061"
SRC_URI="https://github.com/jb2170/better-adb-sync/archive/${SHA}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"
BDEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}-${SHA}"

src_install() {
	einstalldocs
	cd src || die
	python_domodule ADBSync
	python_doscript adbsync.py
	dosym -r /usr/bin/adbsync.py /usr/bin/adb-sync
}

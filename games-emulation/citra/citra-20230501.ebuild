# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake xdg

DESCRIPTION="A Nintendo 3DS emulator."
HOMEPAGE="https://citra-emu.org/ https://github.com/citra-emu/citra"
SHA="41f13456c0a2b341229e61a31f3bf3144404cfa4"
DDS_KTX_SHA="42dd8aa6ded90b1ec06091522774feff51e83fc5"
LODEPNG_SHA="18964554bc769255401942e0e6dfd09f2fab2093"
SOUNDTOUCH_SHA="dd2252e9af3f2d6b749378173a4ae89551e06faf"
SUB_DYNARMIC_SHA="c08c5a9362bb224dc343c2f616c24df027dfdf13"
XBYAK_SHA="a1ac3750f9a639b5a6c6d6c7da4259b8d6790989"
SRC_URI="https://github.com/citra-emu/citra/archive/${SHA}.tar.gz -> ${P}.tar.gz
	https://github.com/lvandeve/lodepng/archive/${LODEPNG_SHA}.tar.gz -> ${PN}-lodepng-${LODEPNG_SHA:0:7}.tar.gz
	https://github.com/citra-emu/dynarmic/archive/${SUB_DYNARMIC_SHA}.tar.gz -> ${PN}-dynarmic-${SUB_DYNARMIC_SHA:0:7}.tar.gz
	https://github.com/herumi/xbyak/archive/${XBYAK_SHA}.tar.gz -> ${PN}-xbyak-${XBYAK_SHA:0:7}.tar.gz
	https://codeberg.org/soundtouch/soundtouch/archive/${SOUNDTOUCH_SHA}.tar.gz -> ${PN}-soundtouch-${SOUNDTOUCH_SHA:0:7}.tar.gz
	https://github.com/septag/dds-ktx/archive/${DDS_KTX_SHA}.tar.gz -> ${PN}-dds-ktx-${DDS_KTX_SHA:0:7}.tar.gz"

LICENSE="ZLIB BSD GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="openal web-service"

# System xbyak is still used by Dynarmic, but not Citra itself
DEPEND="app-arch/zstd
	dev-cpp/robin-map
	dev-libs/boost:0
	dev-libs/crypto++:=
	media-libs/cubeb
	dev-libs/inih
	dev-libs/libfmt
	dev-libs/mp
	dev-libs/teakra
	>=dev-libs/xbyak-5.941
	dev-qt/qtconcurrent:5
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtmultimedia:5
	dev-qt/qtwidgets:5
	dev-util/nihstro
	media-libs/libsdl2
	media-video/ffmpeg
	net-libs/enet:=
	virtual/libusb:1
	openal? ( media-libs/openal )"
RDEPEND="${DEPEND}"
BDEPEND="dev-cpp/catch:0"

PATCHES=(
	"${FILESDIR}/${PN}-0001-system-libraries.patch"
	"${FILESDIR}/${PN}-0002-inih-fix.patch"
	"${FILESDIR}/${PN}-0003-disable-tests.patch"
)

S="${WORKDIR}/${PN}-${SHA}"

pkg_setup() {
	wget -O "${T}/compatibility_list.json" https://api.citra-emu.org/gamedb/ || die
}

src_prepare() {
	rmdir "${S}/externals/lodepng/lodepng" \
		"${S}/externals/"{soundtouch,dynarmic,fmt,xbyak,dds-ktx} || die
	mv "${WORKDIR}/soundtouch" "${S}/externals/soundtouch" || die
	mv "${WORKDIR}/dds-ktx-${DDS_KTX_SHA}" "${S}/externals/dds-ktx" || die
	mv "${WORKDIR}/dynarmic-${SUB_DYNARMIC_SHA}" "${S}/externals/dynarmic" || die
	mv "${WORKDIR}/lodepng-${LODEPNG_SHA}" "${S}/externals/lodepng/lodepng" || die
	mv "${WORKDIR}/xbyak-${XBYAK_SHA}" "${S}/externals/xbyak" || die
	mkdir -p "${WORKDIR}/${P}_build/dist/compatibility_list" || die
	mv -f "${T}/compatibility_list.json" "${WORKDIR}/${P}_build/dist/compatibility_list/compatibility_list.json" || die
	sed -e 's|${CMAKE_CURRENT_SOURCE_DIR}/xbyak/xbyak|/usr/include/xbyak|' \
		-i externals/dynarmic/externals/CMakeLists.txt || die
	cmake_src_prepare
}

src_configure() {
	if use web-service; then
		die 'Building with USE=web-service is broken at the moment'
	fi
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=OFF
		-DDISABLE_SUBMODULE_CHECK=ON
		-DENABLE_FFMPEG_AUDIO_DECODER=ON
		-DENABLE_FFMPEG_VIDEO_DUMPER=ON
		-DENABLE_OPENAL=$(usex openal)
		-DENABLE_WEB_SERVICE=$(usex web-service)
		-DUSE_SYSTEM_BOOST=ON
		-DUSE_SYSTEM_CRYPTOPP=ON
		-DUSE_SYSTEM_CUBEB=ON
		-DUSE_SYSTEM_ENET=ON
		-DUSE_SYSTEM_FMT=ON
		-DUSE_SYSTEM_INIH=ON
		-DUSE_SYSTEM_OPENAL=ON
		-DUSE_SYSTEM_SDL2=ON
		-DUSE_SYSTEM_TEAKRA=ON
		-DUSE_SYSTEM_XBYAK=OFF
		-DUSE_SYSTEM_ZSTD=ON
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	rm -fR "${D}/usr/include" "${D}/usr/$(get_libdir)" || die
}

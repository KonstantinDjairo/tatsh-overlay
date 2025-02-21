# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DOTNET_SLOT="7.0"
inherit desktop dotnet-utils xdg

DESCRIPTION="Experimental Nintendo Switch emulator written in C#"
HOMEPAGE="https://ryujinx.org/ https://github.com/Ryujinx/Ryujinx"
SHA="dd574146fb5f05c1c0a469a4ad4a20c46bb37d74"
MY_PN="R${PN:1}"
NUGETS="avalonia-0.10.19
	avalonia.angle.windows.natives-2.1.0.2020091801
	avalonia.controls.datagrid-0.10.19
	avalonia.desktop-0.10.19
	avalonia.diagnostics-0.10.19
	avalonia.freedesktop-0.10.19
	avalonia.markup.xaml.loader-0.10.19
	avalonia.native-0.10.19
	avalonia.remote.protocol-0.10.19
	avalonia.skia-0.10.18
	avalonia.skia-0.10.19
	avalonia.svg-0.10.18
	avalonia.svg.skia-0.10.18
	avalonia.win32-0.10.19
	avalonia.x11-0.10.19
	commandlineparser-2.9.1
	concentus-1.1.7
	discordrichpresence-1.1.3.18
	dynamicdata-7.13.5
	excss-4.1.4
	fizzler-1.2.1
	fluentavaloniaui-1.4.5
	fsharp.core-7.0.200
	gtksharp.dependencies-1.1.1
	harfbuzzsharp-2.8.2.1-preview.108
	harfbuzzsharp.nativeassets.linux-2.8.2.1-preview.108
	harfbuzzsharp.nativeassets.macos-2.8.2.1-preview.108
	harfbuzzsharp.nativeassets.webassembly-2.8.2.1-preview.108
	harfbuzzsharp.nativeassets.win32-2.8.2.1-preview.108
	jetbrains.annotations-10.3.0
	jp2masa.avalonia.flexbox-0.2.0
	libhac-0.18.0
	microcom.codegenerator.msbuild-0.10.4
	microcom.runtime-0.10.4
	microsoft.aspnetcore.app.runtime.linux-x64-7.0.3
	microsoft.aspnetcore.app.runtime.osx-x64-7.0.3
	microsoft.aspnetcore.app.runtime.win-x64-7.0.3
	microsoft.codeanalysis.analyzers-2.9.6
	microsoft.codeanalysis.analyzers-3.3.4
	microsoft.codeanalysis.common-3.4.0
	microsoft.codeanalysis.common-4.5.0
	microsoft.codeanalysis.csharp-3.4.0
	microsoft.codeanalysis.csharp-4.5.0
	microsoft.codeanalysis.csharp.scripting-3.4.0
	microsoft.codeanalysis.scripting.common-3.4.0
	microsoft.codecoverage-17.5.0
	microsoft.csharp-4.3.0
	microsoft.csharp-4.5.0
	microsoft.csharp-4.7.0
	microsoft.dotnet.platformabstractions-3.1.6
	microsoft.extensions.dependencymodel-6.0.0
	microsoft.identitymodel.abstractions-6.30.0
	microsoft.identitymodel.jsonwebtokens-6.30.0
	microsoft.identitymodel.logging-6.30.0
	microsoft.identitymodel.tokens-6.30.0
	microsoft.io.recyclablememorystream-2.3.2
	microsoft.netcore.app.host.osx-x64-7.0.3
	microsoft.netcore.app.host.win-x64-7.0.3
	microsoft.netcore.app.runtime.linux-x64-7.0.3
	microsoft.netcore.app.runtime.osx-x64-7.0.3
	microsoft.netcore.app.runtime.win-x64-7.0.3
	microsoft.netcore.platforms-1.0.1
	microsoft.netcore.platforms-1.1.0
	microsoft.netcore.platforms-2.0.0
	microsoft.netcore.platforms-2.1.2
	microsoft.netcore.targets-1.0.1
	microsoft.netcore.targets-1.1.0
	microsoft.net.test.sdk-17.5.0
	microsoft.testplatform.objectmodel-17.5.0
	microsoft.testplatform.testhost-17.5.0
	microsoft.win32.primitives-4.0.1
	microsoft.win32.registry-4.5.0
	microsoft.win32.systemevents-7.0.0
	msgpack.cli-1.0.1
	netstandard.library-1.6.0
	netstandard.library-2.0.0
	netstandard.library-2.0.3
	newtonsoft.json-13.0.1
	nuget.frameworks-5.11.0
	nunit-3.13.3
	nunit3testadapter-4.1.0
	opentk.core-4.7.7
	opentk.graphics-4.7.7
	opentk.mathematics-4.7.7
	opentk.openal-4.7.7
	opentk.redist.glfw-3.3.8.30
	opentk.windowing.graphicslibraryframework-4.7.7
	runtime.any.system.collections-4.3.0
	runtime.any.system.diagnostics.tools-4.3.0
	runtime.any.system.diagnostics.tracing-4.3.0
	runtime.any.system.globalization-4.3.0
	runtime.any.system.globalization.calendars-4.3.0
	runtime.any.system.io-4.3.0
	runtime.any.system.reflection-4.3.0
	runtime.any.system.reflection.extensions-4.3.0
	runtime.any.system.reflection.primitives-4.3.0
	runtime.any.system.resources.resourcemanager-4.3.0
	runtime.any.system.runtime-4.3.0
	runtime.any.system.runtime.handles-4.3.0
	runtime.any.system.runtime.interopservices-4.3.0
	runtime.any.system.text.encoding-4.3.0
	runtime.any.system.text.encoding.extensions-4.3.0
	runtime.any.system.threading.tasks-4.3.0
	runtime.any.system.threading.timer-4.3.0
	runtime.debian.8-x64.runtime.native.system.security.cryptography.openssl-4.3.0
	runtime.fedora.23-x64.runtime.native.system.security.cryptography.openssl-4.3.0
	runtime.fedora.24-x64.runtime.native.system.security.cryptography.openssl-4.3.0
	runtime.native.system-4.0.0
	runtime.native.system-4.3.0
	runtime.native.system.io.compression-4.1.0
	runtime.native.system.net.http-4.0.1
	runtime.native.system.security.cryptography-4.0.0
	runtime.native.system.security.cryptography.openssl-4.3.0
	runtime.opensuse.13.2-x64.runtime.native.system.security.cryptography.openssl-4.3.0
	runtime.opensuse.42.1-x64.runtime.native.system.security.cryptography.openssl-4.3.0
	runtime.osx.10.10-x64.runtime.native.system.security.cryptography.openssl-4.3.0
	runtime.rhel.7-x64.runtime.native.system.security.cryptography.openssl-4.3.0
	runtime.ubuntu.14.04-x64.runtime.native.system.security.cryptography.openssl-4.3.0
	runtime.ubuntu.16.04-x64.runtime.native.system.security.cryptography.openssl-4.3.0
	runtime.ubuntu.16.10-x64.runtime.native.system.security.cryptography.openssl-4.3.0
	runtime.unix.microsoft.win32.primitives-4.3.0
	runtime.unix.system.console-4.3.0
	runtime.unix.system.diagnostics.debug-4.3.0
	runtime.unix.system.io.filesystem-4.3.0
	runtime.unix.system.net.primitives-4.3.0
	runtime.unix.system.net.sockets-4.3.0
	runtime.unix.system.private.uri-4.3.0
	runtime.unix.system.runtime.extensions-4.3.0
	runtime.win7.system.private.uri-4.3.0
	runtime.win7-x64.runtime.native.system.io.compression-4.3.0
	runtime.win.microsoft.win32.primitives-4.3.0
	runtime.win.system.console-4.3.0
	runtime.win.system.diagnostics.debug-4.3.0
	runtime.win.system.io.filesystem-4.3.0
	runtime.win.system.net.primitives-4.3.0
	runtime.win.system.net.sockets-4.3.0
	runtime.win.system.runtime.extensions-4.3.0
	ryujinx.atksharp-3.24.24.59-ryujinx
	ryujinx.audio.openal.dependencies-1.21.0.1
	ryujinx.cairosharp-3.24.24.59-ryujinx
	ryujinx.gdksharp-3.24.24.59-ryujinx
	ryujinx.giosharp-3.24.24.59-ryujinx
	ryujinx.glibsharp-3.24.24.59-ryujinx
	ryujinx.graphics.nvdec.dependencies-5.0.1-build13
	ryujinx.graphics.vulkan.dependencies.moltenvk-1.2.0
	ryujinx.gtksharp-3.24.24.59-ryujinx
	ryujinx.pangosharp-3.24.24.59-ryujinx
	ryujinx.sdl2-cs-2.26.3-build25
	shaderc.net-0.1.0
	sharpziplib-1.4.2
	shimskiasharp-0.5.18
	silk.net.core-2.16.0
	silk.net.vulkan-2.16.0
	silk.net.vulkan.extensions.ext-2.16.0
	silk.net.vulkan.extensions.khr-2.16.0
	sixlabors.fonts-1.0.0-beta0013
	sixlabors.imagesharp-1.0.4
	sixlabors.imagesharp.drawing-1.0.0-beta11
	skiasharp-2.88.1-preview.108
	skiasharp.harfbuzz-2.88.1-preview.108
	skiasharp.nativeassets.linux-2.88.1-preview.108
	skiasharp.nativeassets.macos-2.88.1-preview.108
	skiasharp.nativeassets.webassembly-2.88.1-preview.108
	skiasharp.nativeassets.win32-2.88.1-preview.108
	spb-0.0.4-build28
	svg.custom-0.5.18
	svg.model-0.5.18
	svg.skia-0.5.18
	system.appcontext-4.1.0
	system.buffers-4.0.0
	system.buffers-4.3.0
	system.buffers-4.5.1
	system.codedom-4.4.0
	system.codedom-7.0.0
	system.collections-4.0.11
	system.collections-4.3.0
	system.collections.concurrent-4.0.12
	system.collections.immutable-1.5.0
	system.collections.immutable-6.0.0
	system.componentmodel.annotations-4.5.0
	system.console-4.0.0
	system.diagnostics.debug-4.0.11
	system.diagnostics.debug-4.3.0
	system.diagnostics.diagnosticsource-4.0.0
	system.diagnostics.tools-4.0.1
	system.diagnostics.tracing-4.1.0
	system.drawing.common-7.0.0
	system.dynamic.runtime-4.3.0
	system.globalization-4.0.11
	system.globalization-4.3.0
	system.globalization.calendars-4.0.1
	system.globalization.extensions-4.0.1
	system.identitymodel.tokens.jwt-6.30.0
	system.io-4.1.0
	system.io-4.3.0
	system.io.compression-4.1.0
	system.io.compression.zipfile-4.0.1
	system.io.filesystem-4.0.1
	system.io.filesystem.primitives-4.0.1
	system.io.hashing-7.0.0
	system.linq-4.1.0
	system.linq-4.3.0
	system.linq.expressions-4.1.0
	system.linq.expressions-4.3.0
	system.management-7.0.1
	system.memory-4.5.3
	system.memory-4.5.4
	system.memory-4.5.5
	system.net.http-4.1.0
	system.net.nameresolution-4.3.0
	system.net.primitives-4.0.11
	system.net.sockets-4.1.0
	system.numerics.vectors-4.3.0
	system.numerics.vectors-4.4.0
	system.numerics.vectors-4.5.0
	system.objectmodel-4.0.12
	system.objectmodel-4.3.0
	system.private.uri-4.3.0
	system.reactive-5.0.0
	system.reflection-4.1.0
	system.reflection-4.3.0
	system.reflection.emit-4.0.1
	system.reflection.emit-4.3.0
	system.reflection.emit-4.7.0
	system.reflection.emit.ilgeneration-4.0.1
	system.reflection.emit.ilgeneration-4.3.0
	system.reflection.emit.lightweight-4.0.1
	system.reflection.emit.lightweight-4.3.0
	system.reflection.extensions-4.0.1
	system.reflection.extensions-4.3.0
	system.reflection.metadata-1.6.0
	system.reflection.metadata-6.0.1
	system.reflection.primitives-4.0.1
	system.reflection.primitives-4.3.0
	system.reflection.typeextensions-4.1.0
	system.reflection.typeextensions-4.3.0
	system.resources.resourcemanager-4.0.1
	system.resources.resourcemanager-4.3.0
	system.runtime-4.1.0
	system.runtime-4.3.0
	system.runtime.compilerservices.unsafe-4.5.2
	system.runtime.compilerservices.unsafe-4.6.0
	system.runtime.compilerservices.unsafe-4.7.0
	system.runtime.compilerservices.unsafe-5.0.0
	system.runtime.compilerservices.unsafe-6.0.0
	system.runtime.extensions-4.1.0
	system.runtime.extensions-4.3.0
	system.runtime.handles-4.0.1
	system.runtime.handles-4.3.0
	system.runtime.interopservices-4.1.0
	system.runtime.interopservices-4.3.0
	system.runtime.interopservices.runtimeinformation-4.0.0
	system.runtime.numerics-4.0.1
	system.security.accesscontrol-4.5.0
	system.security.claims-4.3.0
	system.security.cryptography.algorithms-4.2.0
	system.security.cryptography.cng-4.2.0
	system.security.cryptography.cng-4.5.0
	system.security.cryptography.csp-4.0.0
	system.security.cryptography.encoding-4.0.0
	system.security.cryptography.openssl-4.0.0
	system.security.cryptography.primitives-4.0.0
	system.security.cryptography.x509certificates-4.1.0
	system.security.principal-4.3.0
	system.security.principal.windows-4.3.0
	system.security.principal.windows-4.5.0
	system.security.principal.windows-4.7.0
	system.text.encoding-4.0.11
	system.text.encoding-4.3.0
	system.text.encoding.codepages-4.5.1
	system.text.encoding.codepages-6.0.0
	system.text.encoding.extensions-4.0.11
	system.text.encodings.web-4.7.2
	system.text.encodings.web-6.0.0
	system.text.json-4.7.2
	system.text.json-6.0.0
	system.text.regularexpressions-4.1.0
	system.threading-4.0.11
	system.threading-4.3.0
	system.threading.overlapped-4.3.0
	system.threading.tasks-4.0.11
	system.threading.tasks-4.3.0
	system.threading.tasks.extensions-4.0.0
	system.threading.tasks.extensions-4.5.3
	system.threading.tasks.extensions-4.5.4
	system.threading.threadpool-4.3.0
	system.threading.timer-4.0.1
	system.valuetuple-4.5.0
	system.xml.readerwriter-4.0.11
	system.xml.xdocument-4.0.11
	tmds.dbus-0.9.0
	unicornengine.unicorn-2.0.2-rc1-fb78016
	xamlnamereferencegenerator-1.6.1"
SRC_URI="https://github.com/${MY_PN}/${MY_PN}/archive/${SHA}.tar.gz -> ${P}.tar.gz
	$(nuget_uris)"

DEPEND="sys-libs/zlib"
RDEPEND="${DEPEND}
	dev-libs/icu
	dev-libs/openssl
	media-libs/libglvnd[X]
	media-libs/libsdl2
	media-libs/libsoundio
	media-libs/openal
	media-video/ffmpeg
	x11-libs/gtk+:3"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
PATCHES=(
	"${FILESDIR}/${PN}-0001-better-defaults.patch"
	"${FILESDIR}/${PN}-0002-disable-updates.patch"
)

S="${WORKDIR}/${MY_PN}-${SHA}"

src_install() {
	newicon distribution/misc/Logo.svg "${MY_PN}.svg"
	insinto /usr/share/mime/packages
	doins "distribution/linux/mime/${MY_PN}.xml"
	insinto /usr/share/applications
	doins "distribution/linux/${MY_PN}.desktop"
	dobin "src/${MY_PN}/bin/Release/net${DOTNET_SLOT}/linux-x64/publish/${MY_PN}"
	einstalldocs
}

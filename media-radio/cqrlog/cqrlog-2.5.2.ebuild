# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit optfeature

DESCRIPTION="CQRLOG is an advanced ham radio logger based on MySQL database"
HOMEPAGE="https://www.cqrlog.com/ https://github.com/ok2cqr/cqrlog"
SRC_URI="https://github.com/ok2cqr/cqrlog/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	>=dev-lang/lazarus-1.8.0
	>=dev-lang/fpc-3.0.2
"
RDEPEND="
	dev-libs/atk
	dev-libs/glib
	virtual/mysql[server]
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/gtk+
	x11-libs/libX11
	x11-libs/pango
"

PATCHES=(
	"${FILESDIR}/${PN}-2.4.0-makefile.patch"
)

pkg_postist() {
	optfeature "monitoring radio settings" media-libs/hamlib
}

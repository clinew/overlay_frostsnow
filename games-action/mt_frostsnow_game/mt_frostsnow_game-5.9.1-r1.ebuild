# Copyright 1999-2019 Gentoo Authors
# Copyright 2019-2025 Wade T. Cline
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit git-r3

DESCRIPTION="Frostsnow's version of the main game for the Minetest Game engine"
EGIT_REPO_URI="https://github.com/clinew/minetest_game"
EGIT_BRANCH="frostsnow"
EGIT_COMMIT="f398c19d5f319ced131362a5589ff4727a8bb9a5"

LICENSE="CC-BY-3.0 CC-BY-SA-3.0 CC-BY-SA-4.0 CC0-1.0 LGPL-2.1 LGPL-2.1+ MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="dev-lua/luasocket
	>=games-engines/minetest-${PV}"

src_install() {
	insinto /usr/share/minetest/games/${PN}
	doins -r mods menu
	doins game.conf minetest.conf

	dodoc README.md game_api.txt
}

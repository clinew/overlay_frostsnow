# Copyright 1999-2019 Gentoo Authors
# Copyright 2019-2020 Wade T. Cline
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3

DESCRIPTION="Frostsnow's version of the main game for the Minetest Game engine"
EGIT_REPO_URI="https://github.com/clinew/minetest_game"
EGIT_BRANCH="frostsnow"
EGIT_COMMIT="3e3697a21740a64c9ea0f4b49a0b86723a6c178e"

LICENSE="CC-BY-3.0 CC-BY-SA-3.0 CC-BY-SA-4.0 CC0-1.0 LGPL-2.1 LGPL-2.1+ MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

# FIXME: Will break after version 9.
RDEPEND="dev-lua/luasocket
	>=games-action/minetest-${PV/%.?/}"

src_install() {
	insinto /usr/share/minetest/games/${PN}
	doins -r mods menu
	doins game.conf minetest.conf

	dodoc README.md game_api.txt
}
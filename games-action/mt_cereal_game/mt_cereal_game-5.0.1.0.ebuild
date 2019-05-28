# Copyright 1999-2019 Gentoo Authors
# Copyright 2019 Wade T. Cline
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3

DESCRIPTION="Frostsnow's version of the main game for the Minetest game engine"
EGIT_REPO_URI="https://github.com/clinew/minetest_game"
EGIT_BRANCH="cereal-5.0.1"
EGIT_COMMIT="5451f7ad6ada91189266c7f4786fba5c4e5f3191"

LICENSE="CC-BY-3.0 CC-BY-SA-3.0 CC-BY-SA-4.0 CC0-1.0 LGPL-2.1 LGPL-2.1+ MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# FIXME: Will break after version 9.
RDEPEND=">=games-action/minetest-${PV/%.?/}"

src_install() {
	insinto /usr/share/minetest/games/${PN}
	doins -r mods menu
	doins game.conf minetest.conf

	dodoc README.txt game_api.txt
}

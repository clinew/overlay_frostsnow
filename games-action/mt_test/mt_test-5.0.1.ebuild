# Copyright 2019 Gentoo Authors
# Copyright 2019 Wade T. Cline
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit user

DESCRIPTION="Configure Minetest 'test' server"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="games-action/mt_cereal_game"
RDEPEND="${DEPEND}"
BDEPEND=""

WORLD=${PN#*_}

pkg_setup() {
	enewgroup ${PN}
	enewuser ${PN} -1 -1 /var/lib/minetest-${WORLD} ${PN}
}

src_unpack() {
	mkdir ${WORKDIR}/${P}
}

src_prepare() {
	sed \
		-e "s#@BINDIR@#${EPREFIX}/usr/bin#g" \
		-e "s#@USER@#${PN}#g" \
		-e "s#@GROUP@#${PN}#g" \
		-e "s#@WORLD@#${WORLD}#g" \
		"${FILESDIR}"/minetestserver.confd > "${T}"/minetestserver.confd || die
	default
}

src_install() {
	dosym /etc/init.d/minetest-server /etc/init.d/minetest-server.${WORLD}
	newconfd "${T}"/minetestserver.confd minetest-server.${WORLD}

	diropts -o"${PN}" -g"${PN}" -m0700
	keepdir /var/log/minetest-${WORLD}
}

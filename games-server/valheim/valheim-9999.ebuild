# Copyright 2021, 2022 Wade T. Cline
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Server for the Viking survival game Valheim"

# TODO: What license does this use?
#LICENSE=""
SLOT="0"
KEYWORDS=""

RDEPEND="
	acct-group/valheim
	acct-user/valheim
	games-server/steamcmd
"

pkg_setup() {
	mkdir ${WORKDIR}/${P}

	# Ownership hacks to get around SteamCMD.
	# Installation instructions shamelessly pilfered from
	# https://gameplay.tips/guides/9765-valheim.html
	chown steamcmd:steamcmd "${PORTAGE_BUILDDIR}"
	chown steamcmd:steamcmd "${T}"
	/opt/steamcmd/steamcmd.sh +login anonymous +force_install_dir "${T}/opt/valheim" +app_update 896660 validate +exit
	chown portage:portage "${PORTAGE_BUILDDIR}"
	chown portage:portage "${T}"
}

src_install() {
	cp -rpv "${T}/opt" "${D}"

	newinitd "${FILESDIR}/${PN}.initd" "${PN}"
	newconfd "${FILESDIR}/${PN}.confd" "${PN}"
	exeinto /opt/valheim
	doexe "${FILESDIR}/start_server_gentoo.sh"
}

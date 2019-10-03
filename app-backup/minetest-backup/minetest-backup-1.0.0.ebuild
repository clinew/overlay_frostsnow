# Copyright 2019 Wade Cline
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit user

DESCRIPTION="Install a script to backup a Minetest server"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sys-process/cronie"
BDEPEND=""

pkg_setup() {
	enewgroup mtbackup
	enewuser mtbackup -1 /bin/bash /home/mtbackup mtbackup
}

src_unpack() {
	mkdir ${WORKDIR}/${P}
}

src_install() {
	# Install script.
	exeinto /usr/bin
	doexe ${FILESDIR}/mtbackup

	# Install cron job.
	insinto /var/spool/cron/crontabs
	newins ${FILESDIR}/mtbackup.cron mtbackup
	fowners mtbackup:crontab /var/spool/cron/crontabs/mtbackup

	# Configuration management (evil).
	addwrite /home/mtbackup
	insinto /home/mtbackup/.ssh
	doins -r ${FILESDIR}/authorized_keys
	fowners -R mtbackup:mtbackup /home/mtbackup/.ssh
}

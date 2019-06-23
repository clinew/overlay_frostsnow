# Copyright 2019 Wade Cline
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit user

DESCRIPTION="Install a script to backup a Minetest server"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	virtual/cron"
BDEPEND=""

pkg_setup() {
	enewgroup mtbackup
	enewuser mtbackup -1 /bin/bash /home/mtbackup mtbackup
}

src_unpack() {
	mkdir ${WORKDIR}/${P}
}

src_install() {
	# Install cron job.
	exeinto /etc/cron.daily
	doexe ${FILESDIR}/mtbackup

	# Configuration management (evil).
	addwrite /home/mtbackup
	insinto /home/mtbackup/.ssh
	doins -r ${FILESDIR}/authorized_keys
	fowners -R mtbackup:mtbackup /home/mtbackup/.ssh
}

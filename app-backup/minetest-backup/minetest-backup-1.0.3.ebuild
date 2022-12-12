# Copyright (C) 2019, 2022  Wade T. Cline
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) version 3 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

EAPI=8

DESCRIPTION="Install a script to backup a Minetest server"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="
	acct-group/mtbackup
	acct-user/mtbackup"
RDEPEND="${DEPEND}
	sys-process/cronie"

src_unpack() {
	mkdir ${WORKDIR}/${P}
}

src_install() {
	# Install script.
	exeinto /usr/bin
	doexe ${FILESDIR}/mtbackup

	# Install cron job.
	# FIXME: What if this clobbers an existing crontab?
	insinto /var/spool/cron/crontabs
	newins ${FILESDIR}/mtbackup.cron root
	fowners root:crontab /var/spool/cron/crontabs/root

	# Configuration management (evil).
	addwrite /home/mtbackup
	insinto /home/mtbackup/.ssh
	doins -r ${FILESDIR}/authorized_keys
	fowners -R mtbackup:mtbackup /home/mtbackup/.ssh
}

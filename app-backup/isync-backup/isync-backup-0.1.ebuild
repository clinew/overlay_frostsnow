# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="System configuration package for automatic e-mail backups via 'isync'"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="
	acct-group/isync
	acct-user/isync"
RDEPEND="${DEPEND}
	net-mail/isync
	sys-process/cronie"

src_unpack() {
	mkdir ${WORKDIR}/${P}
}

src_install() {
	# Install cron job.
	insinto /var/spool/cron/crontabs
	newins ${FILESDIR}/isync.cron isync
	fowners isync:crontab /var/spool/cron/crontabs/isync

	# Install configuration file.
	# TODO: Create storage directory with 'keepdir'.
	# TODO: Fix configuration file account.
	insinto /var/lib/isync
	insopts -o=isync -g=isync -m=600
	newins ${FILESDIR}/mbsyncrc .mbsyncrc
}

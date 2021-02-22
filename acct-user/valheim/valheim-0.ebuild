# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

DESCRIPTION="Valheim server account"
ACCT_USER_ID=-1
ACCT_USER_GROUPS=( valheim )
ACCT_USER_HOME=/var/opt/valheim

acct-user_add_deps

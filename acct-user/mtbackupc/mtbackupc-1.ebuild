# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="Minetest backup client account"
ACCT_USER_ID=-1
ACCT_USER_GROUPS=( mtbackupc )
ACCT_USER_HOME="/home/mtbackupc"
ACCT_USER_SHELL="/bin/bash"
ACCT_USER_HOME_PERMS=0750

acct-user_add_deps

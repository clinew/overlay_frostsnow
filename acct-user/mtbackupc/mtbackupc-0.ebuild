# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="Minetest backup client account"
ACCT_USER_ID=-1
ACCT_USER_GROUPS=( mtbackupc )

acct-user_add_deps
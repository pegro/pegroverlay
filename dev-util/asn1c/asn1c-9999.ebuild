# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools git-r3

DESCRIPTION="Open Source ASN.1 Compiler"
HOMEPAGE="http://lionet.info/asn1c/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/vlm/asn1c"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="sanitize"

src_prepare(){
	eapply_user
	eautoreconf
}

src_configure() {
	econf $(use_enable sanitize test-asan) $(use_enable sanitize test-ubsan)
}

src_compile() {
	default_src_compile

	emake -C skeletons libasn1cskeletons.la
}

src_install(){
	emake DESTDIR="${D}" install || die "make install failed"
	dodoc BUGS FAQ || die "dodoc failed"

	dolib.a skeletons/.libs/libasn1cskeletons.a
}

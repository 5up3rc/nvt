# OpenVAS Vulnerability Test
# $Id: deb_3691.nasl 6959 2017-08-18 07:24:59Z asteins $
# Auto-generated from advisory DSA 3691-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#


if(description)
{
    script_id(703691);
    script_version("$Revision: 6959 $");
    script_cve_id("CVE-2013-5653", "CVE-2016-7976", "CVE-2016-7977", "CVE-2016-7978",
                  "CVE-2016-7979", "CVE-2016-8602");
    script_name("Debian Security Advisory DSA 3691-1 (ghostscript - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-08-18 09:24:59 +0200 (Fri, 18 Aug 2017) $");
    script_tag(name: "creation_date", value: "2016-10-12 00:00:00 +0200 (Wed, 12 Oct 2016)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3691.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "ghostscript on Debian Linux");
    script_tag(name: "insight",   value: "GPL Ghostscript is used for
PostScript/PDF preview and printing. Usually as a back-end to a program such
as ghostview, it can display PostScript and PDF documents in an X11
environment.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie),
these problems have been fixed in version 9.06~dfsg-2+deb8u3.

We recommend that you upgrade your ghostscript packages.");
    script_tag(name: "summary",   value: "Several vulnerabilities were discovered
in Ghostscript, the GPL PostScript/PDF interpreter, which may lead to the execution
of arbitrary code or information disclosure if a specially crafted Postscript file
is processed.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"ghostscript", ver:"9.06~dfsg-2+deb8u3", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ghostscript-dbg", ver:"9.06~dfsg-2+deb8u3", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ghostscript-doc", ver:"9.06~dfsg-2+deb8u3", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ghostscript-x", ver:"9.06~dfsg-2+deb8u3", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgs-dev", ver:"9.06~dfsg-2+deb8u3", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgs9", ver:"9.06~dfsg-2+deb8u3", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgs9-common", ver:"9.06~dfsg-2+deb8u3", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

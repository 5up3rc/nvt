# OpenVAS Vulnerability Test
# $Id: deb_3515.nasl 6608 2017-07-07 12:05:05Z cfischer $
# Auto-generated from advisory DSA 3515-1 using nvtgen 1.0
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
    script_id(703515);
    script_version("$Revision: 6608 $");
    script_cve_id("CVE-2016-1977", "CVE-2016-2790", "CVE-2016-2791", "CVE-2016-2792",
                  "CVE-2016-2793", "CVE-2016-2794", "CVE-2016-2795", "CVE-2016-2796",
                  "CVE-2016-2797", "CVE-2016-2798", "CVE-2016-2799", "CVE-2016-2800",
                  "CVE-2016-2801", "CVE-2016-2802");
    script_name("Debian Security Advisory DSA 3515-1 (graphite2 - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-07-07 14:05:05 +0200 (Fri, 07 Jul 2017) $");
    script_tag(name: "creation_date", value: "2016-03-13 00:00:00 +0100 (Sun, 13 Mar 2016)");
    script_tag(name:"cvss_base", value:"9.3");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3515.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "graphite2 on Debian Linux");
    script_tag(name: "solution",  value: "For the oldstable distribution (wheezy),
these problems have been fixed in version 1.3.6-1~deb7u1.

For the stable distribution (jessie), these problems have been fixed in
version 1.3.6-1~deb8u1.

For the testing distribution (stretch), these problems have been fixed
in version 1.3.6-1.

For the unstable distribution (sid), these problems have been fixed in
version 1.3.6-1.

We recommend that you upgrade your graphite2 packages.");
    script_tag(name: "summary",   value: "Multiple vulnerabilities have been found
in the Graphite font rendering engine which might result in denial of service or
the execution of arbitrary code if a malformed font file is processed.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libgraphite2-3:amd64", ver:"1.3.6-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgraphite2-3:i386", ver:"1.3.6-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgraphite2-dev", ver:"1.3.6-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgraphite2-doc", ver:"1.3.6-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgraphite2-3:amd64", ver:"1.3.6-1~deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgraphite2-3:i386", ver:"1.3.6-1~deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgraphite2-3-dbg", ver:"1.3.6-1~deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgraphite2-dev", ver:"1.3.6-1~deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgraphite2-doc", ver:"1.3.6-1~deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgraphite2-2.0.0:amd64", ver:"1.3.6-1~deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgraphite2-2.0.0:i386", ver:"1.3.6-1~deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgraphite2-2.0.0-dbg", ver:"1.3.6-1~deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgraphite2-dev", ver:"1.3.6-1~deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgraphite2-doc", ver:"1.3.6-1~deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

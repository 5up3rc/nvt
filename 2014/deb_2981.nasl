# OpenVAS Vulnerability Test
# $Id: deb_2981.nasl 6724 2017-07-14 09:57:17Z teissa $
# Auto-generated from advisory DSA 2981-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2014 Greenbone Networks GmbH http://greenbone.net
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

tag_affected  = "polarssl on Debian Linux";
tag_insight   = "PolarSSL is a fork of the abandoned project XySSL. It is a lean crypto
library providing SSL and TLS support in your programs.";
tag_solution  = "For the stable distribution (wheezy), this problem has been fixed in
version 1.2.9-1~deb7u3.

For the testing distribution (jessie), this problem has been fixed in
version 1.3.7-2.1.

For the unstable distribution (sid), this problem has been fixed in
version 1.3.7-2.1.

We recommend that you upgrade your polarssl packages.";
tag_summary   = "A flaw was discovered in PolarSSL, a lightweight crypto and SSL/TLS
library, which can be exploited by a remote unauthenticated attacker to
mount a denial of service against PolarSSL servers that offer GCM
ciphersuites. Potentially clients are affected too if a malicious server
decides to execute the denial of service attack against its clients.";
tag_vuldetect = "This check tests the installed software version using the apt package manager.";

if(description)
{
    script_id(702981);
    script_version("$Revision: 6724 $");
    script_cve_id("CVE-2014-4911");
    script_name("Debian Security Advisory DSA 2981-1 (polarssl - security update)");
    script_tag(name: "last_modification", value:"$Date: 2017-07-14 11:57:17 +0200 (Fri, 14 Jul 2017) $");
    script_tag(name: "creation_date", value:"2014-07-18 00:00:00 +0200 (Fri, 18 Jul 2014)");
    script_tag(name:"cvss_base", value:"5.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");

    script_xref(name: "URL", value: "http://www.debian.org/security/2014/dsa-2981.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2014 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: tag_affected);
    script_tag(name: "insight",   value: tag_insight);
#    script_tag(name: "impact",    value: tag_impact);
    script_tag(name: "solution",  value: tag_solution);
    script_tag(name: "summary",   value: tag_summary);
    script_tag(name: "vuldetect", value: tag_vuldetect);
    script_tag(name:"qod_type", value:"package");
    script_tag(name:"solution_type", value:"VendorFix");

    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libpolarssl-dev", ver:"1.2.9-1~deb7u3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpolarssl-runtime", ver:"1.2.9-1~deb7u3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpolarssl0", ver:"1.2.9-1~deb7u3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpolarssl-dev", ver:"1.2.9-1~deb7u3", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpolarssl-runtime", ver:"1.2.9-1~deb7u3", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpolarssl0", ver:"1.2.9-1~deb7u3", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpolarssl-dev", ver:"1.2.9-1~deb7u3", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpolarssl-runtime", ver:"1.2.9-1~deb7u3", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpolarssl0", ver:"1.2.9-1~deb7u3", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpolarssl-dev", ver:"1.2.9-1~deb7u3", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpolarssl-runtime", ver:"1.2.9-1~deb7u3", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpolarssl0", ver:"1.2.9-1~deb7u3", rls:"DEB7.3")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

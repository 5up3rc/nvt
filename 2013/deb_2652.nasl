# OpenVAS Vulnerability Test
# $Id: deb_2652.nasl 6611 2017-07-07 12:07:20Z cfischer $
# Auto-generated from advisory DSA 2652-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH http://greenbone.net
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

include("revisions-lib.inc");

tag_affected  = "libxml2 on Debian Linux";
tag_insight   = "XML is a metalanguage to let you design your own markup language.
A regular markup language defines a way to describe information in
a certain class of documents (eg HTML). XML lets you define your
own customized markup languages for many classes of document. It
can do this because it's written in SGML, the international standard
metalanguage for markup languages.";
tag_solution  = "For the stable distribution (squeeze), these problems have been fixed in
version 2.7.8.dfsg-2+squeeze7.

For the testing (wheezy) and unstable (sid) distributions, these problems
have been fixed in version 2.8.0+dfsg1-7+nmu1.

We recommend that you upgrade your libxml2 packages.";
tag_summary   = "Brad Hill of iSEC Partners discovered that many XML implementations are
vulnerable to external entity expansion issues, which can be used for
various purposes such as firewall circumvention, disguising an IP
address, and denial-of-service. libxml2 was susceptible to these
problems when performing string substitution during entity expansion.";
tag_vuldetect = "This check tests the installed software version using the apt package manager.";

if(description)
{
    script_id(892652);
    script_version("$Revision: 6611 $");
    script_cve_id("CVE-2013-0338", "CVE-2013-0339");
    script_name("Debian Security Advisory DSA 2652-1 (libxml2 - external entity expansion)");
    script_tag(name: "last_modification", value:"$Date: 2017-07-07 14:07:20 +0200 (Fri, 07 Jul 2017) $");
    script_tag(name: "creation_date", value:"2013-03-24 00:00:00 +0100 (Sun, 24 Mar 2013)");
    script_tag(name:"cvss_base", value:"6.8");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");

    script_xref(name: "URL", value: "http://www.debian.org/security/2013/dsa-2652.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2013 Greenbone Networks GmbH http://greenbone.net");
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

include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libxml2", ver:"2.7.8.dfsg-2+squeeze7", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libxml2-dbg", ver:"2.7.8.dfsg-2+squeeze7", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libxml2-dev", ver:"2.7.8.dfsg-2+squeeze7", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libxml2-doc", ver:"2.7.8.dfsg-2+squeeze7", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libxml2-utils", ver:"2.7.8.dfsg-2+squeeze7", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-libxml2", ver:"2.7.8.dfsg-2+squeeze7", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-libxml2-dbg", ver:"2.7.8.dfsg-2+squeeze7", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libxml2", ver:"2.8.0+dfsg1-7+nmu1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libxml2-dbg", ver:"2.8.0+dfsg1-7+nmu1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libxml2-dev", ver:"2.8.0+dfsg1-7+nmu1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libxml2-doc", ver:"2.8.0+dfsg1-7+nmu1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libxml2-utils", ver:"2.8.0+dfsg1-7+nmu1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libxml2-utils-dbg", ver:"2.8.0+dfsg1-7+nmu1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-libxml2", ver:"2.8.0+dfsg1-7+nmu1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-libxml2-dbg", ver:"2.8.0+dfsg1-7+nmu1", rls:"DEB7.0")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

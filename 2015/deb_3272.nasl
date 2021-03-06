# OpenVAS Vulnerability Test
# $Id: deb_3272.nasl 6609 2017-07-07 12:05:59Z cfischer $
# Auto-generated from advisory DSA 3272-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net
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
    script_id(703272);
    script_version("$Revision: 6609 $");
    script_cve_id("CVE-2015-4047");
    script_name("Debian Security Advisory DSA 3272-1 (ipsec-tools - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-07-07 14:05:59 +0200 (Fri, 07 Jul 2017) $");
    script_tag(name: "creation_date", value: "2015-05-23 00:00:00 +0200 (Sat, 23 May 2015)");
    script_tag(name:"cvss_base", value:"7.8");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3272.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "ipsec-tools on Debian Linux");
    script_tag(name: "insight",   value: "IPsec (Internet Protocol security)
offers end-to-end security for network traffic at the IP layer.");
    script_tag(name: "solution",  value: "For the oldstable distribution (wheezy),
this problem has been fixed in version 1:0.8.0-14+deb7u1.

For the stable distribution (jessie), this problem has been fixed in
version 1:0.8.2+20140711-2+deb8u1.

For the testing distribution (stretch) and the unstable distribution
(sid), this problem will be fixed soon.

We recommend that you upgrade your ipsec-tools packages.");
    script_tag(name: "summary",   value: "Javantea discovered a NULL
pointer dereference flaw in racoon, the Internet Key Exchange daemon of ipsec-tools.
A remote attacker can use this flaw to cause the IKE daemon to crash via specially
crafted UDP packets, resulting in a denial of service.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"ipsec-tools", ver:"1:0.8.0-14+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"racoon", ver:"1:0.8.0-14+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

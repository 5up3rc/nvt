# OpenVAS Vulnerability Test
# $Id: deb_3869.nasl 6607 2017-07-07 12:04:25Z cfischer $
# Auto-generated from advisory DSA 3869-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net
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
    script_id(703869);
    script_version("$Revision: 6607 $");
    script_cve_id("CVE-2017-8911");
    script_name("Debian Security Advisory DSA 3869-1 (tnef - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-07-07 14:04:25 +0200 (Fri, 07 Jul 2017) $");
    script_tag(name: "creation_date", value: "2017-06-01 00:00:00 +0200 (Thu, 01 Jun 2017)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2017/dsa-3869.html");

    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "tnef on Debian Linux");
        script_tag(name: "insight",   value: "TNEF is a program for unpacking MIME attachments of type
'application/ms-tnef'. This is typcially a Microsoft only attachment.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie), this problem has been fixed in
version 1.4.9-1+deb8u3.

For the unstable distribution (sid), this problem has been fixed in
version 1.4.12-1.2.

We recommend that you upgrade your tnef packages.");
    script_tag(name: "summary",   value: "It was discovered that tnef, a tool used to unpack MIME attachments of
type 'application/ms-tnef', did not correctly validate its input. An
attacker could exploit this by tricking a user into opening a
malicious attachment, which would result in a denial-of-service by
application crash.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");

    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"tnef", ver:"1.4.9-1+deb8u3", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

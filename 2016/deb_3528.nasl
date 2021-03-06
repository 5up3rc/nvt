# OpenVAS Vulnerability Test
# $Id: deb_3528.nasl 6608 2017-07-07 12:05:05Z cfischer $
# Auto-generated from advisory DSA 3528-1 using nvtgen 1.0
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
    script_id(703528);
    script_version("$Revision: 6608 $");
    script_cve_id("CVE-2015-8833");
    script_name("Debian Security Advisory DSA 3528-1 (pidgin-otr - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-07-07 14:05:05 +0200 (Fri, 07 Jul 2017) $");
    script_tag(name: "creation_date", value: "2016-03-23 00:00:00 +0100 (Wed, 23 Mar 2016)");
    script_tag(name: "cvss_base", value: "10.0");
    script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:N/C:C/I:C/A:C");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3528.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "pidgin-otr on Debian Linux");
    script_tag(name: "insight",   value: "OTR allows you to have private
conversations over IM by providing:

- Encryption
- No one else can read your instant messages.
- Authentication
- You are assured the correspondent is who you think it is.
- Deniability
- The messages you send do _not_ have digital signatures that are
checkable by a third party. Anyone can forge messages after a
conversation to make them look like they came from you. However,
_during_ a conversation, your correspondent is assured the messages
they see are authentic and unmodified.
- Perfect forward secrecy
- If you lose control of your private keys, no previous conversation
is compromised.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie),
this problem has been fixed in version 4.0.1-1+deb8u1.

For the testing (stretch) and unstable (sid) distributions, this
problem has been fixed in version 4.0.2-1.

We recommend that you upgrade your pidgin-otr packages.");
    script_tag(name: "summary",   value: "Stefan Sperling discovered that pidgin-otr,
a Pidgin plugin implementing Off-The-Record messaging, contained a use-after-free
bug. This could be used by a malicious remote user to intentionally
crash the application, thus causing a denial-of-service.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"pidgin-otr", ver:"4.0.1-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"pidgin-otr", ver:"4.0.2-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

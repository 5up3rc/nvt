# OpenVAS Vulnerability Test
# $Id: deb_2860.nasl 6995 2017-08-23 11:52:03Z teissa $
# Auto-generated from advisory DSA 2860-1 using nvtgen 1.0
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

tag_affected  = "parcimonie on Debian Linux";
tag_insight   = "parcimonie is a daemon that slowly refreshes a GnuPG public keyring
from a keyserver.";
tag_solution  = "For the stable distribution (wheezy), this problem has been fixed in
version 0.7.1-1+deb7u1.

For the unstable distribution (sid), this problem has been fixed in
version 0.8.1-1.

We recommend that you upgrade your parcimonie packages.";
tag_summary   = "Holger Levsen discovered that parcimonie, a privacy-friendly helper to
refresh a GnuPG keyring, is affected by a design problem that undermines
the usefulness of this piece of software in the intended threat model.

When using parcimonie with a large keyring (1000 public keys or more),
it would always sleep exactly ten minutes between two key fetches. This
can probably be used by an adversary who can watch enough key fetches to
correlate multiple key fetches with each other, which is what parcimonie
aims at protecting against. Smaller keyrings are affected to a smaller
degree. This problem is slightly mitigated when using a HKP(s) pool as
the configured GnuPG keyserver.";
tag_vuldetect = "This check tests the installed software version using the apt package manager.";

if(description)
{
    script_id(702860);
    script_version("$Revision: 6995 $");
    script_cve_id("CVE-2014-1921");
    script_name("Debian Security Advisory DSA 2860-1 (parcimonie - information disclosure)");
    script_tag(name: "last_modification", value:"$Date: 2017-08-23 13:52:03 +0200 (Wed, 23 Aug 2017) $");
    script_tag(name: "creation_date", value:"2014-02-11 00:00:00 +0100 (Tue, 11 Feb 2014)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

    script_xref(name: "URL", value: "http://www.debian.org/security/2014/dsa-2860.html");


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
if ((res = isdpkgvuln(pkg:"parcimonie", ver:"0.7.1-1+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"parcimonie", ver:"0.7.1-1+deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"parcimonie", ver:"0.7.1-1+deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"parcimonie", ver:"0.7.1-1+deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

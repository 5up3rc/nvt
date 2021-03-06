# OpenVAS Vulnerability Test
# $Id: deb_3009.nasl 6769 2017-07-20 09:56:33Z teissa $
# Auto-generated from advisory DSA 3009-1 using nvtgen 1.0
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

tag_affected  = "python-imaging on Debian Linux";
tag_insight   = "The Python Imaging Library (PIL) adds an image object to your Python
interpreter. You can load images from a variety of file formats, and
apply a rich set of image operations to them.";
tag_solution  = "For the stable distribution (wheezy), this problem has been fixed in
version 1.1.7-4+deb7u1.

For the unstable distribution (sid), this problem has been fixed in
version 2.5.3-1 of the pillow source package.

We recommend that you upgrade your python-imaging packages.";
tag_summary   = "Andrew Drake discovered that missing input sanitising in the icns decoder
of the Python Imaging Library could result in denial of service if a
malformed image is processed.";
tag_vuldetect = "This check tests the installed software version using the apt package manager.";

if(description)
{
    script_id(703009);
    script_version("$Revision: 6769 $");
    script_cve_id("CVE-2014-3589");
    script_name("Debian Security Advisory DSA 3009-1 (python-imaging - security update)");
    script_tag(name: "last_modification", value:"$Date: 2017-07-20 11:56:33 +0200 (Thu, 20 Jul 2017) $");
    script_tag(name: "creation_date", value:"2014-08-21 00:00:00 +0200 (Thu, 21 Aug 2014)");
    script_tag(name:"cvss_base", value:"5.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");

    script_xref(name: "URL", value: "http://www.debian.org/security/2014/dsa-3009.html");


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
if ((res = isdpkgvuln(pkg:"python-imaging", ver:"1.1.7-4+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-imaging-dbg", ver:"1.1.7-4+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-imaging-doc", ver:"1.1.7-4+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-imaging-sane", ver:"1.1.7-4+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-imaging-sane-dbg", ver:"1.1.7-4+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-imaging-tk", ver:"1.1.7-4+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-imaging-tk-dbg", ver:"1.1.7-4+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-imaging", ver:"1.1.7-4+deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-imaging-dbg", ver:"1.1.7-4+deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-imaging-doc", ver:"1.1.7-4+deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-imaging-sane", ver:"1.1.7-4+deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-imaging-sane-dbg", ver:"1.1.7-4+deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-imaging-tk", ver:"1.1.7-4+deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-imaging-tk-dbg", ver:"1.1.7-4+deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-imaging", ver:"1.1.7-4+deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-imaging-dbg", ver:"1.1.7-4+deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-imaging-doc", ver:"1.1.7-4+deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-imaging-sane", ver:"1.1.7-4+deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-imaging-sane-dbg", ver:"1.1.7-4+deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-imaging-tk", ver:"1.1.7-4+deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-imaging-tk-dbg", ver:"1.1.7-4+deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-imaging", ver:"1.1.7-4+deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-imaging-dbg", ver:"1.1.7-4+deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-imaging-doc", ver:"1.1.7-4+deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-imaging-sane", ver:"1.1.7-4+deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-imaging-sane-dbg", ver:"1.1.7-4+deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-imaging-tk", ver:"1.1.7-4+deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-imaging-tk-dbg", ver:"1.1.7-4+deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

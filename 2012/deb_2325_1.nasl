# OpenVAS Vulnerability Test
# $Id: deb_2325_1.nasl 6612 2017-07-07 12:08:03Z cfischer $
# Description: Auto-generated from advisory DSA 2325-1 (kfreebsd-8)
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# or at your option, GNU General Public License version 3,
# as published by the Free Software Foundation
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
tag_insight = "Buffer overflow in the linux emulation support in FreeBSD kernel
allows local users to cause a denial of service (panic) and possibly
execute arbitrary code by calling the bind system call with a long path
for a UNIX-domain socket, which is not properly handled when the
address is used by other unspecified system calls.

For the stable distribution (squeeze), this problem has been fixed in
version 8.1+dfsg-8+squeeze2.

For the unstable distribution (sid), this problem has been fixed in
version 8.2-9.

We recommend that you upgrade your kfreebsd-8 packages.";
tag_summary = "The remote host is missing an update to kfreebsd-8
announced via advisory DSA 2325-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202325-1";

if(description)
{
 script_id(70540);
 script_tag(name:"cvss_base", value:"7.2");
 script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
 script_cve_id("CVE-2011-4062");
 script_version("$Revision: 6612 $");
 script_tag(name:"last_modification", value:"$Date: 2017-07-07 14:08:03 +0200 (Fri, 07 Jul 2017) $");
 script_tag(name:"creation_date", value:"2012-02-11 02:26:03 -0500 (Sat, 11 Feb 2012)");
 script_name("Debian Security Advisory DSA 2325-1 (kfreebsd-8)");


 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com");
 script_family("Debian Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");
 exit(0);
}

#
# The script code starts here
#

include("pkg-lib-deb.inc");
res = "";
report = "";
if((res = isdpkgvuln(pkg:"kfreebsd-headers-8-486", ver:"8.1+dfsg-8+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"kfreebsd-headers-8-686", ver:"8.1+dfsg-8+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"kfreebsd-headers-8-686-smp", ver:"8.1+dfsg-8+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"kfreebsd-headers-8-amd64", ver:"8.1+dfsg-8+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"kfreebsd-headers-8.1-1", ver:"8.1+dfsg-8+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"kfreebsd-headers-8.1-1-486", ver:"8.1+dfsg-8+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"kfreebsd-headers-8.1-1-686", ver:"8.1+dfsg-8+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"kfreebsd-headers-8.1-1-686-smp", ver:"8.1+dfsg-8+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"kfreebsd-headers-8.1-1-amd64", ver:"8.1+dfsg-8+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"kfreebsd-image-8-486", ver:"8.1+dfsg-8+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"kfreebsd-image-8-686", ver:"8.1+dfsg-8+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"kfreebsd-image-8-686-smp", ver:"8.1+dfsg-8+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"kfreebsd-image-8-amd64", ver:"8.1+dfsg-8+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"kfreebsd-image-8.1-1-486", ver:"8.1+dfsg-8+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"kfreebsd-image-8.1-1-686", ver:"8.1+dfsg-8+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"kfreebsd-image-8.1-1-686-smp", ver:"8.1+dfsg-8+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"kfreebsd-image-8.1-1-amd64", ver:"8.1+dfsg-8+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"kfreebsd-source-8.1", ver:"8.1+dfsg-8+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

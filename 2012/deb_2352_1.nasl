# OpenVAS Vulnerability Test
# $Id: deb_2352_1.nasl 6612 2017-07-07 12:08:03Z cfischer $
# Description: Auto-generated from advisory DSA 2352-1 (puppet)
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
tag_insight = "It was discovered that Puppet, a centralized configuration management
solution, misgenerated certificates if the certdnsnames option was
used. This could lead to man in the middle attacks. More details are
available at http://puppetlabs.com/security/cve/cve-2011-3872/

For the oldstable distribution (lenny), this problem has been fixed in
version 0.24.5-3+lenny2.

For the stable distribution (squeeze), this problem has been fixed in
version 2.6.2-5+squeeze3.

For the unstable distribution (sid), this problem has been fixed in
version 2.7.6-1.

We recommend that you upgrade your puppet packages.";
tag_summary = "The remote host is missing an update to puppet
announced via advisory DSA 2352-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202352-1";

if(description)
{
 script_id(70566);
 script_tag(name:"cvss_base", value:"2.6");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:N/I:P/A:N");
 script_cve_id("CVE-2011-3872");
 script_version("$Revision: 6612 $");
 script_tag(name:"last_modification", value:"$Date: 2017-07-07 14:08:03 +0200 (Fri, 07 Jul 2017) $");
 script_tag(name:"creation_date", value:"2012-02-11 02:31:41 -0500 (Sat, 11 Feb 2012)");
 script_name("Debian Security Advisory DSA 2352-1 (puppet)");


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
if((res = isdpkgvuln(pkg:"puppet", ver:"0.24.5-3+lenny2", rls:"DEB5.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"puppetmaster", ver:"0.24.5-3+lenny2", rls:"DEB5.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"puppet", ver:"2.6.2-5+squeeze3", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"puppet-common", ver:"2.6.2-5+squeeze3", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"puppet-el", ver:"2.6.2-5+squeeze3", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"puppet-testsuite", ver:"2.6.2-5+squeeze3", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"puppetmaster", ver:"2.6.2-5+squeeze3", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"vim-puppet", ver:"2.6.2-5+squeeze3", rls:"DEB6.0")) != NULL) {
    report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

# OpenVAS Vulnerability Test
# $Id: deb_2563_1.nasl 6612 2017-07-07 12:08:03Z cfischer $
# Description: Auto-generated from advisory DSA 2563-1 (viewvc)
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
tag_insight = "Several vulnerabilities were found in ViewVC, a web interface for CVS
and Subversion repositories.

CVE-2009-5024: remote attackers can bypass the cvsdb row_limit
configuration setting, and consequently conduct resource-consumption
attacks via the limit parameter.

CVE-2012-3356: the remote SVN views functionality does not properly
perform authorization, which allows remote attackers to bypass intended
access restrictions.

CVE-2012-3357: the SVN revision view does not properly handle log
messages when a readable path is copied from an unreadable path, which
allows remote attackers to obtain sensitive information.

CVE-2012-4533: function name lines returned by diff are not properly
escaped, allowing attackers with commit access to perform cross site
scripting.

For the stable distribution (squeeze), these problems have been fixed in
version 1.1.5-1.1+squeeze2.

For the testing distribution (wheezy), these problems will be fixed soon.

For the unstable distribution (sid), these problems have been fixed in
version 1.1.5-1.4.

We recommend that you upgrade your viewvc packages.";
tag_summary = "The remote host is missing an update to viewvc
announced via advisory DSA 2563-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202563-1";

if(description)
{
 script_id(72534);
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
 script_cve_id("CVE-2009-5024", "CVE-2012-3356", "CVE-2012-3357", "CVE-2012-4533");
 script_version("$Revision: 6612 $");
 script_tag(name:"last_modification", value:"$Date: 2017-07-07 14:08:03 +0200 (Fri, 07 Jul 2017) $");
 script_tag(name:"creation_date", value:"2012-10-29 10:19:52 -0400 (Mon, 29 Oct 2012)");
 script_name("Debian Security Advisory DSA 2563-1 (viewvc)");



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
if((res = isdpkgvuln(pkg:"viewvc", ver:"1.1.5-1.1+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"viewvc-query", ver:"1.1.5-1.1+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

# OpenVAS Vulnerability Test
# $Id: deb_2163_2.nasl 6613 2017-07-07 12:08:40Z cfischer $
# Description: Auto-generated from advisory DSA 2163-2 (dajaxice)
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com
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
tag_solution = "For the stable distribution (squeeze), this problem has been fixed in
version 0.1.5-1squeeze1.

For the testing (wheezy) and unstable distribution (sid), this problem
has been fixed in version 0.1.8.1-1.

We recommend that you upgrade your dajaxice packages.

https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202163-2";

tag_insight = "The changes in python-django DSA-2163 necessary to fix the issues
CVE-2011-0696 and CVE-2011-0697 introduced an unavoidable backward
incompatibility, which caused a regression in dajaxice, which
depends on python-django. This update supplies fixed packages for
dajaxice.";
tag_summary = "The remote host is missing an update to dajaxice
announced via advisory DSA 2163-2.";




if(description)
{
 script_id(69110);
 script_version("$Revision: 6613 $");
 script_tag(name:"last_modification", value:"$Date: 2017-07-07 14:08:40 +0200 (Fri, 07 Jul 2017) $");
 script_tag(name:"creation_date", value:"2011-03-09 05:54:11 +0100 (Wed, 09 Mar 2011)");
 script_tag(name:"cvss_base", value:"6.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
 script_cve_id("CVE-2011-0696", "CVE-2011-0697");
 script_name("Debian Security Advisory DSA 2163-2 (dajaxice)");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com");
 script_family("Debian Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name : "solution" , value : tag_solution);
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
if ((res = isdpkgvuln(pkg:"python-django-dajaxice", ver:"0.1.5-1squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

# OpenVAS Vulnerability Test
# $Id: deb_2421_1.nasl 6612 2017-07-07 12:08:03Z cfischer $
# Description: Auto-generated from advisory DSA 2421-1 (moodle)
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
tag_insight = "Several security issues have been fixed in Moodle, a course management
system for online learning:

CVE-2011-4308 / CVE-2012-0792

Rossiani Wijaya discovered an information leak in
mod/forum/user.php

CVE-2011-4584

MNET authentication didn't prevent a user using Login As from
jumping to a remove MNET SSO.

CVE-2011-4585

Darragh Enright discovered that the change password form was send in
over plain HTTP even if httpslogin was set to true.

CVE-2011-4586

David Michael Evans and German Sanchez Gances discovered CRLF
injection/HTTP response splitting vulnerabilities in the Calendar
module.

CVE-2011-4587

We recommend that you upgrade your moodle packages.";
tag_summary = "The remote host is missing an update to moodle
announced via advisory DSA 2421-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202421-1";

if(description)
{
 script_id(71149);
 script_cve_id("CVE-2011-4308", "CVE-2011-4584", "CVE-2011-4585", "CVE-2011-4586",
               "CVE-2011-4587", "CVE-2011-4588", "CVE-2012-0792", "CVE-2012-0793",
               "CVE-2012-0794", "CVE-2012-0795", "CVE-2012-0796");
 script_tag(name:"cvss_base", value:"6.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
 script_version("$Revision: 6612 $");
 script_tag(name:"last_modification", value:"$Date: 2017-07-07 14:08:03 +0200 (Fri, 07 Jul 2017) $");
 script_tag(name:"creation_date", value:"2012-03-12 11:32:57 -0400 (Mon, 12 Mar 2012)");
 script_name("Debian Security Advisory DSA 2421-1 (moodle)");



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
if((res = isdpkgvuln(pkg:"moodle", ver:"1.9.9.dfsg2-2.1+squeeze3", rls:"DEB6.0")) != NULL) {
    report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

# OpenVAS Vulnerability Test
# $Id: deb_2214_1.nasl 6613 2017-07-07 12:08:40Z cfischer $
# Description: Auto-generated from advisory DSA 2214-1 (ikiwiki)
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
tag_insight = "Tango discovered that ikiwiki, a wiki compiler, is not validating
if the htmlscrubber plugin is enabled or not on a page when adding
alternative stylesheets to pages.  This enables an attacker who is able
to upload custom stylesheets to add malicious stylesheets as an alternate
stylesheet, or replace the default stylesheet, and thus conduct
cross-site scripting attacks.


The oldstable distribution (lenny), this problem has been fixed in
version 2.53.6.

For the stable distribution (squeeze), this problem has been fixed in
version 3.20100815.7.

For the testing distribution (wheezy), this problem has been fixed in
version 3.20110328.

For the testing distribution (sid), this problem has been fixed in
version 3.20110328.


We recommend that you upgrade your ikiwiki packages.";
tag_summary = "The remote host is missing an update to ikiwiki
announced via advisory DSA 2214-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202214-1";


if(description)
{
 script_id(69558);
 script_version("$Revision: 6613 $");
 script_tag(name:"last_modification", value:"$Date: 2017-07-07 14:08:40 +0200 (Fri, 07 Jul 2017) $");
 script_tag(name:"creation_date", value:"2011-05-12 19:21:50 +0200 (Thu, 12 May 2011)");
 script_tag(name:"cvss_base", value:"3.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:P/A:N");
  script_cve_id("CVE-2011-1401");
 script_name("Debian Security Advisory DSA 2214-1 (ikiwiki)");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com");
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
if ((res = isdpkgvuln(pkg:"ikiwiki", ver:"2.53.6", rls:"DEB5.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ikiwiki", ver:"3.20100815.7", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ikiwiki", ver:"3.20110328", rls:"DEB7.0")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

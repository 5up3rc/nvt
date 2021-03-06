# OpenVAS Vulnerability Test
# $Id: esoft_slk_ssa_2007_325_01.nasl 6598 2017-07-07 09:36:44Z cfischer $
# Description: Auto-generated from the corresponding slackware advisory
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
tag_insight = "New libpng packages are available for Slackware 8.1, 9.0, 9.1, 10.0, 10.1,
10.2, 11.0, 12.0, and -current to fix security issues.";
tag_summary = "The remote host is missing an update as announced
via advisory SSA:2007-325-01.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=SSA:2007-325-01";
                                                                                
if(description)
{
 script_id(59024);
 script_tag(name:"creation_date", value:"2012-09-11 01:34:21 +0200 (Tue, 11 Sep 2012)");
 script_tag(name:"last_modification", value:"$Date: 2017-07-07 11:36:44 +0200 (Fri, 07 Jul 2017) $");
 script_cve_id("CVE-2007-5266", "CVE-2007-5267", "CVE-2007-5268", "CVE-2007-5269");
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
 script_version("$Revision: 6598 $");
 name = "Slackware Advisory SSA:2007-325-01 libpng ";
 script_name(name);



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com");
 script_family("Slackware Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/slackware_linux", "ssh/login/slackpack");
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

include("pkg-lib-slack.inc");
vuln = 0;
if(isslkpkgvuln(pkg:"libpng", ver:"1.2.23-i386-1_slack8.1", rls:"SLK8.1")) {
    vuln = 1;
}
if(isslkpkgvuln(pkg:"libpng", ver:"1.2.23-i386-1_slack9.0", rls:"SLK9.0")) {
    vuln = 1;
}
if(isslkpkgvuln(pkg:"libpng", ver:"1.2.23-i486-1_slack9.1", rls:"SLK9.1")) {
    vuln = 1;
}
if(isslkpkgvuln(pkg:"libpng", ver:"1.2.23-i486-1_slack10.0", rls:"SLK10.0")) {
    vuln = 1;
}
if(isslkpkgvuln(pkg:"libpng", ver:"1.2.18-i486-1_slack10.1", rls:"SLK10.1")) {
    vuln = 1;
}
if(isslkpkgvuln(pkg:"libpng", ver:"1.2.18-i486-1_slack10.2", rls:"SLK10.2")) {
    vuln = 1;
}
if(isslkpkgvuln(pkg:"libpng", ver:"1.2.23-i486-1_slack11.0", rls:"SLK11.0")) {
    vuln = 1;
}
if(isslkpkgvuln(pkg:"libpng", ver:"1.2.23-i486-1_slack12.0", rls:"SLK12.0")) {
    vuln = 1;
}

if(vuln) {
    security_message(0);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

#
# OpenVAS Vulnerability Test
# $
# Description: Auto generated from Gentoo's XML based advisory
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largely excerpted from the referenced
# advisories, and are Copyright (c) the respective author(s)
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
tag_insight = "Multiple vulnerabilities have been found in Libav, allowing
    attackers to execute arbitrary code or cause Denial of Service.";
tag_solution = "All Libav users should upgrade to the latest version:

      # emerge --sync
      # emerge --ask --oneshot --verbose '>=media-video/libav-0.8.3'
    

http://www.securityspace.com/smysecure/catid.html?in=GLSA%20201210-06
http://bugs.gentoo.org/show_bug.cgi?id=408555
http://bugs.gentoo.org/show_bug.cgi?id=422537";
tag_summary = "The remote host is missing updates announced in
advisory GLSA 201210-06.";

                                                                                
                                                                                
if(description)
{
 script_id(72522);
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_cve_id("CVE-2011-3929", "CVE-2011-3936", "CVE-2011-3937", "CVE-2011-3940", "CVE-2011-3945", "CVE-2011-3947", "CVE-2011-3951", "CVE-2011-3952", "CVE-2012-0848", "CVE-2012-0851", "CVE-2012-0852", "CVE-2012-0853", "CVE-2012-0858", "CVE-2012-0947");
 script_version("$Revision: 6593 $");
 script_tag(name:"last_modification", value:"$Date: 2017-07-07 11:18:14 +0200 (Fri, 07 Jul 2017) $");
 script_tag(name:"creation_date", value:"2012-10-22 08:43:44 -0400 (Mon, 22 Oct 2012)");
 script_name("Gentoo Security Advisory GLSA 201210-06 (libav)");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com");
 script_family("Gentoo Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/gentoo", "ssh/login/pkg");
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");
 exit(0);
}

#
# The script code starts here
#

include("pkg-lib-gentoo.inc");
res = "";
report = "";
if((res = ispkgvuln(pkg:"media-video/libav", unaffected: make_list("ge 0.8.3"), vulnerable: make_list("lt 0.8.3"))) != NULL ) {
    report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

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
tag_insight = "Multiple vulnerabilities have been found in MediaWiki, the worst of
which leading to remote execution of arbitrary code.";
tag_solution = "All MediaWiki users should upgrade to the latest version:

      # emerge --sync
      # emerge --ask --oneshot --verbose '>=www-apps/mediawiki-1.18.2'
    

http://www.securityspace.com/smysecure/catid.html?in=GLSA%20201206-09
http://bugs.gentoo.org/show_bug.cgi?id=366685
http://bugs.gentoo.org/show_bug.cgi?id=409513";
tag_summary = "The remote host is missing updates announced in
advisory GLSA 201206-09.";

                                                                                
                                                                                
if(description)
{
 script_id(71576);
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_cve_id("CVE-2010-2787", "CVE-2010-2788", "CVE-2010-2789", "CVE-2011-0003", "CVE-2011-0047", "CVE-2011-0537", "CVE-2011-1579", "CVE-2011-1580", "CVE-2011-1766", "CVE-2012-1578", "CVE-2012-1579", "CVE-2012-1580", "CVE-2012-1581", "CVE-2012-1582");
 script_version("$Revision: 6589 $");
 script_tag(name:"last_modification", value:"$Date: 2017-07-07 10:27:50 +0200 (Fri, 07 Jul 2017) $");
 script_tag(name:"creation_date", value:"2012-08-10 03:22:55 -0400 (Fri, 10 Aug 2012)");
 script_name("Gentoo Security Advisory GLSA 201206-09 (MediaWiki)");



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
if((res = ispkgvuln(pkg:"www-apps/mediawiki", unaffected: make_list("ge 1.18.2"), vulnerable: make_list("lt 1.18.2"))) != NULL ) {
    report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

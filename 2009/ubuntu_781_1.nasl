# OpenVAS Vulnerability Test
# $Id: ubuntu_781_1.nasl 6639 2017-07-10 10:52:06Z cfischer $
# Description: Auto-generated from advisory USN-781-1 (pidgin)
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2009 E-Soft Inc. http://www.securityspace.com
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
tag_solution = "The problem can be corrected by upgrading your system to the
 following package versions:

Ubuntu 8.04 LTS:
  pidgin                          1:2.4.1-1ubuntu2.4

Ubuntu 8.10:
  pidgin                          1:2.5.2-0ubuntu1.2

Ubuntu 9.04:
  pidgin                          1:2.5.5-1ubuntu8.1

After a standard system upgrade you need to restart Pidgin to effect
the necessary changes.

https://secure1.securityspace.com/smysecure/catid.html?in=USN-781-1";

tag_insight = "It was discovered that Pidgin did not properly handle certain malformed
messages when sending a file using the XMPP protocol handler. If a user
were tricked into sending a file, a remote attacker could send a specially
crafted response and cause Pidgin to crash, or possibly execute arbitrary
code with user privileges. (CVE-2009-1373)

It was discovered that Pidgin did not properly handle certain malformed
messages in the QQ protocol handler. A remote attacker could send a
specially crafted message and cause Pidgin to crash. This issue only
affected Ubuntu 8.10 and 9.04. (CVE-2009-1374)

It was discovered that Pidgin did not properly handle certain malformed
messages in the XMPP and Sametime protocol handlers. A remote attacker
could send a specially crafted message and cause Pidgin to crash.
(CVE-2009-1375)

It was discovered that Pidgin did not properly handle certain malformed
messages in the MSN protocol handler. A remote attacker could send a
specially crafted message and possibly execute arbitrary code with user
privileges. (CVE-2009-1376)";
tag_summary = "The remote host is missing an update to pidgin
announced via advisory USN-781-1.";

                                                                                


if(description)
{
 script_id(64177);
 script_version("$Revision: 6639 $");
 script_tag(name:"last_modification", value:"$Date: 2017-07-10 12:52:06 +0200 (Mon, 10 Jul 2017) $");
 script_tag(name:"creation_date", value:"2009-06-05 18:04:08 +0200 (Fri, 05 Jun 2009)");
 script_cve_id("CVE-2009-1373", "CVE-2009-1374", "CVE-2009-1375", "CVE-2009-1376");
 script_tag(name:"cvss_base", value:"9.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
 script_name("Ubuntu USN-781-1 (pidgin)");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2009 E-Soft Inc. http://www.securityspace.com");
 script_family("Ubuntu Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages");
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
if ((res = isdpkgvuln(pkg:"finch-dev", ver:"2.4.1-1ubuntu2.4", rls:"UBUNTU8.04 LTS")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpurple-bin", ver:"2.4.1-1ubuntu2.4", rls:"UBUNTU8.04 LTS")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpurple-dev", ver:"2.4.1-1ubuntu2.4", rls:"UBUNTU8.04 LTS")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"pidgin-data", ver:"2.4.1-1ubuntu2.4", rls:"UBUNTU8.04 LTS")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"pidgin-dev", ver:"2.4.1-1ubuntu2.4", rls:"UBUNTU8.04 LTS")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gaim", ver:"2.4.1-1ubuntu2.4", rls:"UBUNTU8.04 LTS")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"finch", ver:"2.4.1-1ubuntu2.4", rls:"UBUNTU8.04 LTS")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpurple0", ver:"2.4.1-1ubuntu2.4", rls:"UBUNTU8.04 LTS")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"pidgin-dbg", ver:"2.4.1-1ubuntu2.4", rls:"UBUNTU8.04 LTS")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"pidgin", ver:"2.4.1-1ubuntu2.4", rls:"UBUNTU8.04 LTS")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"finch-dev", ver:"2.5.2-0ubuntu1.2", rls:"UBUNTU8.10")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpurple-bin", ver:"2.5.2-0ubuntu1.2", rls:"UBUNTU8.10")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpurple-dev", ver:"2.5.2-0ubuntu1.2", rls:"UBUNTU8.10")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"pidgin-data", ver:"2.5.2-0ubuntu1.2", rls:"UBUNTU8.10")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"pidgin-dev", ver:"2.5.2-0ubuntu1.2", rls:"UBUNTU8.10")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"finch", ver:"2.5.2-0ubuntu1.2", rls:"UBUNTU8.10")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpurple0", ver:"2.5.2-0ubuntu1.2", rls:"UBUNTU8.10")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"pidgin-dbg", ver:"2.5.2-0ubuntu1.2", rls:"UBUNTU8.10")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"pidgin", ver:"2.5.2-0ubuntu1.2", rls:"UBUNTU8.10")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"finch-dev", ver:"2.5.5-1ubuntu8.1", rls:"UBUNTU9.04")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpurple-bin", ver:"2.5.5-1ubuntu8.1", rls:"UBUNTU9.04")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpurple-dev", ver:"2.5.5-1ubuntu8.1", rls:"UBUNTU9.04")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"pidgin-data", ver:"2.5.5-1ubuntu8.1", rls:"UBUNTU9.04")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"pidgin-dev", ver:"2.5.5-1ubuntu8.1", rls:"UBUNTU9.04")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"finch", ver:"2.5.5-1ubuntu8.1", rls:"UBUNTU9.04")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpurple0", ver:"2.5.5-1ubuntu8.1", rls:"UBUNTU9.04")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"pidgin-dbg", ver:"2.5.5-1ubuntu8.1", rls:"UBUNTU9.04")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"pidgin", ver:"2.5.5-1ubuntu8.1", rls:"UBUNTU9.04")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

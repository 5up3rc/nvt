# OpenVAS Vulnerability Test
# $Id: alas-2011-24.nasl 6579 2017-07-06 13:45:14Z cfischer $
 
# Description: Amazon Linux security check 
#  
# Authors: 
# Eero Volotinen <eero.volotinen@iki.fi> 
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://ping-viini.org 
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#
if(description)
 {
script_oid("1.3.6.1.4.1.25623.1.0.120401");
script_version("$Revision: 6579 $");
script_tag(name:"creation_date", value:"2015-09-08 11:24:49 +0200 (Tue, 08 Sep 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 15:45:14 +0200 (Thu, 06 Jul 2017) $");
script_name("Amazon Linux Local Check: ALAS-2011-24");
script_tag(name: "insight", value: "A flaw was discovered in the way BIND handled certain DNS queries, which caused it to cache an invalid record. A remote attacker could use this flaw to send repeated queries for this invalid record, causing the resolvers to exit unexpectedly due to a failed assertion."); 
script_tag(name : "solution", value : "Run yum update bind to update your system.");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://alas.aws.amazon.com/ALAS-2011-24.html");
script_cve_id("CVE-2011-4313");
script_tag(name:"cvss_base", value:"5.0");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/amazon_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_tag(name:"summary", value:"Amazon Linux Local Security Checks");
script_copyright("Eero Volotinen");
script_family("Amazon Linux Local Security Checks");
exit(0);
}
include("revisions-lib.inc");
include("pkg-lib-rpm.inc");
release = get_kb_item("ssh/login/release");
res = "";
if(release == NULL)
{
 exit(0);
}
if(release == "AMAZON")
{
if ((res = isrpmvuln(pkg:"bind", rpm:"bind~9.7.3~2.11.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"bind-debuginfo", rpm:"bind-debuginfo~9.7.3~2.11.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"bind-utils", rpm:"bind-utils~9.7.3~2.11.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"bind-sdb", rpm:"bind-sdb~9.7.3~2.11.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"bind-chroot", rpm:"bind-chroot~9.7.3~2.11.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"bind-libs", rpm:"bind-libs~9.7.3~2.11.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"bind-devel", rpm:"bind-devel~9.7.3~2.11.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}

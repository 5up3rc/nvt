# OpenVAS Vulnerability Test 
# Description: Amazon Linux security check 
# $Id: alas-2012-93.nasl 6578 2017-07-06 13:44:33Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.120296");
script_version("$Revision: 6578 $");
script_tag(name:"creation_date", value:"2015-09-08 13:23:04 +0200 (Tue, 08 Sep 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 15:44:33 +0200 (Thu, 06 Jul 2017) $");
script_name("Amazon Linux Local Check: ALAS-2012-93");
script_tag(name: "insight", value: "sql/password.c in Oracle MySQL 5.1.x before 5.1.63, 5.5.x before 5.5.24, and 5.6.x before 5.6.6, and MariaDB 5.1.x before 5.1.62, 5.2.x before 5.2.12, 5.3.x before 5.3.6, and 5.5.x before 5.5.23, when running in certain environments with certain implementations of the memcmp function, allows remote attackers to bypass authentication by repeatedly authenticating with the same incorrect password, which eventually causes a token comparison to succeed due to an improperly-checked return value."); 
script_tag(name : "solution", value : "Run yum update mysql55 to update your system.");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://alas.aws.amazon.com/ALAS-2012-93.html");
script_cve_id("CVE-2012-2122");
script_tag(name:"cvss_base", value:"5.1");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:P/I:P/A:P");
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
if ((res = isrpmvuln(pkg:"mysql55-embedded-devel", rpm:"mysql55-embedded-devel~5.5.24~1.24.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"mysql55-debuginfo", rpm:"mysql55-debuginfo~5.5.24~1.24.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"mysql55-server", rpm:"mysql55-server~5.5.24~1.24.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"mysql55-common", rpm:"mysql55-common~5.5.24~1.24.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"mysql55-test", rpm:"mysql55-test~5.5.24~1.24.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"mysql55-embedded", rpm:"mysql55-embedded~5.5.24~1.24.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"mysql55-bench", rpm:"mysql55-bench~5.5.24~1.24.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"mysql55-libs", rpm:"mysql55-libs~5.5.24~1.24.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"mysql55", rpm:"mysql55~5.5.24~1.24.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"mysql55-devel", rpm:"mysql55-devel~5.5.24~1.24.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}

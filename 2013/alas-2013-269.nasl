# OpenVAS Vulnerability Test 
# Description: Amazon Linux security check 
# $Id: alas-2013-269.nasl 6577 2017-07-06 13:43:46Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.120466");
script_version("$Revision: 6577 $");
script_tag(name:"creation_date", value:"2015-09-08 13:27:03 +0200 (Tue, 08 Sep 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 15:43:46 +0200 (Thu, 06 Jul 2017) $");
script_name("Amazon Linux Local Check: ALAS-2013-269");
script_tag(name: "insight", value: "The is_this_legal function in mod_dontdothat for Apache Subversion 1.4.0 through 1.7.13 and 1.8.0 through 1.8.4 allows remote attackers to bypass intended access restrictions and possibly cause a denial of service (resource consumption) via a relative URL in a REPORT request.The get_parent_resource function in repos.c in mod_dav_svn Apache HTTPD server module in Subversion 1.7.11 through 1.7.13 and 1.8.1 through 1.8.4, when built with assertions enabled and SVNAutoversioning is enabled, allows remote attackers to cause a denial of service (assertion failure and Apache process abort) via a non-canonical URL in a request, as demonstrated using a trailing /."); 
script_tag(name : "solution", value : "Run yum update subversion to update your system.");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://alas.aws.amazon.com/ALAS-2013-269.html");
script_cve_id("CVE-2013-4505", "CVE-2013-4558");
script_tag(name:"cvss_base", value:"3.5");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:N/A:P");
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
if ((res = isrpmvuln(pkg:"subversion-ruby", rpm:"subversion-ruby~1.7.14~1.36.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"subversion", rpm:"subversion~1.7.14~1.36.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"subversion-javahl", rpm:"subversion-javahl~1.7.14~1.36.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"subversion-tools", rpm:"subversion-tools~1.7.14~1.36.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"subversion-libs", rpm:"subversion-libs~1.7.14~1.36.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"subversion-devel", rpm:"subversion-devel~1.7.14~1.36.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"mod_dav_svn", rpm:"mod_dav_svn~1.7.14~1.36.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"subversion-perl", rpm:"subversion-perl~1.7.14~1.36.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"subversion-python", rpm:"subversion-python~1.7.14~1.36.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"subversion-debuginfo", rpm:"subversion-debuginfo~1.7.14~1.36.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}

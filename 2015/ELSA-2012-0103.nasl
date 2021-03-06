# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2012-0103.nasl 6557 2017-07-06 11:55:33Z cfischer $
 
# Authors: 
# Eero Volotinen <eero.volotinen@solinor.com> 
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://solinor.com
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
script_oid("1.3.6.1.4.1.25623.1.0.123994");
script_version("$Revision: 6557 $");
script_tag(name:"creation_date", value:"2015-10-06 14:11:21 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:55:33 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2012-0103");
script_tag(name: "insight", value: "ELSA-2012-0103 -  squirrelmail security update - [1.4.8-5.0.1.el5_7.13]- Remove Redhat splash screen images[1.4.8-5.13]- fix typo in CVE-20210-4555 patch[1.4.8-5.12]- patch for CVE-2010-2813 was not complete[1.4.8-5.11]- fix: CVE-2010-1637 : Port-scans via non-standard POP3 server ports in Mail Fetch plugin- fix: CVE-2010-2813 : DoS (disk space consumption) by random IMAP login attempts with 8-bit characters in the password- fix: CVE-2010-4554 : Prone to clickjacking attacks- fix: CVE-2010-4555 : Multiple XSS flaws[tag handling]- fix: CVE-2011-2752 : CRLF injection vulnerability- fix: CVE-2011-2753 : CSRF in the empty trash feature and in Index Order page"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2012-0103");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2012-0103.html");
script_cve_id("CVE-2010-1637","CVE-2010-2813","CVE-2010-4554","CVE-2010-4555","CVE-2011-2023","CVE-2011-2752","CVE-2011-2753");
script_tag(name:"cvss_base", value:"6.8");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/oracle_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_copyright("Eero Volotinen");
script_family("Oracle Linux Local Security Checks");
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
if(release == "OracleLinux5")
{
  if ((res = isrpmvuln(pkg:"squirrelmail", rpm:"squirrelmail~1.4.8~5.0.1.el5_7.13", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);


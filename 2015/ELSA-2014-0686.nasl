# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2014-0686.nasl 6559 2017-07-06 11:57:32Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.123374");
script_version("$Revision: 6559 $");
script_tag(name:"creation_date", value:"2015-10-06 14:02:57 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:57:32 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2014-0686");
script_tag(name: "insight", value: "ELSA-2014-0686 -  tomcat security update - [0:7.0.42-5]- Related: CVE-2013-4286- Related: CVE-2013-4322- Related: CVE-2014-0050- revisit patches for above."); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2014-0686");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2014-0686.html");
script_cve_id("CVE-2013-4286","CVE-2013-4322","CVE-2014-0186");
script_tag(name:"cvss_base", value:"5.8");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");
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
if(release == "OracleLinux7")
{
  if ((res = isrpmvuln(pkg:"tomcat", rpm:"tomcat~7.0.42~5.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"tomcat-admin-webapps", rpm:"tomcat-admin-webapps~7.0.42~5.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"tomcat-docs-webapp", rpm:"tomcat-docs-webapp~7.0.42~5.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"tomcat-el", rpm:"tomcat-el~2.2~api~7.0.42~5.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"tomcat-javadoc", rpm:"tomcat-javadoc~7.0.42~5.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"tomcat-jsp", rpm:"tomcat-jsp~2.2~api~7.0.42~5.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"tomcat-jsvc", rpm:"tomcat-jsvc~7.0.42~5.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"tomcat-lib", rpm:"tomcat-lib~7.0.42~5.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"tomcat-servlet", rpm:"tomcat-servlet~3.0~api~7.0.42~5.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"tomcat-webapps", rpm:"tomcat-webapps~7.0.42~5.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);


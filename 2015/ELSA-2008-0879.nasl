# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2008-0879.nasl 6553 2017-07-06 11:52:12Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.122554");
script_version("$Revision: 6553 $");
script_tag(name:"creation_date", value:"2015-10-08 14:47:52 +0300 (Thu, 08 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:52:12 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2008-0879");
script_tag(name: "insight", value: "ELSA-2008-0879 -  firefox security update - devhelp:[0.12-19]- Rebuild against xulrunnerfirefox:[3.0.2-3.0.1.el5]- Added firefox-oracle-default-prefs.js/firefox-oracle-default-bookmarks.html- Removed the corresponding files of Red Hat.- Added patch oracle-firefox-branding.patch- Update firstrun URL[3.0.2-3]- Update to Firefox 3.0.2 build 6[3.0.2-2]- Update to Firefox 3.0.2 build 4[3.0.2-1]- Update to Firefox 3.0.2[3.0.1-2]- Fixed #447535 - RHEL 5.2 beta / upstream Firefox 3 beta 5 autoConfig broken- Fixed #445304 - HTML/index.html always redirects to en-US/index.html parallel compiles and -debuginfo packagesnss:[3.12.1.1-1]- Update to NSS_3_12_1_RC2[3.12.1.0-1]- Update to NSS_3_12_1_RC1xulrunner:[1.9.0.2-5.0.1]- Added xulrunner-oracle-default-prefs.js- Remove its corresponding of Red Hat.[1.9.0.2-5]- Update to 1.9.0.2 build 6[1.9.0.2-4]- Fixed firefox dependency (#445391)[1.9.0.2-3]- Update to 1.9.0.2 build 4[1.9.0.2-2]- Fixed gecko version[1.9.0.2-1]- Update to 1.9.0.2[1.9.0.1-2]- Updated provided gecko versionyelp:[2.16.0-21]- rebuild against xulrunner"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2008-0879");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2008-0879.html");
script_cve_id("CVE-2008-3837","CVE-2008-4058","CVE-2008-4060","CVE-2008-4061","CVE-2008-4062","CVE-2008-4063","CVE-2008-4064","CVE-2008-4065","CVE-2008-4067","CVE-2008-4068");
script_tag(name:"cvss_base", value:"10.0");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
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
  if ((res = isrpmvuln(pkg:"devhelp", rpm:"devhelp~0.12~19.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"devhelp-devel", rpm:"devhelp-devel~0.12~19.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"firefox", rpm:"firefox~3.0.2~3.0.1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss", rpm:"nss~3.12.1.1~1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss-devel", rpm:"nss-devel~3.12.1.1~1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss-pkcs11-devel", rpm:"nss-pkcs11-devel~3.12.1.1~1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss-tools", rpm:"nss-tools~3.12.1.1~1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"xulrunner", rpm:"xulrunner~1.9.0.2~5.0.1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"xulrunner-devel", rpm:"xulrunner-devel~1.9.0.2~5.0.1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"xulrunner-devel-unstable", rpm:"xulrunner-devel-unstable~1.9.0.2~5.0.1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"yelp", rpm:"yelp~2.16.0~21.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);


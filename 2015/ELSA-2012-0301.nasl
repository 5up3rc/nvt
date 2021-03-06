# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2012-0301.nasl 6557 2017-07-06 11:55:33Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.123974");
script_version("$Revision: 6557 $");
script_tag(name:"creation_date", value:"2015-10-06 14:11:03 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:55:33 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2012-0301");
script_tag(name: "insight", value: "ELSA-2012-0301 -  ImageMagick security and bug fix update - [6.2.8.0-12.el5]- Add fix for CVE-2010-4167 (767142)[6.2.8.0-11.el5]Fix assertion failed when using 'identify -verbose' when theres no image information available (502626)[6.2.8.0-10.el5]Fix memory allocation failure when using color option (616538) Fix hang when converting broken GIF (693989) Fix conversion of rotated landscape PDF (694922)[6.2.8.0-9.el5]Fix a deadlock with semaphore (530592)[6.2.8.0-8.el5]- Fix page size argument parsing (580535)[6.2.8.0-7.el5]- Fix SGI image decoding (498063)[6.2.8.0-6.el5]- Add fix for CVE-2009-1882 (504305)[6.2.8.0-5.el5]- update quantum memory patch (necessary for CVE fixes)- backport functionality for SetImageExtent (necessary for CVE fixes)- Add patch for CVE-2008-1096 (#286411)- Add patch for CVE-2008-1097 (#285861)- update patch for CVE-2007-4986"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2012-0301");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2012-0301.html");
script_cve_id("CVE-2010-4167");
script_tag(name:"cvss_base", value:"6.9");
script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
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
  if ((res = isrpmvuln(pkg:"ImageMagick", rpm:"ImageMagick~6.2.8.0~12.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"ImageMagick-c++", rpm:"ImageMagick-c++~6.2.8.0~12.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"ImageMagick-c++-devel", rpm:"ImageMagick-c++-devel~6.2.8.0~12.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"ImageMagick-devel", rpm:"ImageMagick-devel~6.2.8.0~12.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"ImageMagick-perl", rpm:"ImageMagick-perl~6.2.8.0~12.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);


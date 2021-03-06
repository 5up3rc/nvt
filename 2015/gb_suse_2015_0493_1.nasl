###############################################################################
# OpenVAS Vulnerability Test
#
# SuSE Update for flash-player SUSE-SU-2015:0493-1 (flash-player)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.851104");
  script_version("$Revision: 6675 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-11 15:54:28 +0200 (Tue, 11 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-10-16 20:04:41 +0200 (Fri, 16 Oct 2015)");
  script_cve_id("CVE-2015-0332", "CVE-2015-0333", "CVE-2015-0334", "CVE-2015-0335", "CVE-2015-0336", "CVE-2015-0337", "CVE-2015-0338", "CVE-2015-0339", "CVE-2015-0340", "CVE-2015-0341", "CVE-2015-0342", "CVE-2016-0332");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for flash-player SUSE-SU-2015:0493-1 (flash-player)");
  script_tag(name: "summary", value: "Check the version of flash-player");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  flash-player has been updated to fix eleven security vulnerabilities:

  * Memory corruption vulnerabilities that could have lead to code
  execution (CVE-2016-0332, CVE-2015-0333, CVE-2015-0335,
  CVE-2015-0339).
  * Type confusion vulnerabilities that could have lead to code
  execution (CVE-2015-0334, CVE-2015-0336).
  * A vulnerability that could have lead to a cross-domain policy bypass
  (CVE-2015-0337).
  * A vulnerability that could have lead to a file upload restriction
  bypass (CVE-2015-0340).
  * An integer overflow vulnerability that could have lead to code
  execution (CVE-2015-0338).
  * Use-after-free vulnerabilities that could have lead to code
  execution (CVE-2015-0341, CVE-2015-0342).

  Security Issues:

  * CVE-2015-0332
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0332 
  * CVE-2015-0333
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0333 
  * CVE-2015-0334
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0334 
  * CVE-2015-0335
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0335 
  * CVE-2015-0336
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0336 
  * CVE-2015-0337
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0337 
  * CVE-2015-0338
  http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0338 
  * CVE-2015-0339
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0339 
  * CVE-2015-0340
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0340 
  * CVE-2015-0341
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0341 
  * CVE-2015-0342
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0342");
  script_tag(name: "affected", value: "flash-player on SUSE Linux Enterprise Desktop 11 SP3");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "SUSE-SU", value: "2015:0493_1");
  script_xref(name: "URL" , value: "http://lists.opensuse.org/opensuse-security-announce/2015-03/msg00016.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "SLED11.0SP3")
{

  if ((res = isrpmvuln(pkg:"flash-player", rpm:"flash-player~11.2.202.451~0.3.1", rls:"SLED11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"flash-player-gnome", rpm:"flash-player-gnome~11.2.202.451~0.3.1", rls:"SLED11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"flash-player-kde4", rpm:"flash-player-kde4~11.2.202.451~0.3.1", rls:"SLED11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

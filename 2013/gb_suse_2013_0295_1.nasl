###############################################################################
# OpenVAS Vulnerability Test
#
# SuSE Update for flash-player openSUSE-SU-2013:0295-1 (flash-player)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

include("revisions-lib.inc");
tag_insight = "Adobe Flash Player was updated to 11.2.202.270:
  (bnc#803485)

  * APSB13-05, CVE-2013-1372, CVE-2013-0645, CVE-2013-1373,
  CVE-2013-1369, CVE-2013-1370, CVE-2013-1366,
  CVE-2013-0649, CVE-2013-1365, CVE-2013-1374,
  CVE-2013-1368, CVE-2013-0642, CVE-2013-0644,
  CVE-2013-0647, CVE-2013-1367, CVE-2013-0639,
  CVE-2013-0638, CVE-2013-0637


  More information can be found on:
  http://www.adobe.com/support/security/bulletins/apsb13-05.html";


tag_affected = "flash-player on openSUSE 12.1";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.opensuse.org/opensuse-security-announce/2013-02/msg00009.html");
  script_id(850398);
  script_version("$Revision: 6673 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-11 15:45:02 +0200 (Tue, 11 Jul 2017) $");
  script_tag(name:"creation_date", value:"2013-03-11 18:29:49 +0530 (Mon, 11 Mar 2013)");
  script_cve_id("CVE-2013-0637", "CVE-2013-0638", "CVE-2013-0639", "CVE-2013-0642",
                "CVE-2013-0644", "CVE-2013-0645", "CVE-2013-0647", "CVE-2013-0649",
                "CVE-2013-1365", "CVE-2013-1366", "CVE-2013-1367", "CVE-2013-1368",
                "CVE-2013-1369", "CVE-2013-1370", "CVE-2013-1372", "CVE-2013-1373",
                "CVE-2013-1374");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name: "openSUSE-SU", value: "2013:0295_1");
  script_name("SuSE Update for flash-player openSUSE-SU-2013:0295-1 (flash-player)");

  script_summary("Check for the Version of flash-player");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "openSUSE12.1")
{

  if ((res = isrpmvuln(pkg:"flash-player", rpm:"flash-player~11.2.202.270~50.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"flash-player-gnome", rpm:"flash-player-gnome~11.2.202.270~50.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"flash-player-kde4", rpm:"flash-player-kde4~11.2.202.270~50.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

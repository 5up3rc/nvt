###############################################################################
# OpenVAS Vulnerability Test
#
# SuSE Update for pidgin-otr SUSE-SU-2016:0912-1 (pidgin-otr)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.851263");
  script_version("$Revision: 6676 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-11 15:56:06 +0200 (Tue, 11 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-04-11 12:47:07 +0530 (Mon, 11 Apr 2016)");
  script_cve_id("CVE-2015-8833");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for pidgin-otr SUSE-SU-2016:0912-1 (pidgin-otr)");
  script_tag(name: "summary", value: "Check the version of pidgin-otr");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  This update for pidgin-otr fixes the following issues:

  - CVE-2015-8833: A heap based use-after-free issue was fixed in pidgin-otr
  that could lead to crashes or potential code execution.");
  script_tag(name: "affected", value: "pidgin-otr on SUSE Linux Enterprise Desktop 12");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "SUSE-SU", value: "2016:0912_1");
  script_xref(name: "URL" , value: "http://lists.opensuse.org/opensuse-security-announce/2016-03/msg00095.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
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

if(release == "SLED12.0SP0")
{

  if ((res = isrpmvuln(pkg:"pidgin-otr", rpm:"pidgin-otr~4.0.0~8.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pidgin-otr-debuginfo", rpm:"pidgin-otr-debuginfo~4.0.0~8.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pidgin-otr-debugsource", rpm:"pidgin-otr-debugsource~4.0.0~8.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

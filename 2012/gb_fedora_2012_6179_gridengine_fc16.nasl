###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for gridengine FEDORA-2012-6179
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_insight = "In a typical network that does not have distributed resource management
  software, workstations and servers are used from 5% to 20% of the time.
  Even technical servers are generally less than fully utilized. This
  means that there are a lot of cycles that can be used productively if
  only users know where they are, can capture them, and put them to work.

  Grid Engine finds a pool of idle resources and harnesses it
  productively, so an organization gets as much as five to ten times the
  usable power out of systems on the network. That can increase utilization
  to as much as 98%.

  Grid Engine software aggregates available compute resources and
  delivers compute power as a network service.

  These are the local files shared by both the qmaster and execd
  daemons. You must install this package in order to use any one of them.";

tag_affected = "gridengine on Fedora 16";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.fedoraproject.org/pipermail/package-announce/2012-April/079242.html");
  script_id(864183);
  script_version("$Revision: 6627 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:31:14 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-04-30 11:07:55 +0530 (Mon, 30 Apr 2012)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_xref(name: "FEDORA", value: "2012-6179");
  script_name("Fedora Update for gridengine FEDORA-2012-6179");

  script_summary("Check for the Version of gridengine");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
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

if(release == "FC16")
{

  if ((res = isrpmvuln(pkg:"gridengine", rpm:"gridengine~6.2u5p2~7.fc16.3", rls:"FC16")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

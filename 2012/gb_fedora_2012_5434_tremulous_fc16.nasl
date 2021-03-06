###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for tremulous FEDORA-2012-5434
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
tag_insight = "Tremulous is a free, open source game that blends a team based FPS with elements
  of an RTS. Players can choose from 2 unique races, aliens and humans.
  Players on both teams are able to build working structures in-game like an RTS.
  These structures provide many functions, the most important being spawning.
  The designated builders must ensure there are spawn structures or other players
   will not be able to rejoin the game after death. Other structures provide
  automated base defense (to some degree), healing functions and much more...

  Player advancement is different depending on which team you are on.
  As a human, players are rewarded with credits for each alien kill.
  These credits may be used to purchase new weapons and upgrades from the Armoury
  The alien team advances quite differently. Upon killing a human foe,
  the alien is able to evolve into a new class. The more kills gained the more
  powerful the classes available.

  The overall objective behind Tremulous is to eliminate the opposing team.
  This is achieved by not only killing the opposing players but also
  removing their ability to respawn by destroying their spawn structures.";

tag_affected = "tremulous on Fedora 16";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.fedoraproject.org/pipermail/package-announce/2012-April/078387.html");
  script_id(864162);
  script_version("$Revision: 6627 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:31:14 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-04-20 10:20:25 +0530 (Fri, 20 Apr 2012)");
  script_cve_id("CVE-2010-5077", "CVE-2011-2764", "CVE-2011-3012");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name: "FEDORA", value: "2012-5434");
  script_name("Fedora Update for tremulous FEDORA-2012-5434");

  script_summary("Check for the Version of tremulous");
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

  if ((res = isrpmvuln(pkg:"tremulous", rpm:"tremulous~1.2.0~0.5.beta1.fc16", rls:"FC16")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

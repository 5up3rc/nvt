###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for trytond FEDORA-2012-4988
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
tag_insight = "Tryton is a three-tiers high-level general purpose application framework
  written in Python and use PostgreSQL as database engine. It is the core base
  of an Open Source ERP. It provides modularity, scalability and security.

  The core of Tryton (also called Tryton kernel) provides all the necessary
  functionalities for a complete application framework: data persistence (i.e
  an ORM with extensive modularity), users management (authentication, fine
  grained control for data access, handling of concurrent access of resources),
  workflow and report engines, web services and internationalisation. Thus
  constituting a complete application platform which can be used for any
  relevant purpose.";

tag_affected = "trytond on Fedora 15";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.fedoraproject.org/pipermail/package-announce/2012-April/077034.html");
  script_id(864148);
  script_tag(name:"cvss_base", value:"5.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:P/A:P");
 script_version("$Revision: 6627 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:31:14 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-04-11 10:51:14 +0530 (Wed, 11 Apr 2012)");
  script_cve_id("CVE-2012-0215");
  script_xref(name: "FEDORA", value: "2012-4988");
  script_name("Fedora Update for trytond FEDORA-2012-4988");

  script_summary("Check for the Version of trytond");
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

if(release == "FC15")
{

  if ((res = isrpmvuln(pkg:"trytond", rpm:"trytond~1.8.6~1.fc15", rls:"FC15")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

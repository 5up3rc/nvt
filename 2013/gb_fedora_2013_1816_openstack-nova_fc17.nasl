###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for openstack-nova FEDORA-2013-1816
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

tag_affected = "openstack-nova on Fedora 17";
tag_insight = "OpenStack Compute (codename Nova) is open source software designed to
  provision and manage large networks of virtual machines, creating a
  redundant and scalable cloud computing platform. It gives you the
  software, control panels, and APIs required to orchestrate a cloud,
  including running instances, managing networks, and controlling access
  through users and projects. OpenStack Compute strives to be both
  hardware and hypervisor agnostic, currently supporting a variety of
  standard hardware configurations and seven major hypervisors.";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.fedoraproject.org/pipermail/package-announce/2013-February/098569.html");
  script_id(865334);
  script_version("$Revision: 6628 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:32:47 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2013-02-11 10:10:34 +0530 (Mon, 11 Feb 2013)");
  script_cve_id("CVE-2013-0208", "CVE-2012-3447", "CVE-2012-3371", "CVE-2012-3360",
               "CVE-2012-3361", "CVE-2012-2654");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");
  script_xref(name: "FEDORA", value: "2013-1816");
  script_name("Fedora Update for openstack-nova FEDORA-2013-1816");

  script_summary("Check for the Version of openstack-nova");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
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

if(release == "FC17")
{

  if ((res = isrpmvuln(pkg:"openstack-nova", rpm:"openstack-nova~2012.1.3~3.fc17", rls:"FC17")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for klettres FEDORA-2013-10130
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

tag_solution = "Please Install the Updated Packages.";
tag_insight = "KLettres aims to help to learn the alphabet and then to read some
  syllables in different languages.  It is meant to help learning the
  very first sounds of a new language, for children or for adults.";
tag_affected = "klettres on Fedora 18";


if(description)
{
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_id(865737);
  script_version("$Revision: 6628 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:32:47 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2013-06-13 10:01:45 +0530 (Thu, 13 Jun 2013)");
  script_cve_id("CVE-2013-2120");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_name("Fedora Update for klettres FEDORA-2013-10130");

  script_xref(name: "FEDORA", value: "2013-10130");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2013-June/108582.html");
  script_summary("Check for the Version of klettres");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC18")
{

  if ((res = isrpmvuln(pkg:"klettres", rpm:"klettres~4.10.4~1.fc18", rls:"FC18")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

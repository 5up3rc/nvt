###############################################################################
# OpenVAS Vulnerability Test
#
# Mandriva Update for systemtap MDVSA-2011:154 (systemtap)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_insight = "A vulnerability has been discovered and corrected in systemtap:

  SystemTap 1.4 and earlier, when unprivileged (aka stapusr)
  mode is enabled, allows local users to cause a denial of service
  (divide-by-zero error and OOPS) via a crafted ELF program with DWARF
  expressions that are not properly handled by a stap script that
  performs context variable access (CVE-2011-1769).
  
  The updated packages have been patched to correct this issue.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "systemtap on Mandriva Linux 2010.1,
  Mandriva Linux 2010.1/X86_64";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.mandriva.com/security-announce/2011-10/msg00029.php");
  script_id(831475);
  script_version("$Revision: 6570 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-06 15:06:35 +0200 (Thu, 06 Jul 2017) $");
  script_tag(name:"creation_date", value:"2011-10-21 16:31:29 +0200 (Fri, 21 Oct 2011)");
  script_tag(name:"cvss_base", value:"1.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:N/C:N/I:N/A:P");
  script_xref(name: "MDVSA", value: "2011:154");
  script_cve_id("CVE-2011-1769");
  script_name("Mandriva Update for systemtap MDVSA-2011:154 (systemtap)");

  script_summary("Check for the Version of systemtap");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Mandrake Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/mandriva_mandrake_linux", "ssh/login/release");
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

if(release == "MNDK_2010.1")
{

  if ((res = isrpmvuln(pkg:"systemtap", rpm:"systemtap~1.2~1.1mdv2010.2", rls:"MNDK_2010.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

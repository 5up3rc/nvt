###############################################################################
# OpenVAS Vulnerability Test
#
# SuSE Update for horde openSUSE-SU-2012:0287-1 (horde)
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
tag_affected = "horde on openSUSE 11.4";
tag_insight = "This version upgrade of horde3-dimp to 4.3.11 fixes several
  issues (including security related flaws, CVE-2012-0791)
  and adds new features.";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://195.135.221.135/opensuse-security-announce/2012-02/msg00018.html");
  script_id(850256);
  script_version("$Revision: 6672 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-11 15:43:53 +0200 (Tue, 11 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-08-02 23:01:29 +0530 (Thu, 02 Aug 2012)");
  script_cve_id("CVE-2012-0791");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_xref(name: "openSUSE-SU", value: "2012:0287_1");
  script_name("SuSE Update for horde openSUSE-SU-2012:0287-1 (horde)");

  script_summary("Check for the Version of horde");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
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

if(release == "openSUSE11.4")
{

  if ((res = isrpmvuln(pkg:"horde3-dimp", rpm:"horde3-dimp~1.1.8~0.3.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"horde3-imp", rpm:"horde3-imp~4.3.11~0.3.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

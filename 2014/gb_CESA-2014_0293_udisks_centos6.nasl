###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for udisks CESA-2014:0293 centos6 
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_id(881899);
  script_version("$Revision: 6656 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:49:38 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-03-17 13:12:30 +0530 (Mon, 17 Mar 2014)");
  script_cve_id("CVE-2014-0004");
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_name("CentOS Update for udisks CESA-2014:0293 centos6 ");

  tag_insight = "The udisks package provides a daemon, a D-Bus API, and command line
utilities for managing disks and storage devices.

A stack-based buffer overflow flaw was found in the way udisks handled
files with long path names. A malicious, local user could use this flaw to
create a specially crafted directory structure that, when processed by the
udisks daemon, could lead to arbitrary code execution with the privileges
of the udisks daemon (root). (CVE-2014-0004)

This issue was discovered by Florian Weimer of the Red Hat Product
Security Team.

All udisks users are advised to upgrade to these updated packages, which
contain a backported patch to correct this issue.
";

  tag_affected = "udisks on CentOS 6";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "CESA", value: "2014:0293");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2014-March/020200.html");
  script_summary("Check for the Version of udisks");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"udisks", rpm:"udisks~1.0.1~7.el6_5", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"udisks-devel", rpm:"udisks-devel~1.0.1~7.el6_5", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"udisks-devel-docs", rpm:"udisks-devel-docs~1.0.1~7.el6_5", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
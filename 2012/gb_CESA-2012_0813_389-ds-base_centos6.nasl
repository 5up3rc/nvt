###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for 389-ds-base CESA-2012:0813 centos6 
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

tag_insight = "The 389 Directory Server is an LDAPv3 compliant server. The base packages
  include the Lightweight Directory Access Protocol (LDAP) server and
  command-line utilities for server administration.

  A flaw was found in the way the 389 Directory Server daemon (ns-slapd)
  handled access control instructions (ACIs) using certificate groups. If an
  LDAP user that had a certificate group defined attempted to bind to the
  directory server, it would cause ns-slapd to enter an infinite loop and
  consume an excessive amount of CPU time. (CVE-2012-0833)
  
  Red Hat would like to thank Graham Leggett for reporting this issue.
  
  These updated 389-ds-base packages also include numerous bug fixes and
  enhancements. Space precludes documenting all of these changes in this
  advisory. Users are directed to the Red Hat Enterprise Linux 6.3 Technical
  Notes for information on the most significant of these changes.
  
  Users are advised to upgrade to these updated 389-ds-base packages, which
  resolve these issues and add these enhancements. After installing this
  update, the 389 server service will be restarted automatically.";

tag_affected = "389-ds-base on CentOS 6";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2012-July/018714.html");
  script_id(881209);
  script_version("$Revision: 6654 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:48:17 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-07-30 16:46:00 +0530 (Mon, 30 Jul 2012)");
  script_cve_id("CVE-2012-0833");
  script_tag(name:"cvss_base", value:"2.3");
  script_tag(name:"cvss_base_vector", value:"AV:A/AC:M/Au:S/C:N/I:N/A:P");
  script_xref(name: "CESA", value: "2012:0813");
  script_name("CentOS Update for 389-ds-base CESA-2012:0813 centos6 ");

  script_summary("Check for the Version of 389-ds-base");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"389-ds-base", rpm:"389-ds-base~1.2.10.2~15.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"389-ds-base-devel", rpm:"389-ds-base-devel~1.2.10.2~15.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"389-ds-base-libs", rpm:"389-ds-base-libs~1.2.10.2~15.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for squid RHSA-2011:0545-01
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
tag_insight = "Squid is a high-performance proxy caching server for web clients,
  supporting FTP, Gopher, and HTTP data objects.

  It was found that string comparison functions in Squid did not properly
  handle the comparisons of NULL and empty strings. A remote, trusted web
  client could use this flaw to cause the squid daemon to crash via a
  specially-crafted request. (CVE-2010-3072)

  This update also fixes the following bugs:

  * A small memory leak in Squid caused multiple &quot;ctx: enter level&quot; messages
  to be logged to &quot;/var/log/squid/cache.log&quot;. This update resolves the memory
  leak. (BZ#666533)

  * This erratum upgrades Squid to upstream version 3.1.10. This upgraded
  version supports the Google Instant service and introduces various code
  improvements. (BZ#639365)

  Users of squid should upgrade to this updated package, which resolves these
  issues. After installing this update, the squid service will be restarted
  automatically.";

tag_affected = "squid on Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2011-May/msg00015.html");
  script_id(870666);
  script_version("$Revision: 6686 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-12 11:46:01 +0200 (Wed, 12 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-06-06 10:44:53 +0530 (Wed, 06 Jun 2012)");
  script_cve_id("CVE-2010-3072");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_xref(name: "RHSA", value: "2011:0545-01");
  script_name("RedHat Update for squid RHSA-2011:0545-01");

  script_summary("Check for the Version of squid");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms");
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

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"squid", rpm:"squid~3.1.10~1.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"squid-debuginfo", rpm:"squid-debuginfo~3.1.10~1.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

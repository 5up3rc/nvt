###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for bind RHSA-2011:0845-01
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
tag_insight = "The Berkeley Internet Name Domain (BIND) is an implementation of the Domain
  Name System (DNS) protocols. BIND includes a DNS server (named); a resolver
  library (routines for applications to use when interfacing with DNS); and
  tools for verifying that the DNS server is operating correctly.

  An off-by-one flaw was found in the way BIND processed negative responses
  with large resource record sets (RRSets). An attacker able to send
  recursive queries to a BIND server that is configured as a caching
  resolver could use this flaw to cause named to exit with an assertion
  failure. (CVE-2011-1910)
  
  All BIND users are advised to upgrade to these updated packages, which
  resolve this issue. After installing the update, the BIND daemon (named)
  will be restarted automatically.";

tag_affected = "bind on Red Hat Enterprise Linux (v. 5 server)";
tag_solution = "Please Install the Updated Packages.";


if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2011-May/msg00036.html");
  script_id(870441);
  script_version("$Revision: 6685 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-12 11:44:46 +0200 (Wed, 12 Jul 2017) $");
  script_tag(name:"creation_date", value:"2011-06-06 16:56:27 +0200 (Mon, 06 Jun 2011)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_xref(name: "RHSA", value: "2011:0845-01");
  script_cve_id("CVE-2011-1910");
  script_name("RedHat Update for bind RHSA-2011:0845-01");

  script_summary("Check for the Version of bind");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
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

if(release == "RHENT_5")
{

  if ((res = isrpmvuln(pkg:"bind97", rpm:"bind97~9.7.0~6.P2.el5_6.2", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bind97-chroot", rpm:"bind97-chroot~9.7.0~6.P2.el5_6.2", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bind97-debuginfo", rpm:"bind97-debuginfo~9.7.0~6.P2.el5_6.2", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bind97-devel", rpm:"bind97-devel~9.7.0~6.P2.el5_6.2", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bind97-libs", rpm:"bind97-libs~9.7.0~6.P2.el5_6.2", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bind97-utils", rpm:"bind97-utils~9.7.0~6.P2.el5_6.2", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for postgresql-9.1 USN-2120-1
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
  script_id(841727);
  script_version("$Revision: 6645 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:02:37 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-02-25 16:53:04 +0530 (Tue, 25 Feb 2014)");
  script_cve_id("CVE-2014-0060", "CVE-2014-0061", "CVE-2014-0062", "CVE-2014-0063",
                "CVE-2014-0064", "CVE-2014-0065", "CVE-2014-0066");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");
  script_name("Ubuntu Update for postgresql-9.1 USN-2120-1");

  tag_insight = "Noah Misch and Jonas Sundman discovered that PostgreSQL did
not correctly enforce ADMIN OPTION restrictions. An authenticated attacker
could use this issue to possibly revoke access from others, contrary to
expected permissions. (CVE-2014-0060)

Andres Freund discovered that PostgreSQL incorrectly handled validator
functions. An authenticated attacker could possibly use this issue to
escalate their privileges. (CVE-2014-0061)

Andres Freund discovered that PostgreSQL incorrectly handled concurrent
CREATE INDEX statements. An authenticated attacker could possibly use this
issue to obtain access to restricted data, bypassing intended privileges.
(CVE-2014-0062)

Daniel Sch&#252 ssler discovered that PostgreSQL incorrectly handled datetime
input. An authenticated attacker could possibly use this issue to cause
PostgreSQL to crash, resulting in a denial of service, or possibly execute
arbitrary code. (CVE-2014-0063)

It was discovered that PostgreSQL incorrectly handled certain size
calculations. An authenticated attacker could possibly use this issue to
cause PostgreSQL to crash, resulting in a denial of service, or possibly
execute arbitrary code. (CVE-2014-0064)

Peter Eisentraut and Jozef Mlich discovered that PostgreSQL incorrectly
handled certain buffer sizes. An authenticated attacker could possibly use
this issue to cause PostgreSQL to crash, resulting in a denial of service,
or possibly execute arbitrary code. (CVE-2014-0065)

Honza Horak discovered that PostgreSQL incorrectly used the crypt() library
function. This issue could possibly cause PostgreSQL to crash, resulting in
a denial of service (CVE-2014-0066)";

  tag_affected = "postgresql-9.1 on Ubuntu 13.10 ,
  Ubuntu 12.10 ,
  Ubuntu 12.04 LTS ,
  Ubuntu 10.04 LTS";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "USN", value: "2120-1");
  script_xref(name: "URL" , value: "https://lists.ubuntu.com/archives/ubuntu-security-announce/2014-February/002414.html");
  script_summary("Check for the Version of postgresql-9.1");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages");
  exit(0);
}


include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"postgresql-9.1", ver:"9.1.12-0ubuntu0.12.04", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU10.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"postgresql-8.4", ver:"8.4.20-0ubuntu010.04", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU13.10")
{

  if ((res = isdpkgvuln(pkg:"postgresql-9.1", ver:"9.1.12-0ubuntu0.13.10", rls:"UBUNTU13.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU12.10")
{

  if ((res = isdpkgvuln(pkg:"postgresql-9.1", ver:"9.1.12-0ubuntu0.12.10", rls:"UBUNTU12.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

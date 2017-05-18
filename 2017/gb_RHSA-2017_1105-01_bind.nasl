###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for bind RHSA-2017:1105-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.871804");
  script_version("$Revision: 6003 $");
  script_tag(name:"last_modification", value:"$Date: 2017-04-21 14:25:10 +0200 (Fri, 21 Apr 2017) $");
  script_tag(name:"creation_date", value:"2017-04-21 06:38:18 +0200 (Fri, 21 Apr 2017)");
  script_cve_id("CVE-2017-3136", "CVE-2017-3137");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for bind RHSA-2017:1105-01");
  script_tag(name: "summary", value: "Check the version of bind");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The Berkeley Internet Name Domain (BIND)
  is an implementation of the Domain Name System (DNS) protocols. BIND includes
  a DNS server (named)  a resolver library (routines for applications to use when
  interfacing with DNS)  and tools for verifying that the DNS server is operating
  correctly.

Security Fix(es):

* A denial of service flaw was found in the way BIND handled a query
response containing CNAME or DNAME resource records in an unusual order. A
remote attacker could use this flaw to make named exit unexpectedly with an
assertion failure via a specially crafted DNS response. (CVE-2017-3137)

* A denial of service flaw was found in the way BIND handled query requests
when using DNS64 with 'break-dnssec yes' option. A remote attacker could
use this flaw to make named exit unexpectedly with an assertion failure via
a specially crafted DNS request. (CVE-2017-3136)

Red Hat would like to thank ISC for reporting these issues. Upstream
acknowledges Oleg Gorokhov (Yandex) as the original reporter of
CVE-2017-3136.
");
  script_tag(name: "affected", value: "bind on
  Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "RHSA", value: "2017:1105-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2017-April/msg00047.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("HostDetails/OS/cpe:/o:redhat:enterprise_linux", "login/SSH/success", "ssh/login/release");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"bind", rpm:"bind~9.8.2~0.62.rc1.el6_9.1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bind-chroot", rpm:"bind-chroot~9.8.2~0.62.rc1.el6_9.1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bind-debuginfo", rpm:"bind-debuginfo~9.8.2~0.62.rc1.el6_9.1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bind-libs", rpm:"bind-libs~9.8.2~0.62.rc1.el6_9.1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bind-utils", rpm:"bind-utils~9.8.2~0.62.rc1.el6_9.1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
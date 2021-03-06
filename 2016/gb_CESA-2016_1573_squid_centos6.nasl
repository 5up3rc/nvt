###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for squid CESA-2016:1573 centos6 
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.882538");
  script_version("$Revision: 6658 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:51:48 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-08-08 15:12:00 +0530 (Mon, 08 Aug 2016)");
  script_cve_id("CVE-2016-5408", "CVE-2016-4051");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for squid CESA-2016:1573 centos6 ");
  script_tag(name: "summary", value: "Check the version of squid");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Squid is a high-performance proxy caching 
server for web clients, supporting FTP, Gopher, and HTTP data objects.

Security Fix(es):

* It was found that the fix for CVE-2016-4051 released via RHSA-2016:1138
did not properly prevent the stack overflow in the munge_other_line()
function. A remote attacker could send specially crafted data to the Squid
proxy, which would exploit the cachemgr CGI utility, possibly triggering
execution of arbitrary code. (CVE-2016-5408)

Red Hat would like to thank Amos Jeffries (Squid) for reporting this issue.
");
  script_tag(name: "affected", value: "squid on CentOS 6");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2016:1573");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2016-August/022029.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
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

  if ((res = isrpmvuln(pkg:"squid", rpm:"squid~3.1.23~16.el6_8.6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

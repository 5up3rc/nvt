###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for valgrind USN-3337-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.843223");
  script_version("$Revision: 6648 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:05:27 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2017-06-22 07:12:36 +0200 (Thu, 22 Jun 2017)");
  script_cve_id("CVE-2016-2226", "CVE-2016-4487", "CVE-2016-4488", "CVE-2016-4489", 
                "CVE-2016-4490", "CVE-2016-4491", "CVE-2016-4492", "CVE-2016-4493", 
                "CVE-2016-6131"); 
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for valgrind USN-3337-1");
  script_tag(name: "summary", value: "Check the version of valgrind");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of 
  detect NVT and check if the version is vulnerable or not."); 
  script_tag(name: "insight", value: "It was discovered that Valgrind incorrectly 
  handled certain string operations. If a user or automated system were tricked 
  into processing a specially crafted binary, a remote attacker could possibly 
  execute arbitrary code. This issue only affected Ubuntu 14.04 LTS, Ubuntu 16.04 
  LTS and Ubuntu 16.10. (CVE-2016-2226) It was discovered that Valgrind 
  incorrectly handled parsing certain binaries. If a user or automated system were 
  tricked into processing a specially crafted binary, a remote attacker could use 
  this issue to cause Valgrind to crash, resulting in a denial of service. 
  (CVE-2016-4487, CVE-2016-4488, CVE-2016-4489, CVE-2016-4490, CVE-2016-4491, 
  CVE-2016-4492, CVE-2016-4493, CVE-2016-6131)"); 
  script_tag(name: "affected", value: "valgrind on Ubuntu 17.04 ,
  Ubuntu 16.10 ,
  Ubuntu 16.04 LTS ,
  Ubuntu 14.04 LTS");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "USN", value: "3337-1");
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-3337-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"valgrind", ver:"1:3.10.1-1ubuntu3~14.5", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU17.04")
{

  if ((res = isdpkgvuln(pkg:"valgrind", ver:"1:3.12.0-1ubuntu1.1", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU16.10")
{

  if ((res = isdpkgvuln(pkg:"valgrind", ver:"1:3.12.0~svn20160714-1ubuntu2.1", rls:"UBUNTU16.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"valgrind", ver:"1:3.11.0-1ubuntu4.2", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

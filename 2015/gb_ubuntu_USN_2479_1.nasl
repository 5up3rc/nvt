###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for rpm USN-2479-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.842056");
  script_version("$Revision: 6646 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:03:11 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-01-23 12:58:40 +0100 (Fri, 23 Jan 2015)");
  script_cve_id("CVE-2013-6435", "CVE-2014-8118");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Ubuntu Update for rpm USN-2479-1");
  script_tag(name: "summary", value: "Check the version of rpm");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of
detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Florian Weimer discovered that RPM incorrectly
handled temporary files. A local attacker could use this issue to execute arbitrary
code. (CVE-2013-6435)

Florian Weimer discovered that RPM incorrectly handled certain CPIO
headers. If a user or automated system were tricked into installing a
malicious package file, a remote attacker could use this issue to cause RPM
to crash, resulting in a denial of service, or possibly execute arbitrary
code. (CVE-2014-8118)");
  script_tag(name: "affected", value: "rpm on Ubuntu 14.10 ,
  Ubuntu 14.04 LTS ,
  Ubuntu 12.04 LTS");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "USN", value: "2479-1");
  script_xref(name: "URL" , value: "https://lists.ubuntu.com/archives/ubuntu-security-announce/2015-January/002802.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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

if(release == "UBUNTU14.10")
{

  if ((res = isdpkgvuln(pkg:"rpm", ver:"4.11.2-3ubuntu0.1", rls:"UBUNTU14.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"rpm", ver:"4.11.1-3ubuntu0.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"rpm", ver:"4.9.1.1-1ubuntu0.3", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

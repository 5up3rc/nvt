###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3393_1.nasl 6990 2017-08-23 08:40:32Z asteins $
#
# Ubuntu Update for clamav USN-3393-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.843290");
  script_version("$Revision: 6990 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-23 10:40:32 +0200 (Wed, 23 Aug 2017) $");
  script_tag(name:"creation_date", value:"2017-08-18 07:33:56 +0200 (Fri, 18 Aug 2017)");
  script_cve_id("CVE-2017-6418", "CVE-2017-6419", "CVE-2017-6420");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for clamav USN-3393-1");
  script_tag(name: "summary", value: "Check the version of clamav");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of 
  detect NVT and check if the version is vulnerable or not."); 
  script_tag(name: "insight", value: "It was discovered that ClamAV incorrectly 
  handled parsing certain e-mail messages. A remote attacker could possibly use 
  this issue to cause ClamAV to crash, resulting in a denial of service. 
  (CVE-2017-6418) It was discovered that ClamAV incorrectly handled certain 
  malformed CHM files. A remote attacker could use this issue to cause ClamAV to 
  crash, resulting in a denial of service, or possibly execute arbitrary code. 
  This issue only affected Ubuntu 14.04 LTS. In the default installation, 
  attackers would be isolated by the ClamAV AppArmor profile. (CVE-2017-6419) It 
  was discovered that ClamAV incorrectly handled parsing certain PE files with 
  WWPack compression. A remote attacker could possibly use this issue to cause 
  ClamAV to crash, resulting in a denial of service. (CVE-2017-6420)"); 
  script_tag(name: "affected", value: "clamav on Ubuntu 17.04 ,
  Ubuntu 16.04 LTS ,
  Ubuntu 14.04 LTS");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "USN", value: "3393-1");
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-3393-1/");
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

  if ((res = isdpkgvuln(pkg:"clamav", ver:"0.99.2+addedllvm-0ubuntu0.14.04.2", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU17.04")
{

  if ((res = isdpkgvuln(pkg:"clamav", ver:"0.99.2+dfsg-6ubuntu0.1", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"clamav", ver:"0.99.2+dfsg-0ubuntu0.16.04.2", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

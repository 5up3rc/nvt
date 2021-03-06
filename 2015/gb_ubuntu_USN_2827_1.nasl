###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for openjdk-6 USN-2827-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.842548");
  script_version("$Revision: 6646 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:03:11 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-12-04 06:12:57 +0100 (Fri, 04 Dec 2015)");
  script_cve_id("CVE-2015-4805", "CVE-2015-4835", "CVE-2015-4843", "CVE-2015-4844",
                "CVE-2015-4860", "CVE-2015-4881", "CVE-2015-4883", "CVE-2015-4806",
                "CVE-2015-4872", "CVE-2015-4734", "CVE-2015-4842", "CVE-2015-4903",
                "CVE-2015-4803", "CVE-2015-4893", "CVE-2015-4911", "CVE-2015-4882");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for openjdk-6 USN-2827-1");
  script_tag(name: "summary", value: "Check the version of openjdk-6");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of
detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Multiple vulnerabilities were discovered in
the OpenJDK JRE related to information disclosure, data integrity and availability.
An attacker could exploit these to cause a denial of service or expose sensitive
data over the network. (CVE-2015-4805, CVE-2015-4835, CVE-2015-4843,
CVE-2015-4844, CVE-2015-4860, CVE-2015-4881, CVE-2015-4883)

A vulnerability was discovered in the OpenJDK JRE related to
information disclosure and data integrity. An attacker could exploit
this to expose sensitive data over the network. (CVE-2015-4806)

A vulnerability was discovered in the OpenJDK JRE related to data
integrity. An attacker could exploit this expose sensitive data over
the network. (CVE-2015-4872)

Multiple vulnerabilities were discovered in the OpenJDK JRE related
to information disclosure. An attacker could exploit these to expose
sensitive data over the network. (CVE-2015-4734, CVE-2015-4842,
CVE-2015-4903)

Multiple vulnerabilities were discovered in the OpenJDK JRE related
to availability. An attacker could exploit these to cause a denial of
service. (CVE-2015-4803, CVE-2015-4893, CVE-2015-4911)");
  script_tag(name: "affected", value: "openjdk-6 on Ubuntu 12.04 LTS");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "USN", value: "2827-1");
  script_xref(name: "URL" , value: "https://lists.ubuntu.com/archives/ubuntu-security-announce/2015-December/003207.html");
  script_tag(name:"solution_type", value:"VendorFix");
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

if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"icedtea-6-jre-cacao", ver:"6b37-1.13.9-1ubuntu0.12.04.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"icedtea-6-jre-jamvm", ver:"6b37-1.13.9-1ubuntu0.12.04.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-6-jre", ver:"6b37-1.13.9-1ubuntu0.12.04.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-6-jre-headless", ver:"6b37-1.13.9-1ubuntu0.12.04.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-6-jre-lib", ver:"6b37-1.13.9-1ubuntu0.12.04.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-6-jre-zero", ver:"6b37-1.13.9-1ubuntu0.12.04.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

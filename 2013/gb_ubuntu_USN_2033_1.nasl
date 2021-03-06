###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for openjdk-6 USN-2033-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_id(841636);
  script_version("$Revision: 6644 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:01:20 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2013-11-26 11:26:48 +0530 (Tue, 26 Nov 2013)");
  script_cve_id("CVE-2013-3829", "CVE-2013-5783", "CVE-2013-5804", "CVE-2013-4002",
                "CVE-2013-5803", "CVE-2013-5823", "CVE-2013-5825", "CVE-2013-5772",
                "CVE-2013-5774", "CVE-2013-5784", "CVE-2013-5797", "CVE-2013-5820",
                "CVE-2013-5778", "CVE-2013-5780", "CVE-2013-5790", "CVE-2013-5840",
                "CVE-2013-5849", "CVE-2013-5851", "CVE-2013-5782", "CVE-2013-5802",
                "CVE-2013-5809", "CVE-2013-5829", "CVE-2013-5814", "CVE-2013-5817",
                "CVE-2013-5830", "CVE-2013-5842", "CVE-2013-5850");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Ubuntu Update for openjdk-6 USN-2033-1");

  tag_insight = "Several vulnerabilities were discovered in the OpenJDK JRE
related to information disclosure and data integrity. An attacker could
exploit these to expose sensitive data over the network. (CVE-2013-3829,
CVE-2013-5783, CVE-2013-5804)

Several vulnerabilities were discovered in the OpenJDK JRE related to
availability. An attacker could exploit these to cause a denial of service.
(CVE-2013-4002, CVE-2013-5803, CVE-2013-5823, CVE-2013-5825)

Several vulnerabilities were discovered in the OpenJDK JRE related to data
integrity. (CVE-2013-5772, CVE-2013-5774, CVE-2013-5784, CVE-2013-5797,
CVE-2013-5820)

Several vulnerabilities were discovered in the OpenJDK JRE related to
information disclosure. An attacker could exploit these to expose sensitive
data over the network. (CVE-2013-5778, CVE-2013-5780, CVE-2013-5790,
CVE-2013-5840, CVE-2013-5849, CVE-2013-5851)

Several vulnerabilities were discovered in the OpenJDK JRE related to
information disclosure, data integrity and availability. An attacker could
exploit these to cause a denial of service or expose sensitive data over
the network. (CVE-2013-5782, CVE-2013-5802, CVE-2013-5809, CVE-2013-5829,
CVE-2013-5814, CVE-2013-5817, CVE-2013-5830, CVE-2013-5842, CVE-2013-5850)";

  tag_affected = "openjdk-6 on Ubuntu 12.04 LTS ,
  Ubuntu 10.04 LTS";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "USN", value: "2033-1");
  script_xref(name: "URL" , value: "https://lists.ubuntu.com/archives/ubuntu-security-announce/2013-November/002321.html");
  script_summary("Check for the Version of openjdk-6");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
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

  if ((res = isdpkgvuln(pkg:"icedtea-6-jre-cacao", ver:"6b27-1.12.6-1ubuntu0.12.04.4", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"icedtea-6-jre-jamvm", ver:"6b27-1.12.6-1ubuntu0.12.04.4", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-6-jre", ver:"6b27-1.12.6-1ubuntu0.12.04.4", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-6-jre-headless", ver:"6b27-1.12.6-1ubuntu0.12.04.4", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-6-jre-lib", ver:"6b27-1.12.6-1ubuntu0.12.04.4", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-6-jre-zero", ver:"6b27-1.12.6-1ubuntu0.12.04.4", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU10.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"icedtea-6-jre-cacao", ver:"6b27-1.12.6-1ubuntu0.10.04.4", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-6-jre", ver:"6b27-1.12.6-1ubuntu0.10.04.4", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-6-jre-headless", ver:"6b27-1.12.6-1ubuntu0.10.04.4", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-6-jre-lib", ver:"6b27-1.12.6-1ubuntu0.10.04.4", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-6-jre-zero", ver:"6b27-1.12.6-1ubuntu0.10.04.4", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for thunderbird USN-1282-1
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
tag_insight = "Yosuke Hasegawa discovered that the Mozilla browser engine mishandled
  invalid sequences in the Shift-JIS encoding. It may be possible to trigger
  this crash without the use of debugging APIs, which might allow malicious
  websites to exploit this vulnerability. An attacker could possibly use this
  flaw this to steal data or inject malicious scripts into web content.
  (CVE-2011-3648)

  Marc Schoenefeld discovered that using Firebug to profile a JavaScript file
  with many functions would cause Firefox to crash. An attacker might be able
  to exploit this without using the debugging APIs, which could potentially
  remotely crash Thunderbird, resulting in a denial of service.
  (CVE-2011-3650)

  Jason Orendorff, Boris Zbarsky, Gregg Tavares, Mats Palmgren, Christian
  Holler, Jesse Ruderman, Simona Marcu, Bob Clary, and William McCloskey
  discovered multiple memory safety bugs in the browser engine used in
  Thunderbird and other Mozilla-based products. An attacker might be able to
  use these flaws to execute arbitrary code with the privileges of the user
  invoking Thunderbird or possibly crash Thunderbird resulting in a denial of
  service. (CVE-2011-3651)

  It was discovered that Thunderbird could be caused to crash under certain
  conditions, due to an unchecked allocation failure, resulting in a denial
  of service. It might also be possible to execute arbitrary code with the
  privileges of the user invoking Thunderbird. (CVE-2011-3652)

  Aki Helin discovered that Thunderbird does not properly handle links from
  SVG mpath elements to non-SVG elements. An attacker could use this
  vulnerability to crash Thunderbird, resulting in a denial of service, or
  possibly execute arbitrary code with the privileges of the user invoking
  Thunderbird. (CVE-2011-3654)

  It was discovered that an internal privilege check failed to respect the
  NoWaiverWrappers introduced with Thunderbird 5. An attacker could possibly
  use this to gain elevated privileges within Thunderbird for web content.
  (CVE-2011-3655)";

tag_summary = "Ubuntu Update for Linux kernel vulnerabilities USN-1282-1";
tag_affected = "thunderbird on Ubuntu 11.10";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://lists.ubuntu.com/archives/ubuntu-security-announce/2011-November/001501.html");
  script_id(840948);
  script_version("$Revision: 6643 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:00:30 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-03-16 10:53:01 +0530 (Fri, 16 Mar 2012)");
  script_cve_id("CVE-2011-3648", "CVE-2011-3650", "CVE-2011-3651", "CVE-2011-3652",
                "CVE-2011-3654", "CVE-2011-3655");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name: "USN", value: "1282-1");
  script_name("Ubuntu Update for thunderbird USN-1282-1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages");
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU11.10")
{

  if ((res = isdpkgvuln(pkg:"thunderbird", ver:"8.0+build1-0ubuntu0.11.10.1", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

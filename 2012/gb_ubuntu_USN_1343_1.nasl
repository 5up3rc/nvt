###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for thunderbird USN-1343-1
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
tag_insight = "Alexandre Poirot, Chris Blizzard, Kyle Huey, Scoobidiver, Christian Holler,
  David Baron, Gary Kwong, Jim Blandy, Bob Clary, Jesse Ruderman, Marcia
  Knous, and Rober Longson discovered several memory safety issues which
  could possibly be exploited to crash Thunderbird or execute arbitrary code
  as the user that invoked Thunderbird. (CVE-2011-3660)

  Aki Helin discovered a crash in the YARR regular expression library that
  could be triggered by javascript in web content. (CVE-2011-3661)

  It was discovered that a flaw in the Mozilla SVG implementation could
  result in an out-of-bounds memory access if SVG elements were removed
  during a DOMAttrModified event handler. An attacker could potentially
  exploit this vulnerability to crash Thunderbird. (CVE-2011-3658)

  Mario Heiderich discovered it was possible to use SVG animation accessKey
  events to detect key strokes even when JavaScript was disabled. A malicious
  web page could potentially exploit this to trick a user into interacting
  with a prompt thinking it came from Thunderbird in a context where the user
  believed scripting was disabled. (CVE-2011-3663)

  It was discovered that it was possible to crash Thunderbird when scaling an
  OGG &lt;video&gt; element to extreme sizes. (CVE-2011-3665)";

tag_summary = "Ubuntu Update for Linux kernel vulnerabilities USN-1343-1";
tag_affected = "thunderbird on Ubuntu 11.10";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://lists.ubuntu.com/archives/ubuntu-security-announce/2012-January/001563.html");
  script_id(840939);
  script_version("$Revision: 6643 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:00:30 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-03-16 10:51:11 +0530 (Fri, 16 Mar 2012)");
  script_cve_id("CVE-2011-3660", "CVE-2011-3661", "CVE-2011-3658", "CVE-2011-3663",
                "CVE-2011-3665");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name: "USN", value: "1343-1");
  script_name("Ubuntu Update for thunderbird USN-1343-1");

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

  if ((res = isdpkgvuln(pkg:"thunderbird", ver:"9.0+build2-0ubuntu0.11.10.1", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

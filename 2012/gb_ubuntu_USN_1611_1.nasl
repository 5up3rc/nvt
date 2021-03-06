###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for thunderbird USN-1611-1
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
tag_insight = "Henrik Skupin, Jesse Ruderman, Christian Holler, Soroush Dalili and others
  discovered several memory corruption flaws in Thunderbird. If a user were
  tricked into opening a malicious website and had JavaScript enabled, an
  attacker could exploit these to execute arbitrary JavaScript code within
  the context of another website or arbitrary code as the user invoking the
  program. (CVE-2012-3982, CVE-2012-3983, CVE-2012-3988, CVE-2012-3989,
  CVE-2012-4191)

  David Bloom and Jordi Chancel discovered that Thunderbird did not always
  properly handle the &lt;select&gt; element. If a user were tricked into opening a
  malicious website and had JavaScript enabled, a remote attacker could
  exploit this to conduct URL spoofing and clickjacking attacks.
  (CVE-2012-3984)
  
  Collin Jackson discovered that Thunderbird did not properly follow the
  HTML5 specification for document.domain behavior. If a user were tricked
  into opening a malicious website and had JavaScript enabled, a remote
  attacker could exploit this to conduct cross-site scripting (XSS) attacks
  via JavaScript execution. (CVE-2012-3985)
  
  Johnny Stenback discovered that Thunderbird did not properly perform
  security checks on test methods for DOMWindowUtils. (CVE-2012-3986)
  
  Alice White discovered that the security checks for GetProperty could be
  bypassed when using JSAPI. If a user were tricked into opening a specially
  crafted web page and had JavaScript enabled, a remote attacker could
  exploit this to execute arbitrary code as the user invoking the program.
  (CVE-2012-3991)
  
  Mariusz Mlynski discovered a history state error in Thunderbird. If a user
  were tricked into opening a malicious website and had JavaScript enabled, a
  remote attacker could exploit this to spoof the location property to inject
  script or intercept posted data. (CVE-2012-3992)
  
  Mariusz Mlynski and others discovered several flaws in Thunderbird that
  allowed a remote attacker to conduct cross-site scripting (XSS) attacks.
  With cross-site scripting vulnerabilities, if a user were tricked into
  viewing a specially crafted page and had JavaScript enabled, a remote
  attacker could exploit these to modify the contents, or steal confidential
  data, within the same domain. (CVE-2012-3993, CVE-2012-3994, CVE-2012-4184)
  
  Abhishek Arya, Atte Kettunen and others discovered several memory flaws in
  Thunderbird when using the Address Sanitizer tool. If a user were tricked
  into opening a malicious website and had JavaScript enabled, an attacker
  could exploit th ... 

  Description truncated, for more information please check the Reference URL";

tag_summary = "Ubuntu Update for Linux kernel vulnerabilities USN-1611-1";
tag_affected = "thunderbird on Ubuntu 12.04 LTS ,
  Ubuntu 11.10 ,
  Ubuntu 11.04 ,
  Ubuntu 10.04 LTS";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://lists.ubuntu.com/archives/ubuntu-security-announce/2012-October/001870.html");
  script_id(841190);
  script_version("$Revision: 6643 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:00:30 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-10-16 09:46:00 +0530 (Tue, 16 Oct 2012)");
  script_cve_id("CVE-2012-3982", "CVE-2012-3983", "CVE-2012-3988", "CVE-2012-3989",
                "CVE-2012-4191", "CVE-2012-3984", "CVE-2012-3985", "CVE-2012-3986",
                "CVE-2012-3991", "CVE-2012-3992", "CVE-2012-3993", "CVE-2012-3994",
                "CVE-2012-4184", "CVE-2012-3990", "CVE-2012-3995", "CVE-2012-4179",
                "CVE-2012-4180", "CVE-2012-4181", "CVE-2012-4182", "CVE-2012-4183",
                "CVE-2012-4185", "CVE-2012-4186", "CVE-2012-4187", "CVE-2012-4188",
                "CVE-2012-4192", "CVE-2012-4193");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name: "USN", value: "1611-1");
  script_name("Ubuntu Update for thunderbird USN-1611-1");

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

if(release == "UBUNTU10.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"thunderbird", ver:"16.0.1+build1-0ubuntu0.10.04.1", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"thunderbird", ver:"16.0.1+build1-0ubuntu0.12.04.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU11.10")
{

  if ((res = isdpkgvuln(pkg:"thunderbird", ver:"16.0.1+build1-0ubuntu0.11.10.1", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU11.04")
{

  if ((res = isdpkgvuln(pkg:"thunderbird", ver:"16.0.1+build1-0ubuntu0.11.04.1", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

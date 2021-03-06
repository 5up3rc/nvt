###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for ruby1.8 USN-1377-1
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
tag_insight = "Drew Yao discovered that the WEBrick HTTP server was vulnerable to cross-site
  scripting attacks when displaying error pages. A remote attacker could use this
  flaw to run arbitrary web script. (CVE-2010-0541)

  Drew Yao discovered that Ruby's BigDecimal module did not properly allocate
  memory on 64-bit platforms. An attacker could use this flaw to cause a denial
  of service or possibly execute arbitrary code with user privileges.
  (CVE-2011-0188)

  Nicholas Jefferson discovered that the FileUtils.remove_entry_secure method in
  Ruby did not properly remove non-empty directories. An attacker could use this
  flaw to possibly delete arbitrary files. (CVE-2011-1004)

  It was discovered that Ruby incorrectly allowed untainted strings to be
  modified in protective safe levels. An attacker could use this flaw to bypass
  intended access restrictions. (CVE-2011-1005)

  Eric Wong discovered that Ruby does not properly reseed its pseudorandom number
  generator when creating child processes. An attacker could use this flaw to
  gain knowledge of the random numbers used in other Ruby child processes.
  (CVE-2011-2686)

  Eric Wong discovered that the SecureRandom module in Ruby did not properly seed
  its pseudorandom number generator. An attacker could use this flaw to gain
  knowledge of the random numbers used by another Ruby process with the same
  process ID number. (CVE-2011-2705)

  Alexander Klink and Julian W&#228;lde discovered that Ruby computed hash values
  without restricting the ability to trigger hash collisions predictably. A
  remote attacker could cause a denial of service by crafting values used in hash
  tables. (CVE-2011-4815)";

tag_summary = "Ubuntu Update for Linux kernel vulnerabilities USN-1377-1";
tag_affected = "ruby1.8 on Ubuntu 11.04 ,
  Ubuntu 10.10 ,
  Ubuntu 10.04 LTS";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://lists.ubuntu.com/archives/ubuntu-security-announce/2012-February/001606.html");
  script_id(840923);
  script_version("$Revision: 6643 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:00:30 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-03-07 11:20:13 +0530 (Wed, 07 Mar 2012)");
  script_cve_id("CVE-2010-0541", "CVE-2011-0188", "CVE-2011-1004", "CVE-2011-1005",
                "CVE-2011-2686", "CVE-2011-2705", "CVE-2011-4815");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_xref(name: "USN", value: "1377-1");
  script_name("Ubuntu Update for ruby1.8 USN-1377-1");

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

if(release == "UBUNTU10.10")
{

  if ((res = isdpkgvuln(pkg:"libruby1.8", ver:"1.8.7.299-2ubuntu0.1", rls:"UBUNTU10.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"ruby1.8", ver:"1.8.7.299-2ubuntu0.1", rls:"UBUNTU10.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU10.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libruby1.8", ver:"1.8.7.249-2ubuntu0.1", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"ruby1.8", ver:"1.8.7.249-2ubuntu0.1", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU11.04")
{

  if ((res = isdpkgvuln(pkg:"libruby1.8", ver:"1.8.7.302-2ubuntu0.1", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"ruby1.8", ver:"1.8.7.302-2ubuntu0.1", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

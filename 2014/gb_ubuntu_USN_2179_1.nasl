###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for linux USN-2179-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_id(841778);
  script_version("$Revision: 6645 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:02:37 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-05-02 10:10:59 +0530 (Fri, 02 May 2014)");
  script_cve_id("CVE-2014-0049", "CVE-2014-0069");
  script_tag(name:"cvss_base", value:"7.4");
  script_tag(name:"cvss_base_vector", value:"AV:A/AC:M/Au:S/C:C/I:C/A:C");
  script_name("Ubuntu Update for linux USN-2179-1");

  tag_insight = "A flaw was discovered in the Kernel Virtual Machine (KVM)
subsystem of the Linux kernel. A guest OS user could exploit this flaw to
execute arbitrary code on the host OS. (CVE-2014-0049)

Al Viro discovered an error in how CIFS in the Linux kernel handles
uncached write operations. An unprivileged local user could exploit this
flaw to cause a denial of service (system crash), obtain sensitive
information from kernel memory, or possibly gain privileges.
(CVE-2014-0069)";

  tag_affected = "linux on Ubuntu 13.10";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "USN", value: "2179-1");
  script_xref(name: "URL" , value: "https://lists.ubuntu.com/archives/ubuntu-security-announce/2014-April/002476.html");
  script_summary("Check for the Version of linux");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
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

if(release == "UBUNTU13.10")
{

  if ((res = isdpkgvuln(pkg:"linux-image-3.11.0-20-generic", ver:"3.11.0-20.34", rls:"UBUNTU13.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.11.0-20-generic-lpae", ver:"3.11.0-20.34", rls:"UBUNTU13.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

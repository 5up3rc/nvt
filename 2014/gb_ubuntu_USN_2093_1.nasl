###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for libvirt USN-2093-1
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
  script_id(841696);
  script_version("$Revision: 6645 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:02:37 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-02-03 14:02:09 +0530 (Mon, 03 Feb 2014)");
  script_cve_id("CVE-2013-6436", "CVE-2013-6457", "CVE-2013-6458", "CVE-2014-0028", "CVE-2014-1447");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:A/AC:H/Au:N/C:C/I:C/A:C");
  script_name("Ubuntu Update for libvirt USN-2093-1");

  tag_insight = "Martin Kletzander discovered that libvirt incorrectly handled
reading memory tunables from LXC guests. A local user could possibly use this
flaw to cause libvirtd to crash, resulting in a denial of service. This issue
only affected Ubuntu 13.10. (CVE-2013-6436)

Dario Faggioli discovered that libvirt incorrectly handled the libxl
driver. A local user could possibly use this flaw to cause libvirtd to
crash, resulting in a denial of service, or possibly execute arbitrary
code. This issue only affected Ubuntu 13.10. (CVE-2013-6457)

It was discovered that libvirt contained multiple race conditions in block
device handling. A remote read-only user could use this flaw to cause
libvirtd to crash, resulting in a denial of service. (CVE-2013-6458)

Eric Blake discovered that libvirt incorrectly handled certain ACLs. An
attacker could use this flaw to possibly obtain certain sensitive
information. This issue only affected Ubuntu 13.10. (CVE-2014-0028)

Jiri Denemark discovered that libvirt incorrectly handled keepalives. A
remote attacker could possibly use this flaw to cause libvirtd to crash,
resulting in a denial of service. (CVE-2014-1447)";

  tag_affected = "libvirt on Ubuntu 13.10 ,
  Ubuntu 12.10 ,
  Ubuntu 12.04 LTS";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "USN", value: "2093-1");
  script_xref(name: "URL" , value: "https://lists.ubuntu.com/archives/ubuntu-security-announce/2014-January/002384.html");
  script_summary("Check for the Version of libvirt");
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

if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libvirt-bin", ver:"0.9.8-2ubuntu17.17", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libvirt0", ver:"0.9.8-2ubuntu17.17", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU13.10")
{

  if ((res = isdpkgvuln(pkg:"libvirt-bin", ver:"1.1.1-0ubuntu8.5", rls:"UBUNTU13.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libvirt0", ver:"1.1.1-0ubuntu8.5", rls:"UBUNTU13.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU12.10")
{

  if ((res = isdpkgvuln(pkg:"libvirt-bin", ver:"0.9.13-0ubuntu12.6", rls:"UBUNTU12.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libvirt0", ver:"0.9.13-0ubuntu12.6", rls:"UBUNTU12.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

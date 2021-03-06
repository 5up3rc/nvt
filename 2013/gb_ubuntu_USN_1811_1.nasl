###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for linux-ti-omap4 USN-1811-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_insight = "Mathias Krause discovered an information leak in the Linux kernel's UDF
  file system implementation. A local user could exploit this flaw to examine
  some of the kernel's heap memory. (CVE-2012-6548)

  Mathias Krause discovered an information leak in the Linux kernel's ISO
  9660 CDROM file system driver. A local user could exploit this flaw to
  examine some of the kernel's heap memory. (CVE-2012-6549)

  An integer overflow was discovered in the Direct Rendering Manager (DRM)
  subsystem for the i915 video driver in the Linux kernel. A local user could
  exploit this flaw to cause a denial of service (crash) or potentially
  escalate privileges. (CVE-2013-0913)

  A format-string bug was discovered in the Linux kernel's ext3 filesystem
  driver. A local user could exploit this flaw to possibly escalate
  privileges on the system. (CVE-2013-1848)

  A buffer overflow was discovered in the Linux Kernel's USB subsystem for
  devices reporting the cdc-wdm class. A specially crafted USB device when
  plugged-in could cause a denial of service (system crash) or possibly
  execute arbitrary code. (CVE-2013-1860)

  An information leak in the Linux kernel's dcb netlink interface was
  discovered. A local user could obtain sensitive information by examining
  kernel stack memory. (CVE-2013-2634)

  A kernel stack information leak was discovered in the RTNETLINK component
  of the Linux kernel. A local user could read sensitive information from the
  kernel stack. (CVE-2013-2635)";


tag_affected = "linux-ti-omap4 on Ubuntu 12.04 LTS";
tag_solution = "Please Install the Updated Packages.";

if(description)
{
  script_id(841409);
  script_version("$Revision: 6644 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:01:20 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2013-06-14 12:52:04 +0530 (Fri, 14 Jun 2013)");
  script_cve_id("CVE-2012-6548", "CVE-2012-6549", "CVE-2013-0913", "CVE-2013-1848",
                "CVE-2013-1860", "CVE-2013-2634", "CVE-2013-2635");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Ubuntu Update for linux-ti-omap4 USN-1811-1");

  script_xref(name: "USN", value: "1811-1");
  script_xref(name: "URL" , value: "https://lists.ubuntu.com/archives/ubuntu-security-announce/2013-May/002093.html");
  script_summary("Check for the Version of linux-ti-omap4");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages");
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

if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"linux-image-3.2.0-1430-omap4", ver:"3.2.0-1430.39", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

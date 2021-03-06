###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for linux USN-3293-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.843165");
  script_version("$Revision: 6648 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:05:27 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2017-05-17 06:52:48 +0200 (Wed, 17 May 2017)");
  script_cve_id("CVE-2017-2596", "CVE-2017-7187", "CVE-2017-7261", "CVE-2017-7294", 
                "CVE-2017-7477", "CVE-2017-7616"); 
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for linux USN-3293-1");
  script_tag(name: "summary", value: "Check the version of linux");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of 
  detect NVT and check if the version is vulnerable or not."); 
  script_tag(name: "insight", value: "Dmitry Vyukov discovered that KVM 
  implementation in the Linux kernel improperly emulated the VMXON instruction. A 
  local attacker in a guest OS could use this to cause a denial of service (memory 
  consumption) in the host OS. (CVE-2017-2596) Dmitry Vyukov discovered that the 
  generic SCSI (sg) subsystem in the Linux kernel contained a stack-based buffer 
  overflow. A local attacker with access to an sg device could use this to cause a 
  denial of service (system crash) or possibly execute arbitrary code. 
  (CVE-2017-7187) It was discovered that a NULL pointer dereference existed in the 
  Direct Rendering Manager (DRM) driver for VMWare devices in the Linux kernel. A 
  local attacker could use this to cause a denial of service (system crash). 
  (CVE-2017-7261) Li Qiang discovered that an integer overflow vulnerability 
  existed in the Direct Rendering Manager (DRM) driver for VMWare devices in the 
  Linux kernel. A local attacker could use this to cause a denial of service 
  (system crash) or possibly execute arbitrary code. (CVE-2017-7294) Jason 
  Donenfeld discovered a heap overflow in the MACsec module in the Linux kernel. 
  An attacker could use this to cause a denial of service (system crash) or 
  possibly execute arbitrary code. (CVE-2017-7477) It was discovered that an 
  information leak existed in the set_mempolicy and mbind compat syscalls in the 
  Linux kernel. A local attacker could use this to expose sensitive information 
  (kernel memory). (CVE-2017-7616)"); 
  script_tag(name: "affected", value: "linux on Ubuntu 17.04");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "USN", value: "3293-1");
  script_xref(name: "URL" , value: "https://www.ubuntu.com/usn/usn-3293-1");
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

if(release == "UBUNTU17.04")
{

  if ((res = isdpkgvuln(pkg:"linux-image-4.10.0-1005-raspi2", ver:"4.10.0-1005.7", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.10.0-21-generic", ver:"4.10.0-21.23", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.10.0-21-generic-lpae", ver:"4.10.0-21.23", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.10.0-21-lowlatency", ver:"4.10.0-21.23", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-generic", ver:"4.10.0.21.23", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-generic-lpae", ver:"4.10.0.21.23", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-lowlatency", ver:"4.10.0.21.23", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-raspi2", ver:"4.10.0.1005.7", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

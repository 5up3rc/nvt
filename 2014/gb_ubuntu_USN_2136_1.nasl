###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for linux-lts-raring USN-2136-1
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
  script_id(841744);
  script_version("$Revision: 6645 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:02:37 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-03-12 09:39:56 +0530 (Wed, 12 Mar 2014)");
  script_cve_id("CVE-2013-4579", "CVE-2013-4587", "CVE-2013-6367", "CVE-2013-6368",
                "CVE-2013-6376", "CVE-2013-6380", "CVE-2013-7263", "CVE-2013-7264",
                "CVE-2013-7265", "CVE-2013-7266", "CVE-2013-7267", "CVE-2013-7268",
                "CVE-2013-7269", "CVE-2013-7270", "CVE-2013-7271", "CVE-2013-7281",
                "CVE-2014-1438", "CVE-2014-1446", "CVE-2014-1874");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Ubuntu Update for linux-lts-raring USN-2136-1");

  tag_insight = "Mathy Vanhoef discovered an error in the the way the ath9k
driver was handling the BSSID masking. A remote attacker could exploit this
error to discover the original MAC address after a spoofing atack.
(CVE-2013-4579)

Andrew Honig reported a flaw in the Linux Kernel's kvm_vm_ioctl_create_vcpu
function of the Kernel Virtual Machine (KVM) subsystem. A local user could
exploit this flaw to gain privileges on the host machine. (CVE-2013-4587)

Andrew Honig reported a flaw in the apic_get_tmcct function of the Kernel
Virtual Machine (KVM) subsystem if the Linux kernel. A guest OS user could
exploit this flaw to cause a denial of service or host OS system crash.
(CVE-2013-6367)

Andrew Honig reported an error in the Linux Kernel's Kernel Virtual Machine
(KVM) VAPIC synchronization operation. A local user could exploit this flaw
to gain privileges or cause a denial of service (system crash).
(CVE-2013-6368)

Lars Bull discovered a flaw in the recalculate_apic_map function of the
Kernel Virtual Machine (KVM) subsystem in the Linux kernel. A guest OS user
could exploit this flaw to cause a denial of service (host OS crash).
(CVE-2013-6376)

Nico Golde and Fabian Yamaguchi reported a flaw in the driver for Adaptec
AACRAID scsi raid devices in the Linux kernel. A local user could use this
flaw to cause a denial of service or possibly other unspecified impact.
(CVE-2013-6380)

mpd reported an information leak in the recvfrom, recvmmsg, and recvmsg
system calls in the Linux kernel. An unprivileged local user could exploit
this flaw to obtain sensitive information from kernel stack memory.
(CVE-2013-7263)

mpb reported an information leak in the Layer Two Tunneling Protocol (l2tp)
of the Linux kernel. A local user could exploit this flaw to obtain
sensitive information from kernel stack memory. (CVE-2013-7264)

mpb reported an information leak in the Phone Network protocol (phonet) in
the Linux kernel. A local user could exploit this flaw to obtain sensitive
information from kernel stack memory. (CVE-2013-7265)

An information leak was discovered in the recvfrom, recvmmsg, and recvmsg
systemcalls when used with ISDN sockets in the Linux kernel. A local user
could exploit this leak to obtain potentially sensitive information from
kernel memory. (CVE-2013-7266)

An information leak was discovered in the recvfrom, recvmmsg, and recvmsg
systemcalls when used with apple talk sockets in the Linux kernel. A local
user could exploit this leak to obtain potentially sensitive information
from kernel memory. (CVE-2013-7267)

An information leak was discovered in the recvfrom, recvmmsg, and recvmsg
syste ...

  Description truncated, for more information please check the Reference URL";

  tag_affected = "linux-lts-raring on Ubuntu 12.04 LTS";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "USN", value: "2136-1");
  script_xref(name: "URL" , value: "https://lists.ubuntu.com/archives/ubuntu-security-announce/2014-March/002430.html");
  script_summary("Check for the Version of linux-lts-raring");
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

  if ((res = isdpkgvuln(pkg:"linux-image-3.8.0-37-generic", ver:"3.8.0-37.53~precise1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

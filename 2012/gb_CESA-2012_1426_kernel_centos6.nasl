###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for kernel CESA-2012:1426 centos6 
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
tag_insight = "The kernel packages contain the Linux kernel, the core of any Linux
  operating system.

  This update fixes the following security issues:
  
  * A use-after-free flaw was found in the Linux kernel's memory management
  subsystem in the way quota handling for huge pages was performed. A local,
  unprivileged user could use this flaw to cause a denial of service or,
  potentially, escalate their privileges. (CVE-2012-2133, Moderate)
  
  * A use-after-free flaw was found in the madvise() system call
  implementation in the Linux kernel. A local, unprivileged user could use
  this flaw to cause a denial of service or, potentially, escalate their
  privileges. (CVE-2012-3511, Moderate)
  
  * It was found that when running a 32-bit binary that uses a large number
  of shared libraries, one of the libraries would always be loaded at a
  predictable address in memory. An attacker could use this flaw to bypass
  the Address Space Layout Randomization (ASLR) security feature.
  (CVE-2012-1568, Low)
  
  * Buffer overflow flaws were found in the udf_load_logicalvol() function
  in the Universal Disk Format (UDF) file system implementation in the Linux
  kernel. An attacker with physical access to a system could use these flaws
  to cause a denial of service or escalate their privileges. (CVE-2012-3400,
  Low)
  
  Red Hat would like to thank Shachar Raindel for reporting CVE-2012-2133.
  
  This update also fixes several bugs. Documentation for these changes will
  be available shortly from the Technical Notes document linked to in the
  References section.
  
  Users should upgrade to these updated packages, which contain backported
  patches to correct these issues, and fix the bugs noted in the Technical
  Notes. The system must be rebooted for this update to take effect.";

tag_affected = "kernel on CentOS 6";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2012-November/018974.html");
  script_id(881535);
  script_version("$Revision: 6654 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:48:17 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-11-09 09:33:56 +0530 (Fri, 09 Nov 2012)");
  script_cve_id("CVE-2012-1568", "CVE-2012-2133", "CVE-2012-3400", "CVE-2012-3511");
  script_tag(name:"cvss_base", value:"7.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:C/I:C/A:C");
  script_xref(name: "CESA", value: "2012:1426");
  script_name("CentOS Update for kernel CESA-2012:1426 centos6 ");

  script_summary("Check for the Version of kernel");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~2.6.32~279.14.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug", rpm:"kernel-debug~2.6.32~279.14.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-devel", rpm:"kernel-debug-devel~2.6.32~279.14.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-devel", rpm:"kernel-devel~2.6.32~279.14.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-doc", rpm:"kernel-doc~2.6.32~279.14.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-firmware", rpm:"kernel-firmware~2.6.32~279.14.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-headers", rpm:"kernel-headers~2.6.32~279.14.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"perf", rpm:"perf~2.6.32~279.14.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"python-perf", rpm:"python-perf~2.6.32~279.14.1.el6", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

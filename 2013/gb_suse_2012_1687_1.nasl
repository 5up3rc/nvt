###############################################################################
# OpenVAS Vulnerability Test
#
# SuSE Update for xen openSUSE-SU-2012:1687-1 (xen)
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
tag_insight = "XEN was updated to fix various denial of service issues.


  - bnc#789945 - CVE-2012-5510: xen: Grant table version
  switch list corruption vulnerability (XSA-26)

  - bnc#789944 - CVE-2012-5511: xen: Several HVM operations
  do not validate the range of their inputs (XSA-27)

  - bnc#789940 - CVE-2012-5512: xen: HVMOP_get_mem_access
  crash / HVMOP_set_mem_access information leak (XSA-28)

  - bnc#789951 - CVE-2012-5513: xen: XENMEM_exchange may
  overwrite hypervisor memory (XSA-29)

  - bnc#789948 - CVE-2012-5514: xen: Missing unlock in
  guest_physmap_mark_populate_on_demand() (XSA-30)

  - bnc#789950 - CVE-2012-5515: xen: Several memory hypercall
  operations allow invalid extent order values (XSA-31)

  - bnc#789988 - FATAL PAGE FAULT in hypervisor
  (arch_do_domctl)

  - Upstream patches from Jan
  26132-tmem-save-NULL-check.patch
  26134-x86-shadow-invlpg-check.patch
  26148-vcpu-timer-overflow.patch (Replaces
  CVE-2012-4535-xsa20.patch)
  26149-x86-p2m-physmap-error-path.patch (Replaces
  CVE-2012-4537-xsa22.patch)
  26150-x86-shadow-unhook-toplevel-check.patch (Replaces
  CVE-2012-4538-xsa23.patch)

  - bnc#777628 - guest &quot;disappears&quot; after live migration
  Updated block-dmmd script


  - Fix exception in balloon.py and osdep.py
  xen-max-free-mem.diff
  - bnc#792476 - efi files missing in latest XEN update
  Revert c/s 25751 EFI Makefile changes in
  23614-x86_64-EFI-boot.patch";


tag_affected = "xen on openSUSE 12.1";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.opensuse.org/opensuse-security-announce/2012-12/msg00019.html");
  script_id(850386);
  script_version("$Revision: 6673 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-11 15:45:02 +0200 (Tue, 11 Jul 2017) $");
  script_tag(name:"creation_date", value:"2013-03-11 18:29:54 +0530 (Mon, 11 Mar 2013)");
  script_cve_id("CVE-2012-5510", "CVE-2012-5511", "CVE-2012-5512", "CVE-2012-5513",
                "CVE-2012-5514", "CVE-2012-5515", "CVE-2012-4535", "CVE-2012-4537",
                "CVE-2012-4538");
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name: "openSUSE-SU", value: "2012:1687_1");
  script_name("SuSE Update for xen openSUSE-SU-2012:1687-1 (xen)");

  script_summary("Check for the Version of xen");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
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

if(release == "openSUSE12.1")
{

  if ((res = isrpmvuln(pkg:"xen-debugsource", rpm:"xen-debugsource~4.1.3_06~1.25.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-devel", rpm:"xen-devel~4.1.3_06~1.25.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-kmp-default", rpm:"xen-kmp-default~4.1.3_06_k3.1.10_1.16~1.25.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-kmp-default-debuginfo", rpm:"xen-kmp-default-debuginfo~4.1.3_06_k3.1.10_1.16~1.25.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-kmp-desktop", rpm:"xen-kmp-desktop~4.1.3_06_k3.1.10_1.16~1.25.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-kmp-desktop-debuginfo", rpm:"xen-kmp-desktop-debuginfo~4.1.3_06_k3.1.10_1.16~1.25.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-libs", rpm:"xen-libs~4.1.3_06~1.25.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-libs-debuginfo", rpm:"xen-libs-debuginfo~4.1.3_06~1.25.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-tools-domU", rpm:"xen-tools-domU~4.1.3_06~1.25.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-tools-domU-debuginfo", rpm:"xen-tools-domU-debuginfo~4.1.3_06~1.25.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen", rpm:"xen~4.1.3_06~1.25.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-doc-html", rpm:"xen-doc-html~4.1.3_06~1.25.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-doc-pdf", rpm:"xen-doc-pdf~4.1.3_06~1.25.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-libs-32bit", rpm:"xen-libs-32bit~4.1.3_06~1.25.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-libs-debuginfo-32bit", rpm:"xen-libs-debuginfo-32bit~4.1.3_06~1.25.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-tools", rpm:"xen-tools~4.1.3_06~1.25.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-tools-debuginfo", rpm:"xen-tools-debuginfo~4.1.3_06~1.25.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-libs-debuginfo-x86", rpm:"xen-libs-debuginfo-x86~4.1.3_06~1.25.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-libs-x86", rpm:"xen-libs-x86~4.1.3_06~1.25.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-kmp-pae", rpm:"xen-kmp-pae~4.1.3_06_k3.1.10_1.16~1.25.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-kmp-pae-debuginfo", rpm:"xen-kmp-pae-debuginfo~4.1.3_06_k3.1.10_1.16~1.25.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

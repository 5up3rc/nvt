###############################################################################
# OpenVAS Vulnerability Test
#
# SuSE Update for kvm SUSE-SU-2014:0623-1 (kvm)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.850829");
  script_version("$Revision: 6675 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-11 15:54:28 +0200 (Tue, 11 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-10-13 18:35:01 +0530 (Tue, 13 Oct 2015)");
  script_cve_id("CVE-2013-2016", "CVE-2013-4344", "CVE-2013-4541", "CVE-2014-0142",
                "CVE-2014-0143", "CVE-2014-0144", "CVE-2014-0145", "CVE-2014-0146",
                "CVE-2014-0147");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for kvm SUSE-SU-2014:0623-1 (kvm)");
  script_tag(name: "summary", value: "Check the version of kvm");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  The QEMU embedded within KVM received various security
  fixes.

  Various issues in the block layer have been fixed:

  * A virtio security issue in config io space handling
  (CVE-2013-2016).
  * A SCSI report LUNs buffer overflow (CVE-2013-4344).
  * A buffer overflow in the QEMU USB stack
  (CVE-2013-4541).

  Security Issue references:

  * CVE-2013-2016
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2013-2016
   
  * CVE-2013-4344
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2013-4344
   
  * CVE-2013-4541
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2013-4541
   
  * CVE-2014-0142
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-0142
   
  * CVE-2014-0143
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-0143
   
  * CVE-2014-0144
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-0144
   
  * CVE-2014-0145
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-0145
   
  * CVE-2014-0146
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-0146
   
  * CVE-2014-0147
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-0147");
  script_tag(name: "affected", value: "kvm on SUSE Linux Enterprise Server 11 SP3");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "SUSE-SU", value: "2014:0623_1");
  script_xref(name: "URL" , value: "http://lists.opensuse.org/opensuse-security-announce/2014-05/msg00002.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "SLES11.0SP3")
{

  if ((res = isrpmvuln(pkg:"kvm", rpm:"kvm~1.4.2~0.11.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

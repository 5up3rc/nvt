###############################################################################
# OpenVAS Vulnerability Test
#
# SuSE Update for ppc64-diag SUSE-SU-2014:0928-1 (ppc64-diag)
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
  script_oid("1.3.6.1.4.1.25623.1.0.850822");
  script_version("$Revision: 6675 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-11 15:54:28 +0200 (Tue, 11 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-10-13 18:35:01 +0530 (Tue, 13 Oct 2015)");
  script_cve_id("CVE-2014-4038", "CVE-2014-4039");
  script_tag(name:"cvss_base", value:"4.4");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for ppc64-diag SUSE-SU-2014:0928-1 (ppc64-diag)");
  script_tag(name: "summary", value: "Check the version of ppc64-diag");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  ppc64-diag has been updated to prevent the usage of predictable filenames
  in /tmp in various scripts and daemons (CVE-2014-4038) Also the snapshot
  tarball was previously generated world readable, which could have leaked
  sensible information, which is only visible to root, to all users. It is
  now readable for root only (CVE-2014-4039).

  Security Issues:

  * CVE-2014-4038
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-4038 
  * CVE-2014-4039
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-4039");
  script_tag(name: "affected", value: "ppc64-diag on SUSE Linux Enterprise Server 11 SP3");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "SUSE-SU", value: "2014:0928_1");
  script_xref(name: "URL" , value: "http://lists.opensuse.org/opensuse-security-announce/2014-07/msg00018.html");
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

  if ((res = isrpmvuln(pkg:"ppc64-diag", rpm:"ppc64-diag~2.6.1~0.14.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

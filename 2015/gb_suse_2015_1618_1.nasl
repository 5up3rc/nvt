###############################################################################
# OpenVAS Vulnerability Test
#
# SuSE Update for flash-player SUSE-SU-2015:1618-1 (flash-player)
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
  script_oid("1.3.6.1.4.1.25623.1.0.850896");
  script_version("$Revision: 6675 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-11 15:54:28 +0200 (Tue, 11 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-10-16 13:39:09 +0200 (Fri, 16 Oct 2015)");
  script_cve_id("CVE-2015-5567", "CVE-2015-5568", "CVE-2015-5570", "CVE-2015-5571", "CVE-2015-5572", "CVE-2015-5573", "CVE-2015-5574", "CVE-2015-5575", "CVE-2015-5576", "CVE-2015-5577", "CVE-2015-5578", "CVE-2015-5579", "CVE-2015-5580", "CVE-2015-5581", "CVE-2015-5582", "CVE-2015-5584", "CVE-2015-5587", "CVE-2015-5588", "CVE-2015-6676", "CVE-2015-6677", "CVE-2015-6678", "CVE-2015-6679", "CVE-2015-6682");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for flash-player SUSE-SU-2015:1618-1 (flash-player)");
  script_tag(name: "summary", value: "Check the version of flash-player");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  Adobe Flash Player was updated to 11.2.202.521 (APSB15-23 bsc#946880)
  fixing several security issues:

  More information can be found on:

  https://helpx.adobe.com/security/products/flash-player/apsb15-23.html");
  script_tag(name: "affected", value: "flash-player on SUSE Linux Enterprise Desktop 12");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "SUSE-SU", value: "2015:1618_1");
  script_xref(name: "URL" , value: "http://lists.opensuse.org/opensuse-security-announce/2015-09/msg00024.html");
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

if(release == "SLED12.0SP0")
{

  if ((res = isrpmvuln(pkg:"flash-player", rpm:"flash-player~11.2.202.521~102.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"flash-player-gnome", rpm:"flash-player-gnome~11.2.202.521~102.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
###############################################################################
# OpenVAS Vulnerability Test
#
# SuSE Update for wpa_supplicant openSUSE-SU-2015:0813-1 (wpa_supplicant)
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
  script_oid("1.3.6.1.4.1.25623.1.0.850652");
  script_version("$Revision: 6675 $");
  script_cve_id("CVE-2015-1863");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:A/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-07-11 15:54:28 +0200 (Tue, 11 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-05-02 05:42:21 +0200 (Sat, 02 May 2015)");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for wpa_supplicant openSUSE-SU-2015:0813-1 (wpa_supplicant)");
  script_tag(name: "summary", value: "Check the version of wpa_supplicant");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of
  detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  The wireless network encryption and authentication daemon wpa_supplicant
  was updated to fix a security issue.

  The following vulnerability was fixed:

  * CVE-2015-1863: A buffer overflow in handling SSIDs in P2P management
  frames allowed attackers in radio range to crash, expose memory content
  or potentially execute arbitrary code.");
  script_tag(name: "affected", value: "wpa_supplicant on openSUSE 13.1");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "openSUSE-SU", value: "2015:0813_1");
  script_xref(name: "URL" , value: "http://lists.opensuse.org/opensuse-security-announce/2015-05/msg00000.html");
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

if(release == "openSUSE13.1")
{

  if ((res = isrpmvuln(pkg:"wpa_supplicant", rpm:"wpa_supplicant~2.0~3.11.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"wpa_supplicant-debuginfo", rpm:"wpa_supplicant-debuginfo~2.0~3.11.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"wpa_supplicant-debugsource", rpm:"wpa_supplicant-debugsource~2.0~3.11.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"wpa_supplicant-gui", rpm:"wpa_supplicant-gui~2.0~3.11.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"wpa_supplicant-gui-debuginfo", rpm:"wpa_supplicant-gui-debuginfo~2.0~3.11.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

###############################################################################
# OpenVAS Vulnerability Test
#
# SuSE Update for Chromium openSUSE-SU-2016:1982-1 (Chromium)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.851376");
  script_version("$Revision: 6676 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-11 15:56:06 +0200 (Tue, 11 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-08-08 05:37:51 +0200 (Mon, 08 Aug 2016)");
  script_cve_id("CVE-2016-5139", "CVE-2016-5140", "CVE-2016-5141", "CVE-2016-5142", 
                "CVE-2016-5143", "CVE-2016-5144", "CVE-2016-5145", "CVE-2016-5146");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for Chromium openSUSE-SU-2016:1982-1 (Chromium)");
  script_tag(name: "summary", value: "Check the version of Chromium");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  Chromium was updated to 52.0.2743.116 to fix the following security
  issues: (boo#992305)

  - CVE-2016-5141: Address bar spoofing (boo#992314)
  - CVE-2016-5142: Use-after-free in Blink (boo#992313)
  - CVE-2016-5139: Heap overflow in pdfium (boo#992311)
  - CVE-2016-5140: Heap overflow in pdfium (boo#992310)
  - CVE-2016-5145: Same origin bypass for images in Blink (boo#992320)
  - CVE-2016-5143: Parameter sanitization failure in DevTools (boo#992319)
  - CVE-2016-5144: Parameter sanitization failure in DevTools (boo#992315)
  - CVE-2016-5146: Various fixes from internal audits, fuzzing and other
  initiatives (boo#992309)");
  script_tag(name: "affected", value: "Chromium on openSUSE Leap 42.1, openSUSE 13.2");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "openSUSE-SU", value: "2016:1982_1");
  script_xref(name: "URL" , value: "http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00005.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
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

if(release == "openSUSE13.2")
{

  if ((res = isrpmvuln(pkg:"chromedriver", rpm:"chromedriver~52.0.2743.116~114.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium", rpm:"chromium~52.0.2743.116~114.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-desktop-gnome", rpm:"chromium-desktop-gnome~52.0.2743.116~114.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-desktop-kde", rpm:"chromium-desktop-kde~52.0.2743.116~114.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-ffmpegsumo", rpm:"chromium-ffmpegsumo~52.0.2743.116~114.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

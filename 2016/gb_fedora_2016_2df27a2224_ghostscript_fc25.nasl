###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for ghostscript FEDORA-2016-2df27a2224
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
  script_oid("1.3.6.1.4.1.25623.1.0.872054");
  script_version("$Revision: 6959 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-18 09:24:59 +0200 (Fri, 18 Aug 2017) $");
  script_tag(name:"creation_date", value:"2016-12-07 05:25:44 +0100 (Wed, 07 Dec 2016)");
  script_cve_id("CVE-2016-7977", "CVE-2013-5653", "CVE-2016-7976", "CVE-2016-7978", "CVE-2016-7979");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for ghostscript FEDORA-2016-2df27a2224");
  script_tag(name: "summary", value: "Check the version of ghostscript");

  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");

  script_tag(name: "insight", value: "Ghostscript is a set of software that
  provides a PostScript interpreter, a set of C procedures (the Ghostscript
  library, which implements the graphics capabilities in the PostScript
  language) and an interpreter for Portable Document Format (PDF) files.
  Ghostscript translates PostScript code into many common, bitmapped formats,
  like those understood by your printer or screen. Ghostscript is normally
  used to display PostScript files and to print PostScript files to
  non-PostScript printers.

  If you need to display PostScript files or print them to
  non-PostScript printers, you should install ghostscript. If you
  install ghostscript, you also need to install the ghostscript-fonts
  package.");

  script_tag(name: "affected", value: "ghostscript on Fedora 25");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2016-2df27a2224");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/2R76LGAVUISASDAGAG2YYJ4FFPTDP6UG");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC25")
{

  if ((res = isrpmvuln(pkg:"ghostscript", rpm:"ghostscript~9.20~2.fc25", rls:"FC25")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

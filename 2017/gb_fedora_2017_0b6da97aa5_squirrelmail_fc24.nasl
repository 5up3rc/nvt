###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for squirrelmail FEDORA-2017-0b6da97aa5
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
  script_oid("1.3.6.1.4.1.25623.1.0.872733");
  script_version("$Revision: 6634 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 09:32:24 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2017-06-03 07:04:06 +0200 (Sat, 03 Jun 2017)");
  script_cve_id("CVE-2017-7692");
  script_tag(name:"cvss_base", value:"9.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for squirrelmail FEDORA-2017-0b6da97aa5");
  script_tag(name: "summary", value: "Check the version of squirrelmail");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of 
  detect NVT and check if the version is vulnerable or not."); 
  script_tag(name: "insight", value: "SquirrelMail is a basic webmail package 
  written in PHP4. It includes built-in pure PHP support for the IMAP and SMTP 
  protocols, and all pages render in pure HTML 4.0 (with no JavaScript) for 
  maximum compatibility across browsers. It has very few requirements and is very 
  easy to configure and install. "); 
  script_tag(name: "affected", value: "squirrelmail on Fedora 24");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-0b6da97aa5");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/AFXDNLFX6XYCTBMHOMFBRMMSCSJV6VAE");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
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

if(release == "FC24")
{

  if ((res = isrpmvuln(pkg:"squirrelmail", rpm:"squirrelmail~1.4.22~19.fc24", rls:"FC24")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
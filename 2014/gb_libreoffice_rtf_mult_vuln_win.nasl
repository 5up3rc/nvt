###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_libreoffice_rtf_mult_vuln_win.nasl 6663 2017-07-11 09:58:05Z teissa $
#
# LibreOffice RTF File Handling Multiple Vulnerabilities Nov14 (Windows)
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:libreoffice:libreoffice";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805108");
  script_version("$Revision: 6663 $");
  script_cve_id("CVE-2014-9093");
  script_bugtraq_id(71313);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-07-11 11:58:05 +0200 (Tue, 11 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-11-28 19:04:12 +0530 (Fri, 28 Nov 2014)");
  script_name("LibreOffice RTF File Handling Multiple Vulnerabilities Nov14 (Windows)");

  script_tag(name: "summary" , value:"This host is installed with LibreOffice
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help of
  detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Flaw exists due to improper handling of
  rtf file.");

  script_tag(name: "impact" , value:"Successful exploitation will allow attackers
  to cause a denial of service (crash) or possibly execute arbitrary code.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"LibreOffice version before 4.3.5
  on Windows");

  script_tag(name: "solution" , value:"Upgrade to LibreOffice 4.3.5
  or later, For updates refer to http://www.libreoffice.org");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"https://bugs.freedesktop.org/show_bug.cgi?id=86449");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_libre_office_detect_win.nasl");
  script_mandatory_keys("LibreOffice/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
libreVer = "";

## Get version
if(!libreVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Check for vulnerable version
if(version_is_less(version:libreVer, test_version:"4.3.5"))
{
  security_message(0);
  exit(0);
}

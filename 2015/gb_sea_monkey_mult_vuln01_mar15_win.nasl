###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_sea_monkey_mult_vuln01_mar15_win.nasl 6141 2017-05-17 09:03:37Z teissa $
#
# SeaMonkey Multiple Vulnerabilities -01 Mar15 (Windows)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:mozilla:seamonkey";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805512");
  script_version("$Revision: 6141 $");
  script_cve_id("CVE-2015-0817", "CVE-2015-0818");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-05-17 11:03:37 +0200 (Wed, 17 May 2017) $");
  script_tag(name:"creation_date", value:"2015-03-27 11:46:34 +0530 (Fri, 27 Mar 2015)");
  script_name("SeaMonkey Multiple Vulnerabilities -01 Mar15 (Windows)");

  script_tag(name: "summary" , value:"This host is installed with SeaMonkey and
  is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help of
  detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws are due to,
  - An out-of-bounds access error in asmjs/AsmJSValidate.cpp within the JavaScript
  Just-in-time Compilation (JIT).
  - An error in docshell/base/nsDocShell.cpp within the SVG format content navigation
  functionality.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to gain elevated privileges and conduct arbitrary code execution.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"SeaMonkey version before 2.33.1 on Windows.");

  script_tag(name: "solution" , value:"Upgrade to SeaMonkey version 2.33.1 or later,
  For updates refer to http://www.mozilla.com/en-US/seamonkey");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"http://www.securitytracker.com/id/1031958");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2015-29");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2015-28");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_seamonkey_detect_win.nasl");
  script_mandatory_keys("Seamonkey/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
smVer = "";

## Get version
if(!smVer = get_app_version(cpe:CPE)){
  exit(0);
}

# Check for vulnerable version
if(version_is_less(version:smVer, test_version:"2.33.1"))
{
  report = 'Installed version: ' + smVer + '\n' +
             'Fixed version:     ' + "2.33.1"  + '\n';
  security_message(data:report);
  exit(0);
}

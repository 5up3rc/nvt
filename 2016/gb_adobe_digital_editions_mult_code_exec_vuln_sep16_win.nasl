###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_digital_editions_mult_code_exec_vuln_sep16_win.nasl 5612 2017-03-20 10:00:41Z teissa $
#
# Adobe Digital Editions Multiple Code Execution Vulnerabilities Sep16 (Windows)
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:adobe:digital_editions";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809246");
  script_version("$Revision: 5612 $");
  script_cve_id("CVE-2016-4256", "CVE-2016-4257", "CVE-2016-4258", "CVE-2016-4259", 
                "CVE-2016-4260", "CVE-2016-4261", "CVE-2016-4262", "CVE-2016-4263",
                "CVE-2016-6980");
  script_bugtraq_id(92928, 93179);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-03-20 11:00:41 +0100 (Mon, 20 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-09-15 11:46:17 +0530 (Thu, 15 Sep 2016)");
  script_tag(name:"qod_type", value:"registry");
  script_name("Adobe Digital Editions Multiple Code Execution Vulnerabilities Sep16 (Windows)");

  script_tag(name: "summary" , value:"This host is installed with Adobe Digital Edition
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight", value:"The multiple flaws are due to,
  - The multiple memory corruption vulnerabilities.
  - An use-after-free vulnerability.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to execute arbitrary code.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Adobe Digital Edition 4.x before 4.5.2 on Windows.");

  script_tag(name: "solution" , value:"Upgrade to Adobe Digital Edition version 4.5.2
  or later.
  For updates refer to http://www.adobe.com/");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://helpx.adobe.com/security/products/Digital-Editions/apsb16-28.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_digital_edition_detect_win.nasl");
  script_mandatory_keys("AdobeDigitalEdition/Win/Ver");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

## Variable Initialization
digitalVer = "";

## Get version
if(!digitalVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Check Adobe Digital Edition vulnerable versions
if(version_in_range(version:digitalVer, test_version:"4.0.0", test_version2:"4.5.1"))
{
  report = report_fixed_ver(installed_version:digitalVer, fixed_version:"4.5.2");
  security_message(data:report);
  exit(0);
}

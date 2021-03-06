###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_air_mult_vuln_nov15_macosx.nasl 6170 2017-05-19 09:03:42Z teissa $
#
# Adobe Air Multiple Vulnerabilities Nov15 (Mac OS X)
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

CPE = "cpe:/a:adobe:adobe_air";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806620");
  script_version("$Revision: 6170 $");
  script_cve_id("CVE-2015-7651", "CVE-2015-7652", "CVE-2015-7653", "CVE-2015-7654",
                "CVE-2015-7655", "CVE-2015-7656", "CVE-2015-7657", "CVE-2015-7658",
                "CVE-2015-7659", "CVE-2015-7660", "CVE-2015-7661", "CVE-2015-7662",
                "CVE-2015-7663", "CVE-2015-8042", "CVE-2015-8043", "CVE-2015-8044",
                "CVE-2015-8046");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-05-19 11:03:42 +0200 (Fri, 19 May 2017) $");
  script_tag(name:"creation_date", value:"2015-11-13 18:10:33 +0530 (Fri, 13 Nov 2015)");
  script_name("Adobe Air Multiple Vulnerabilities Nov15 (Mac OS X)");

  script_tag(name: "summary" , value: "This host is installed with Adobe Air
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value: "Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value: "Multiple flaws exist due to,
  - A type confusion error.
  - Multiple use-after-free errors.
  - Another unspecified error.");

  script_tag(name: "impact" , value: "Successful exploitation will allow attackers
  to bypass security restrictions and execute arbitrary code on the affected
  system.

  Impact Level: System/Application.");

  script_tag(name: "affected" , value:"Adobe Air versions before
  19.0.0.241 on Mac OS X.");

  script_tag(name: "solution" , value:"Upgrade to Adobe Air version
  19.0.0.241 or later.
  For updates refer to http://get.adobe.com/air");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name: "URL" , value :"https://helpx.adobe.com/security/products/flash-player/apsb15-28.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_adobe_prdts_detect_macosx.nasl");
  script_mandatory_keys("Adobe/Air/MacOSX/Version");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
airVer = "";

## Get version
if(!airVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Grep for vulnerable version
if(version_is_less(version:airVer, test_version:"19.0.0.241"))
{
  report = 'Installed version: ' + airVer + '\n' +
           'Fixed version:     ' + "19.0.0.241" + '\n';
  security_message(data:report);
  exit(0);
}

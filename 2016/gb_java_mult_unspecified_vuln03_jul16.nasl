###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_java_mult_unspecified_vuln03_jul16.nasl 61127 2016-07-25 10:41:22 Jul$
#
# Oracle Java SE Multiple Unspecified Vulnerabilities-03 July 2016 (Windows)
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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

CPE = "cpe:/a:oracle:jre";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.808623");
  script_version("$Revision: 5759 $");
  script_cve_id("CVE-2016-3552", "CVE-2016-3587", "CVE-2016-3598", "CVE-2016-3610");
  script_bugtraq_id(91904, 91918, 92000, 91930);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-03-29 11:01:08 +0200 (Wed, 29 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-07-25 11:28:15 +0530 (Mon, 25 Jul 2016)");
  script_name("Oracle Java SE Multiple Unspecified Vulnerabilities-03 July 2016 (Windows)");

  script_tag(name: "summary" , value:"The host is installed with Oracle Java SE
  and is prone to multiple unspecified vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws are due to,
  - A flaw in the Hotspot component.
  - A flaw in the JavaFX component.
  - A flaw in the Install component.
  - A flaw in the Libraries component");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote user
  to access and modify data on the target system, can cause denial of service
  conditions on the target system, a remote or local user can obtain elevated
  privileges on the  target system, also a local user can modify data on the
  target system.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Oracle Java SE 8 update 92 and prior
  on Windows.");

  script_tag(name: "solution" , value:"Apply the patch from below link,
  http://www.oracle.com/technetwork/security-advisory/cpujul2016-2881720.html");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/security-advisory/cpujul2016-2881720.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_java_prdts_detect_win.nasl");
  script_mandatory_keys("Sun/Java/JRE/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
jreVer = "";

## Get version
if(!jreVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(jreVer =~ "^(1\.8)")
{
  jreVer = ereg_replace(pattern:"[a-z]+_|-", string:jreVer, replace: ".");

  ##Check for Oracle Java SE Versions
  if(version_in_range(version:jreVer, test_version:"1.8.0", test_version2:"1.8.0.92"))
  {
    report = report_fixed_ver( installed_version:jreVer, fixed_version:"Apply the patch");
    security_message(data:report);
    exit(0);
  }
}

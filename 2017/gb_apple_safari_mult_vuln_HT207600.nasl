###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_safari_mult_vuln_HT207600.nasl 5821 2017-03-31 13:22:18Z antu123 $
#
# Apple Safari Multiple Vulnerabilities-HT207600  
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:apple:safari";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810727");
  script_version("$Revision: 5821 $");
  script_cve_id("CVE-2016-9642", "CVE-2016-9643", "CVE-2017-2364", "CVE-2017-2367",
                "CVE-2017-2377", "CVE-2017-2378", "CVE-2017-2385", "CVE-2017-2386",
                "CVE-2017-2389", "CVE-2017-2394", "CVE-2017-2395", "CVE-2017-2396",
                "CVE-2017-2405", "CVE-2017-2415", "CVE-2017-2419", "CVE-2017-2424",
                "CVE-2017-2433", "CVE-2017-2442", "CVE-2017-2445", "CVE-2017-2446",
                "CVE-2017-2447", "CVE-2017-2453", "CVE-2017-2454", "CVE-2017-2455",
                "CVE-2017-2459", "CVE-2017-2460", "CVE-2017-2463", "CVE-2017-2464",
                "CVE-2017-2465", "CVE-2017-2466", "CVE-2017-2468", "CVE-2017-2469",
                "CVE-2017-2470", "CVE-2017-2471", "CVE-2017-2475", "CVE-2017-2476",
                "CVE-2017-2479", "CVE-2017-2480", "CVE-2017-2481");
  script_bugtraq_id(94554, 94559, 95725, 97130, 97129, 97136, 97143, 97176, 97133);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-03-31 15:22:18 +0200 (Fri, 31 Mar 2017) $");
  script_tag(name:"creation_date", value:"2017-03-31 16:41:59 +0530 (Fri, 31 Mar 2017)");
  script_name("Apple Safari Multiple Vulnerabilities-HT207600");

  script_tag(name: "summary" , value:"This host is installed with Apple Safari
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws exists due to,
  - The multiple memory corruption issues,
  - A state management issue,
  - A spoofing and denial-of-service issue existed in the handling
    of HTTP authentication,
  - A spoofing issue existed in the handling of FaceTime prompts,
  - A keychain handling issue in keychain item management,
  - A prototype access issue in exception handling,
  - Multiple memory corruption issues in input validation,
  - Multiple memory corruption issues in memory handling,
  - A type confusion issue in memory handling,
  - An access issue existed in Content Security Policy,
  - An uncontrolled resource consumption issue in regex processing,
  - An information disclosure issue existed in the processing of OpenGL shaders, 
  - A memory corruption issue in input validation,
  - Multiple validation issues existed in the handling of page loading,
  - A validation issue existed in the handling of page loading,
  - A logic issue existed in the handling of frame objects,
  - A logic issue existed in the handling of strict mode functions.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to disclose sensitive information and can also lead to arbitrary 
  code execution.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Apple Safari versions before 10.1");

  script_tag(name: "solution" , value:"Upgrade to Apple Safari 10.1 or later,
  For updates refer to http://www.apple.com/support.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name : "URL" , value : "https://support.apple.com/en-in/HT207600");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("macosx_safari_detect.nasl");
  script_mandatory_keys("AppleSafari/MacOSX/Version");
  exit(0);
}


# Code starts from here

include("version_func.inc");
include("host_details.inc");

# Variable Initialization
safVer = "";

## Get Apple Safari version
if(!safVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Check for Apple Safari Versions less than 10.1
if(version_is_less(version:safVer, test_version:"10.1"))
{
  report = report_fixed_ver(installed_version:safVer, fixed_version:"10.1");
  security_message(data:report);
  exit(0);
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_firefox_esr_mult_vuln01_aug14_macosx.nasl 39607 2014-08-07 09:58:30Z Aug$
#
# Mozilla Firefox ESR Multiple Vulnerabilities-01 August14 (Mac OS X)
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

CPE = "cpe:/a:mozilla:firefox_esr";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804733");
  script_version("$Revision: 6663 $");
  script_cve_id("CVE-2014-1547", "CVE-2014-1555", "CVE-2014-1557",
                "CVE-2014-1544", "CVE-2014-1556");
  script_bugtraq_id(68811, 68814, 68824, 68816, 68822);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-07-11 11:58:05 +0200 (Tue, 11 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-08-07 11:22:55 +0530 (Thu, 07 Aug 2014)");
  script_name("Mozilla Firefox ESR Multiple Vulnerabilities-01 August14 (Mac OS X)");

  tag_summary =
"This host is installed with Mozilla Firefox ESR and is prone to multiple
vulnerabilities.";

  tag_vuldetect =
"Get the installed version with the help of detect NVT and check the version
is vulnerable or not.";

  tag_insight =
"Multiple flaws are due to,
- A use-after-free error related to ordering of control messages for Web Audio.
- A use-after-free error when handling the FireOnStateChange event.
- An unspecified error when using the Cesium JavaScript library to generate
  WebGL content.
and Some unspecified errors.";

  tag_impact =
"Successful exploitation will allow attackers to bypass certain security
restrictions and compromise a user's system.

Impact Level: System/Application";

  tag_affected =
"Mozilla Firefox ESR version 24.x before 24.7 on Mac OS X";

  tag_solution =
"Upgrade to Mozilla Firefox ESR version 24.7 or later,
For updates refer to http://www.mozilla.com/en-US/firefox/all.html";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/59803");
  script_xref(name : "URL" , value : "https://www.mozilla.org/security/announce/2014/mfsa2014-56.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_mozilla_prdts_detect_macosx.nasl");
  script_mandatory_keys("Mozilla/Firefox-ESR/MacOSX/Version");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
ffVer = "";

## Get version
if(!ffVer = get_app_version(cpe:CPE)){
  exit(0);
}

# Check for vulnerable version
if(ffVer =~ "^24\." && version_in_range(version:ffVer,
                       test_version:"24.0", test_version2:"24.6"))
{
  security_message(0);
  exit(0);
}

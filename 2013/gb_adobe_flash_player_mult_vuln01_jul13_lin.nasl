###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_player_mult_vuln01_jul13_lin.nasl 6104 2017-05-11 09:03:48Z teissa $
#
# Adobe Flash Player Multiple Vulnerabilities-01 July13 (Linux)
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "
  Impact Level: System/Application";

if(description)
{
  script_id(803833);
  script_version("$Revision: 6104 $");
  script_cve_id("CVE-2013-3347", "CVE-2013-3345", "CVE-2013-3344");
  script_bugtraq_id(61048, 61045, 61043);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-05-11 11:03:48 +0200 (Thu, 11 May 2017) $");
  script_tag(name:"creation_date", value:"2013-07-25 17:46:27 +0530 (Thu, 25 Jul 2013)");
  script_name("Adobe Flash Player Multiple Vulnerabilities-01 July13 (Linux)");

  tag_summary =
"This host is installed with Adobe Flash Player and is prone to multiple
vulnerabilities.";

  tag_vuldetect =
"Get the installed version with the help of detect NVT and check the version
is vulnerable or not.";

  tag_insight =
"Multiple unspecified error exists and an integer overflow error exists
when resampling a PCM buffer.";

  tag_impact =
"Successful exploitation will allow remote attackers to execute arbitrary
code on the target system will cause heap-based buffer overflow or cause
memory corruption via unspecified vectors.";

  tag_affected =
"Adobe Flash Player before 11.2.202.297 on Linux";

  tag_solution =
"Update to Adobe Flash Player version 11.2.202.297 or later,
For updates refer to  http://get.adobe.com/flashplayer";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name:"qod_type", value:"executable_version");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/53975");
  script_xref(name : "URL" , value : "http://www.adobe.com/support/security/bulletins/apsb13-17.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_flash_player_detect_lin.nasl");
  script_mandatory_keys("AdobeFlashPlayer/Linux/Ver");
  exit(0);
}


include("version_func.inc");

## Variable Initialization
playerVer = "";

## Check for Adobe Flash Player
playerVer = get_kb_item("AdobeFlashPlayer/Linux/Ver");
if(playerVer)
{
  ## Grep for vulnerable version
  if(version_is_less(version:playerVer, test_version:"11.2.202.297"))
  {
    security_message(0);
    exit(0);
  }
}

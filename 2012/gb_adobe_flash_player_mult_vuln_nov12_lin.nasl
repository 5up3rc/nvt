###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_player_mult_vuln_nov12_lin.nasl 5940 2017-04-12 09:02:05Z teissa $
#
# Adobe Flash Player Multiple Vulnerabilities - November12 (Linux)
#
# Authors:
# Rachana Shetty <srachana@secpod.com>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will allow remote attackers to gain sensitive
  information or execute arbitrary code in the context of the affected
  application.
  Impact Level: System/Application";
tag_affected = "Adobe Flash Player version before 10.3.183.43, 11.x before 11.2.202.251 on Linux";
tag_insight = "Multiple unspecified errors exists due to memory corruption, buffer overflow
  that could lead to code execution.";
tag_solution = "Update to Adobe Flash Player version 10.3.183.43 or 11.2.202.251 or later,
  For updates refer to http://get.adobe.com/flashplayer/";
tag_summary = "This host is installed with Adobe Flash Player and is prone to
  multiple vulnerabilities.";

if(description)
{
  script_id(803046);
  script_version("$Revision: 5940 $");
  script_cve_id("CVE-2012-5274", "CVE-2012-5275", "CVE-2012-5276", "CVE-2012-5277",
                "CVE-2012-5278", "CVE-2012-5279", "CVE-2012-5280");
  script_bugtraq_id(56412);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-04-12 11:02:05 +0200 (Wed, 12 Apr 2017) $");
  script_tag(name:"creation_date", value:"2012-11-08 18:02:59 +0530 (Thu, 08 Nov 2012)");
  script_name("Adobe Flash Player Multiple Vulnerabilities - November12 (Linux)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/51213");
  script_xref(name : "URL" , value : "http://www.adobe.com/support/security/bulletins/apsb12-24.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2012 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_flash_player_detect_lin.nasl");
  script_require_keys("AdobeFlashPlayer/Linux/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"executable_version");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

## Variable Initialization
playerVer = "";

# Check for Adobe Flash Player
playerVer = get_kb_item("AdobeFlashPlayer/Linux/Ver");
if(playerVer && playerVer =~ ",")
{
  playerVer = ereg_replace(pattern:",", string:playerVer, replace: ".");
}

if(playerVer)
{
  # Grep for version less than 10.3.183.43 and 11.x less than 11.2.202.251
  if(version_is_less(version: playerVer, test_version:"10.3.183.43") ||
     version_in_range(version: playerVer, test_version:"11.0", test_version2:"11.2.202.250")){
    security_message(0);
  }
}

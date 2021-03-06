###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_player_untrusted_search_path_vuln_win.nasl 5263 2017-02-10 13:45:51Z teissa $
#
# Adobe Flash Player Untrusted search path vulnerability (Windows)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will allow attackers to trigger user to
save a malicious dll file in users Desktop.

Impact Level: Application/System.";

tag_affected = "Adobe Flash Player version 10.1.0 through 10.1.82.76";

tag_solution = "Upgrade to Adobe Flash Player version 10.1.102.64 or later.
For updates refer to http://www.adobe.com/support/flashplayer/downloads.html";

tag_summary = "This host is installed with Adobe Flash Player and is prone to
untrusted search path vulnerability.";

tag_insight = "The application passes an insufficiently qualified path in
loading its external libraries 'dwmapi.dll'.";

if(description)
{
  script_id(801465);
  script_version("$Revision: 5263 $");
  script_tag(name:"last_modification", value:"$Date: 2017-02-10 14:45:51 +0100 (Fri, 10 Feb 2017) $");
  script_tag(name:"creation_date", value:"2010-10-28 11:50:37 +0200 (Thu, 28 Oct 2010)");
  script_cve_id("CVE-2010-3976");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Adobe Flash Player Untrusted search path vulnerability (windows)");
  script_xref(name : "URL" , value : "http://www.derkeiler.com/Mailing-Lists/securityfocus/bugtraq/2010-09/msg00070.html");
  script_xref(name : "URL" , value : "http://core.yehg.net/lab/pr0js/advisories/dll_hijacking/[flash_player]_10.1.x_insecure_dll_hijacking_(dwmapi.dll)");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_flash_player_detect_win.nasl");
  script_require_keys("AdobeFlashPlayer/Win/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

# Check for Adobe Flash Player
playerVer = get_kb_item("AdobeFlashPlayer/Win/Ver");
if(playerVer != NULL)
{
  if(version_in_range(version:playerVer, test_version:"10.1.0", test_version2:"10.1.82.76")){
    security_message(0);
  }
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_http_session_info_disc_vuln_win.nasl 5963 2017-04-18 09:02:14Z teissa $
#
# Google Chrome 'HTTP session' Information Disclosure Vulnerability (Windows)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
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

tag_impact = "Successful exploitation could allow attackers to gain sensitive information.
  Impact Level: Application";
tag_affected = "Google Chrome version prior to 17.0.963.56 and 19.x before 19.0.1036.7 on Windows";
tag_insight = "The flaw is due to 'translate/translate_manager.cc', which uses
  HTTP session to exchange data for translation, which allows remote attackers
  to obtain sensitive information by sniffing the network.";
tag_solution = "Upgrade to the Google Chrome 17.0.963.56 or 19.0.1036.7 or later,
  For updates refer to http://www.google.com/chrome";
tag_summary = "The host is installed with Google Chrome and is prone to
  information disclosure vulnerability.";

if(description)
{
  script_id(802700);
  script_version("$Revision: 5963 $");
  script_cve_id("CVE-2011-3022");
  script_bugtraq_id(52031);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-04-18 11:02:14 +0200 (Tue, 18 Apr 2017) $");
  script_tag(name:"creation_date", value:"2012-02-21 15:33:27 +0530 (Tue, 21 Feb 2012)");
  script_name("Google Chrome 'HTTP session' Information Disclosure Vulnerability (Windows)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/48016/");
  script_xref(name : "URL" , value : "http://googlechromereleases.blogspot.in/2012/02/chrome-stable-update.html");

  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_google_chrome_detect_win.nasl");
  script_require_keys("GoogleChrome/Win/Ver");
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

## Variable Initialization
chromeVer = NULL;

## Get the version from KB
chromeVer = get_kb_item("GoogleChrome/Win/Ver");
if(!chromeVer){
  exit(0);
}

## Check for Google Chrome Versions prior to 17.0.963.56
if(version_is_less(version:chromeVer, test_version:"17.0.963.56") ||
   version_in_range(version:chromeVer, test_version:"19.0",
                                       test_version2:"19.0.1036.6")){
  security_message(0);
}

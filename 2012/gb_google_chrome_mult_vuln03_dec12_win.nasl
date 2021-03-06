###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_mult_vuln03_dec12_win.nasl 5963 2017-04-18 09:02:14Z teissa $
#
# Google Chrome Multiple Vulnerabilities-03 Dec2012 (Windows)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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

tag_impact = "Successful exploitation will allow attackers to bypass certain security
  restrictions, execute arbitrary code in the context of the browser or
  cause a denial of service.
  Impact Level: System/Application";
tag_affected = "Google Chrome version prior to 23.0.1271.97 on Windows";
tag_insight = "- An use-after-free error exists in visibility events and in URL loader.
  - Error exists within the instantiation of the Chromoting client plug-in,
    history navigation and AAC decoding.
  - An integer overflow error exists within handling of PPAPI image buffers.";
tag_solution = "Upgrade to the Google Chrome 23.0.1271.97 or later,
  For updates refer to http://www.google.com/chrome";
tag_summary = "This host is installed with Google Chrome and is prone to multiple
  vulnerabilities.";

if(description)
{
  script_id(803127);
  script_version("$Revision: 5963 $");
  script_cve_id("CVE-2012-5139", "CVE-2012-5140", "CVE-2012-5141", "CVE-2012-5142",
                "CVE-2012-5143", "CVE-2012-5144");
  script_bugtraq_id(56903);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-04-18 11:02:14 +0200 (Tue, 18 Apr 2017) $");
  script_tag(name:"creation_date", value:"2012-12-14 13:26:00 +0530 (Fri, 14 Dec 2012)");
  script_name("Google Chrome Multiple Vulnerabilities-03 Dec2012 (Windows)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/51549/");
  script_xref(name : "URL" , value : "http://googlechromereleases.blogspot.in/2012/12/stable-channel-update.html");

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
chromeVer = "";

## Get the version from KB
chromeVer = get_kb_item("GoogleChrome/Win/Ver");
if(!chromeVer){
  exit(0);
}

## Check for Google Chrome Versions prior to 23.0.1271.97
if(version_is_less(version:chromeVer, test_version:"23.0.1271.97")){
  security_message(0);
}

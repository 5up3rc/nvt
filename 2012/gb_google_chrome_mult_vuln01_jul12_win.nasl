###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_mult_vuln01_jul12_win.nasl 5956 2017-04-14 09:02:12Z teissa $
#
# Google Chrome Multiple Vulnerabilities(01) - July 12 (Windows)
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

tag_impact = "Successful exploitation could allow attackers to bypass certain security
  restrictions, execute arbitrary code in the context of the browser or
  cause a denial of service.
  Impact Level: System/Application";
tag_affected = "Google Chrome version prior to 20.0.1132.57 on Windows";
tag_insight = "- A use-after-free error exists within counter handling and within layout
    height tracking.
  - An unspecified error when handling JavaScript within PDFs can be
    exploited to access certain objects.";
tag_solution = "Upgrade to the Google Chrome 20.0.1132.57 or later,
  For updates refer to http://www.google.com/chrome";
tag_summary = "This host is installed with Google Chrome and is prone to multiple
  vulnerabilities.";

if(description)
{
  script_id(802917);
  script_version("$Revision: 5956 $");
  script_cve_id("CVE-2012-2842", "CVE-2012-2843", "CVE-2012-2844");
  script_bugtraq_id(54386);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-04-14 11:02:12 +0200 (Fri, 14 Apr 2017) $");
  script_tag(name:"creation_date", value:"2012-07-24 11:42:01 +0530 (Tue, 24 Jul 2012)");
  script_name("Google Chrome Multiple Vulnerabilities(01) - July 12 (Windows)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/49906");
  script_xref(name : "URL" , value : "http://securitytracker.com/id/1027249");
  script_xref(name : "URL" , value : "http://googlechromereleases.blogspot.in/2012/07/stable-channel-update.html");

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

## Check for Google Chrome Versions prior to 20.0.1132.57
if(version_is_less(version:chromeVer, test_version:"20.0.1132.57")){
  security_message(0);
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_mult_vuln01_mar15_win.nasl 6229 2017-05-29 09:04:10Z teissa $
#
# Google Chrome Multiple Vulnerabilities-01 Mar15 (Windows)
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

CPE = "cpe:/a:google:chrome";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805503");
  script_version("$Revision: 6229 $");
  script_cve_id("CVE-2015-1213", "CVE-2015-1214", "CVE-2015-1215", "CVE-2015-1216",
                "CVE-2015-1217", "CVE-2015-1218", "CVE-2015-1219", "CVE-2015-1220",
                "CVE-2015-1221", "CVE-2015-1222", "CVE-2015-1223", "CVE-2015-1224",
                "CVE-2015-1225", "CVE-2015-1226", "CVE-2015-1227", "CVE-2015-1228",
                "CVE-2015-1229", "CVE-2015-1230", "CVE-2015-1231", "CVE-2015-1232",
                "CVE-2015-1238", "CVE-2015-1239", "CVE-2015-1245", "CVE-2014-9689",
                "CVE-2011-5319");
  script_bugtraq_id(72901, 72916);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-05-29 11:04:10 +0200 (Mon, 29 May 2017) $");
  script_tag(name:"creation_date", value:"2015-03-13 14:45:49 +0530 (Fri, 13 Mar 2015)");
  script_name("Google Chrome Multiple Vulnerabilities-01 Mar15 (Windows)");

  script_tag(name: "summary" , value:"The host is installed with Google Chrome
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws exists. For details refer
  reference section.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to dereference already freed memory, potentially execute arbitrary code,
  potentially disclose memory contents, gain unauthorized access to information,
  cause a denial of service, conduct cookie-injection attacks and other unspecified
  impacts.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Google Chrome version prior to
  41.0.2272.76 on Windows.");

  script_tag(name: "solution" , value:"Upgrade to Google Chrome version
  41.0.2272.76 or later, For updates refer to http://www.google.com/chrome");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name : "URL" , value : "https://code.google.com/p/chromium/issues/detail?id=444957");
  script_xref(name : "URL" , value : "https://code.google.com/p/chromium/issues/detail?id=463349");
  script_xref(name : "URL" , value : "googlechromereleases.blogspot.com/2015/03/stable-channel-update.html");

  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_google_chrome_detect_win.nasl");
  script_mandatory_keys("GoogleChrome/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
chromeVer = "";

## Get version
if(!chromeVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Grep for vulnerable version
if(version_is_less(version:chromeVer, test_version:"41.0.2272.76"))
{
  report = 'Installed version: ' + chromeVer + '\n' +
           'Fixed version:     41.0.2272.76'  + '\n';
  security_message(data:report);
  exit(0);
}

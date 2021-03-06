###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_mult_vuln_nov14_win.nasl 6735 2017-07-17 09:56:49Z teissa $
#
# Google Chrome Multiple Vulnerabilities - 01 November14 (Windows)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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

CPE = "cpe:/a:google:chrome";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804892");
  script_version("$Revision: 6735 $");
  script_cve_id("CVE-2014-7900", "CVE-2014-7901", "CVE-2014-7902", "CVE-2014-7903",
                "CVE-2014-7904", "CVE-2014-7906", "CVE-2014-7907", "CVE-2014-7908",
                "CVE-2014-7909", "CVE-2014-7910", "CVE-2014-7899");
  script_bugtraq_id(71163, 71158, 71165, 71164, 71166, 71159, 71170, 71168,
                    71167, 71161, 71160);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-07-17 11:56:49 +0200 (Mon, 17 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-11-25 18:03:03 +0530 (Tue, 25 Nov 2014)");
  script_name("Google Chrome Multiple Vulnerabilities - 01 November14 (Windows)");

  script_tag(name: "summary" , value:"The host is installed with Google Chrome
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help of
  detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple Flaws are due to,
  - A use-after-free error in pdfium.
  - An integer overflow error in pdfium.
  - Another use-after-free error in pdfium.
  - An unspecified error in pdfium.
  - An unspecified error in Skia.
  - A use-after-free error in pepper plugins.
  - Multiple use-after-free errors in blink.
  - An integer overflow error in media.
  - An unspecified error in Skia.
  - Other Multiple unspecified errors.
  - An unspecified error that can be exploited to spoof the address bar.");

  script_tag(name: "impact" , value:"Successful exploitation will allow attackers
  to disclose potentially sensitive information, conduct spoofing attacks,
  bypass certain security restrictions, and compromise a user's system.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Google Chrome version prior to 39.0.2171.65
  on Windows.");

  script_tag(name: "solution" , value:"Upgrade to Google Chrome version 39.0.2171.65
  or later, For updates refer to http://www.google.com/chrome");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/62546");
  script_xref(name : "URL" , value : "http://googlechromereleases.blogspot.in/2014/11/stable-channel-update_18.html");

  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
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
if(version_is_less(version:chromeVer, test_version:"39.0.2171.65"))
{
  security_message(0);
  exit(0);
}

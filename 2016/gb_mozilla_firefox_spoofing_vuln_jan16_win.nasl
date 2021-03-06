###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_firefox_spoofing_vuln_jan16_win.nasl 5745 2017-03-28 09:01:00Z teissa $
#
# Mozilla Firefox Spoofing Vulnerability - Jan16 (Windows)
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:mozilla:firefox";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806952");
  script_version("$Revision: 5745 $");
  script_cve_id("CVE-2015-7575");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-03-28 11:01:00 +0200 (Tue, 28 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-01-14 10:52:36 +0530 (Thu, 14 Jan 2016)");
  script_name("Mozilla Firefox Spoofing Vulnerability - Jan16 (Windows)");

  script_tag(name: "summary" , value:"This host is installed with Mozilla
  Firefox and is prone to spoofing vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw exists due to 
  Network Security Services (NSS) does not reject MD5 signatures in Server Key 
  Exchange messages in TLS 1.2 Handshake Protocol traffic.");

  script_tag(name: "impact" , value:"Successful exploitation will allow 
  man-in-the-middle attackers to spoof servers by triggering a collision.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Mozilla Firefox version before 43.0.2 on
  Windows.");

  script_tag(name: "solution" , value:"Upgrade to Mozilla Firefox version 43.0.2
  or later, For updates refer to http://www.mozilla.com/en-US/firefox/all.html");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2015-150/");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_firefox_detect_win.nasl");
  script_mandatory_keys("Firefox/Win/Ver");
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
if(version_is_less(version:ffVer, test_version:"43.0.2"))
{
  report = 'Installed version: ' + ffVer + '\n' +
           'Fixed version:     ' + "43.0.2" + '\n';
  security_message(data:report);
  exit(0);
}

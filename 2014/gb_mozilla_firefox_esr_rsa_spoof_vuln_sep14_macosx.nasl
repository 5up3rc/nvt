#############################################################################/##
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_firefox_esr_rsa_spoof_vuln_sep14_macosx.nasl 6692 2017-07-12 09:57:43Z teissa $
#
# Mozilla Firefox ESR RSA Spoof Vulnerability September14 (Macosx)
#
# Authors:
# Deepmala <kdeepmala@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.804925");
  script_version("$Revision: 6692 $");
  script_cve_id("CVE-2014-1568");
  script_bugtraq_id(70116);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-07-12 11:57:43 +0200 (Wed, 12 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-09-30 09:47:58 +0530 (Tue, 30 Sep 2014)");

  script_name("Mozilla Firefox ESR RSA Spoof Vulnerability September14 (Macosx)");

  script_tag(name: "summary" , value:"This host is installed with Mozilla Firefox ESR
  and is prone to spoof vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help of
  detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Flaw exists due to improper handling of
  ASN.1 values while parsing RSA signature");

  script_tag(name: "impact" , value:"Successful exploitation will allow attackers
  to conduct spoofing attacks.

  Impact Level: Application");

  script_tag(name: "affected" , value:"Mozilla Firefox ESR 24.x before 24.8.1 and
  31.x before 31.1.1 on Macosx");

  script_tag(name: "solution" , value:"Upgrade to Mozilla Firefox ESR version 24.8.1
  or 31.1.1 or later, For updates refer to http://www.mozilla.com/en-US/firefox/all.html");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://secunia.com/advisories/61540");
  script_xref(name:"URL", value:"https://bugzilla.mozilla.org/show_bug.cgi?id=1069405");
  script_xref(name:"URL", value:"https://www.mozilla.org/security/announce/2014/mfsa2014-73.html");

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
if(version_in_range(version:ffVer, test_version:"24.0", test_version2:"24.8.0")||
   version_in_range(version:ffVer, test_version:"31.0", test_version2:"31.1.0"))
{
  security_message(0);
  exit(0);
}

###############################################################################
# OpenVAS Vulnerability Test
# Id: gb_mozilla_firefox_mfsa_2017-08_2017-08_macosx.nasl 32268 2016-02-24 14:01:01Z antu123 $
#
# Mozilla Firefox Security Updates(mfsa_2017-08_2017-08)-MAC OS X
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.810820");
  script_version("$Revision: 5637 $");
  script_cve_id("CVE-2017-5428");
  script_bugtraq_id(96959);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-03-21 08:30:30 +0100 (Tue, 21 Mar 2017) $");
  script_tag(name:"creation_date", value:"2017-03-20 13:41:26 +0530 (Mon, 20 Mar 2017)");
  script_name("Mozilla Firefox Security Updates(mfsa_2017-08_2017-08)-MAC OS X");

  script_tag(name: "summary" , value:"This host is installed with Mozilla Firefox
  and is prone to buffer overflow vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw exists due to an integer overflow
  in createImageBitmap().");

  script_tag(name: "impact" , value:"Successful exploitation of this vulnerability
  will allow remote attackers to cause buffer overflow.

  Impact Level: Application.");

  script_tag(name: "affected" , value:"Mozilla Firefox version before 52.0.1
  on MAC OS X.");

  script_tag(name: "solution" , value:"Upgrade to Mozilla Firefox version 52.0.1
  or later, For updates refer to http://www.mozilla.com/en-US/firefox/all.html");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2017-08");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_mozilla_prdts_detect_macosx.nasl");
  script_mandatory_keys("Mozilla/Firefox/MacOSX/Version");
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
if(version_is_less(version:ffVer, test_version:"52.0.1"))
{
  report = report_fixed_ver(installed_version:ffVer, fixed_version:"52.0.1");
  security_message(data:report);
  exit(0);
}

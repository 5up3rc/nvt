###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wireshark_mult_dos_vuln01_july15_macosx.nasl 6415 2017-06-23 09:59:48Z teissa $
#
# Wireshark Multiple Denial-of-Service Vulnerabilities-01 July15 (Mac OS X)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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

CPE = "cpe:/a:wireshark:wireshark";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805697");
  script_version("$Revision: 6415 $");
  script_cve_id("CVE-2015-4652", "CVE-2015-4651");
  script_bugtraq_id(75316, 75317);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-06-23 11:59:48 +0200 (Fri, 23 Jun 2017) $");
  script_tag(name:"creation_date", value:"2015-07-30 13:20:52 +0530 (Thu, 30 Jul 2015)");
  script_name("Wireshark Multiple Denial-of-Service Vulnerabilities-01 July15 (Mac OS X)");

  script_tag(name: "summary" , value:"This host is installed with Wireshark
  and is prone to multiple denial of service vulnerabilities.");

  script_tag(name: "vuldetect" , value: "Get the installed version with the
  help of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value: "Multiple flaws exists due to,
  - The 'epan/dissectors/packet-gsm_a_dtap.c' script in the GSM DTAP dissector
    does not properly validate digit characters.
  - The 'dissect_wccp2r1_address_table_info' function in
    'epan/dissectors/packet-wccp.c' script in the WCCP dissector does not
     properly  determine whether enough memory is available for storing IP
     address strings.");

  script_tag(name: "impact" , value: "Successful exploitation will allow remote
  attackers to conduct denial of service attack.

  Impact Level: Application");

  script_tag(name: "affected" , value: "Wireshark version 1.12.x before 1.12.6
  on Mac OS X");

  script_tag(name: "solution" , value: "Upgrade Wireshark to version 1.12.6 or
  later, For updates refer to https://www.wireshark.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name : "URL" , value : "https://www.wireshark.org/security/wnpa-sec-2015-19.html");
  script_xref(name : "URL" , value : "https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=11201");
  script_xref(name : "URL" , value : "https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=11153");

  script_category(ACT_GATHER_INFO);
  script_family("Denial of Service");
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_dependencies("gb_wireshark_detect_macosx.nasl");
  script_mandatory_keys("Wireshark/MacOSX/Version");
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

## Variable Initialization
wirversion = "";

## Get the version
if(!wirversion = get_app_version(cpe:CPE)){
  exit(0);
}

## Check the vulnerable version is 1.12.x before 1.12.6
if(version_in_range(version:wirversion, test_version:"1.12.0", test_version2:"1.12.5"))
{
  report = 'Installed Version: ' + wirversion + '\n' +
           'Fixed Version:     1.12.6 \n';
  security_message(data:report);
  exit(0);
}


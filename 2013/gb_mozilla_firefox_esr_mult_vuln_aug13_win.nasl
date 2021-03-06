###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_firefox_esr_mult_vuln_aug13_win.nasl 6093 2017-05-10 09:03:18Z teissa $
#
# Mozilla Firefox ESR Multiple Vulnerabilities - August 13 (Windows)
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "
  Impact Level: System/Application";

if (description)
{
  script_id(803854);
  script_version("$Revision: 6093 $");
  script_cve_id("CVE-2013-1701", "CVE-2013-1706", "CVE-2013-1707", "CVE-2013-1709",
                "CVE-2013-1710", "CVE-2013-1712", "CVE-2013-1713", "CVE-2013-1714",
                "CVE-2013-1717");
  script_bugtraq_id(61641);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-05-10 11:03:18 +0200 (Wed, 10 May 2017) $");
  script_tag(name:"creation_date", value:"2013-08-08 15:27:01 +0530 (Thu, 08 Aug 2013)");
  script_name("Mozilla Firefox ESR Multiple Vulnerabilities - August 13 (Windows)");

  tag_summary =
"The host is installed with Mozilla Firefox ESR and is prone to multiple
vulnerabilities.";

  tag_vuldetect =
"Get the installed version with the help of detect NVT and check the version
is vulnerable or not.";

  tag_insight =
"Multiple flaws due to,
- Error in crypto.generateCRMFRequest function.
- Does not properly restrict local-filesystem access by Java applets.
- Multiple Unspecified vulnerabilities in the browser engine.
- Multiple untrusted search path vulnerabilities updater.exe.
- Web Workers implementation is not properly restrict XMLHttpRequest calls.
- Usage of incorrect URI within unspecified comparisons during enforcement
  of the Same Origin Policy.
- Improper handling of interaction between FRAME elements and history.
- Stack-based buffer overflow in Mozilla Updater and maintenanceservice.exe.";

  tag_impact =
"Successful exploitation will allow attackers to execute arbitrary code,
obtain potentially sensitive information, gain escalated privileges, bypass
security restrictions, perform unauthorized actions and other attacks may
also be possible.";

  tag_affected =
"Mozilla Firefox ESR 17.x before 17.0.8 on Windows";

  tag_solution =
"Upgrade to version 17.0.8 or later,
For updates refer to http://www.mozilla.com/en-US/firefox/all.html";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/54413");
  script_xref(name : "URL" , value : "https://bugzilla.mozilla.org/show_bug.cgi?id=406541");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2013/mfsa2013-75.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_firefox_detect_win.nasl");
  script_mandatory_keys("Firefox-ESR/Win/Ver");
  exit(0);
}


include("version_func.inc");

# Variable Initialization
ffVer = "";

# Firefox Check
ffVer = get_kb_item("Firefox-ESR/Win/Ver");

if(ffVer && ffVer =~ "^17.0")
{
  # Grep for Firefox version
  if(version_in_range(version:ffVer, test_version:"17.0", test_version2:"17.0.7"))
  {
    security_message(0);
    exit(0);
  }
}

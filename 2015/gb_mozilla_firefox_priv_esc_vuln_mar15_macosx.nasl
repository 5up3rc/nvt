###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_firefox_priv_esc_vuln_mar15_macosx.nasl 6600 2017-07-07 09:58:31Z teissa $
#
# Mozilla Firefox SVG Navigation Privilege Escalation Vulnerability Mar15 (Mac OS X)
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

CPE = "cpe:/a:mozilla:firefox";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805515");
  script_version("$Revision: 6600 $");
  script_cve_id("CVE-2015-0818");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-07-07 11:58:31 +0200 (Fri, 07 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-03-27 14:36:15 +0530 (Fri, 27 Mar 2015)");
  script_name("Mozilla Firefox SVG Navigation Privilege Escalation Vulnerability Mar15 (Mac OS X)");

  script_tag(name: "summary" , value:"This host is installed with Mozilla Firefox
  and is prone to privilege escalation vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help of
  detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw exists due to an error in
  docshell/base/nsDocShell.cpp within the SVG format content navigation
  functionality.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to gain elevated privileges and execute arbitrary scripts with the
  elevated privileges.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Mozilla Firefox before version 36.0.4 on
  Mac OS X");

  script_tag(name: "solution" , value:"Upgrade to Mozilla Firefox version 36.0.4
  or later, For updates refer to http://www.mozilla.com/en-US/firefox/all.html");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"http://www.securitytracker.com/id/1031959");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2015-28");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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
if(version_is_less(version:ffVer, test_version:"36.0.4"))
{
  report = 'Installed version: ' + ffVer + '\n' +
           'Fixed version:     36.0.4\n';
  security_message(data:report);
  exit(0);
}

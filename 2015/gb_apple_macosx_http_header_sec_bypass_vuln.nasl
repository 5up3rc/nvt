###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_macosx_http_header_sec_bypass_vuln.nasl 6329 2017-06-13 15:39:42Z teissa $
#
# Apple Mac OS X Web Service component (HTTP header) Security Bypass Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806127");
  script_version("$Revision: 6329 $");
  script_cve_id("CVE-2015-7031");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-06-13 17:39:42 +0200 (Tue, 13 Jun 2017) $");
  script_tag(name:"creation_date", value:"2015-10-29 13:05:48 +0530 (Thu, 29 Oct 2015)");
  script_name("Apple Mac OS X Web Service component (HTTP header) Security Bypass Vulnerability");

  script_tag(name: "summary" , value:"This host is running Apple Mac OS X and
  is prone to security bypass vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw is due to an  error in Web
  Service component it omits an unspecified HTTP header configuration.");

  script_tag(name: "impact" , value:"Successful exploitation will allow attacker
  to  bypass intended access restrictions via unknown vectors.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Apple Mac OS X versions before 5.0.15");

  script_tag(name: "solution" , value:"Upgrade to Apple Mac OS X version
  5.0.15 or later. For more updates refer to https://www.apple.com");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name : "URL" , value : "https://support.apple.com/en-us/HT205376");
  script_xref(name : "URL" , value : "http://lists.apple.com/archives/security-announce/2015/Oct/msg00009.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Mac OS X Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/osx_name", "ssh/login/osx_version");
  exit(0);
}


include("version_func.inc");

## Variable Initialization
osName = "";
osVer = "";

## Get the OS name
osName = get_kb_item("ssh/login/osx_name");
if(!osName){
  exit (0);
}

## Get the OS Version
osVer = get_kb_item("ssh/login/osx_version");
if(!osVer){
 exit(0);
}

## Check for the Mac OS X
if("Mac OS X" >< osName)
{
  ## Check the affected OS versions
  if(version_is_less(version:osVer, test_version:"5.0.15"))
  {
    report = 'Installed Version: ' + osVer + '\nFixed Version: 5.0.15\n';
    security_message(data:report);
    exit(0);
  }
}

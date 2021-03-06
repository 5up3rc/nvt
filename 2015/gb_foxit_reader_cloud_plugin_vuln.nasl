###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_foxit_reader_cloud_plugin_vuln.nasl 6333 2017-06-14 10:00:49Z teissa $
#
# Foxit Reader Cloud Plugin Windows Search Path Vulnerability
#
# Authors:
# Deependra Bapna <bdeependra@secpod.com>
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

CPE = "cpe:/a:foxitsoftware:reader";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805364");
  script_version("$Revision: 6333 $");
  script_cve_id("CVE-2015-2789");
  script_tag(name:"cvss_base", value:"4.4");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-06-14 12:00:49 +0200 (Wed, 14 Jun 2017) $");
  script_tag(name:"creation_date", value:"2015-04-07 18:04:50 +0530 (Tue, 07 Apr 2015)");
  script_name("Foxit Reader Cloud Plugin Windows Search Path Vulnerability");

  script_tag(name: "summary" , value:"The host is installed with Foxit Reader
  Cloud Plugin and is prone to windows search path Vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the
  help of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw is due to SYSTEMDRIVE folder,
  local users can gain privileges via a Trojan horse.");

  script_tag(name: "impact" , value:"Successful exploitation will allow local
  attackers to gain privileges and execute malicious files.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Foxit Reader version 6.1 before version
  7.0.6.1126");

  script_tag(name: "solution" , value:"Upgrade to Foxit Reader version
  7.1 or later, For updates refer to http://www.foxitsoftware.com");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name : "URL" , value : "http://www.securitytracker.com/id/1031879");
  script_xref(name : "URL" , value : "http://www.foxitsoftware.com/support/security_bulletins.php#FRD-25");

  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_foxit_reader_detect.nasl");
  script_mandatory_keys("Foxit/Reader/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
foxitVer = "";

## Get version
if(!foxitVer = get_app_version(cpe:CPE)){
  exit(-1);
}

## Grep for vulnerable version
if(version_in_range(version:foxitVer, test_version:"6.1", test_version2:"7.0.6.1126"))
{
  report = 'Installed version: ' + foxitVer + '\n' +
           'Fixed version:     7.1'  + '\n';
  security_message(data:report);
  exit(0);
}

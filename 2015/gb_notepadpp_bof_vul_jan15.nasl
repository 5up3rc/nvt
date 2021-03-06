###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_notepadpp_bof_vul_jan15.nasl 6376 2017-06-20 10:00:24Z teissa $
#
# Notepad++ Buffer overflow Vulnerability - Jan15 (Windows)
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

CPE = "cpe:/a:don_ho:notepad++";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805318");
  script_version("$Revision: 6376 $");
  script_cve_id("CVE-2014-9456");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-06-20 12:00:24 +0200 (Tue, 20 Jun 2017) $");
  script_tag(name:"creation_date", value:"2015-01-09 13:19:25 +0530 (Fri, 09 Jan 2015)");
  script_name("Notepad++ Buffer overflow Vulnerability - Jan15 (Windows)");

  script_tag(name: "summary" , value:"The host is installed with Notepad++
  and is prone to Buffer Overflow Vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw exists as the user-supplied input
  is not properly validated when handling a specially crafted XML file.");

  script_tag(name: "impact" , value:"Successful exploitation will allow
  attackers to conduct denial of service attack or potentially allowing the
  execution of arbitrary code.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Notepad++ version 6.6.9 on Windows.");

  script_tag(name: "solution" , value:"Upgrade to Notepad++ version 6.7 or later.
  http://notepad-plus-plus.org/");
  script_tag(name:"solution_type", value:"NoneAvailable");

  script_xref(name: "URL" , value : "http://www.exploit-db.com/exploits/35589");
  script_xref(name: "URL" , value : "http://www.security-database.com/detail.php?alert=CVE-2014-9456");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"registry");
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Buffer overflow");
  script_dependencies("gb_notepadpp_detect_win.nasl");
  script_mandatory_keys("Notepad++/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
noteVer = "";

## Get version
if(!noteVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Check Notepad++ vulnerable version
if(version_is_equal(version:noteVer, test_version:"6.6.9"))
{
  security_message(0);
  exit(0);
}

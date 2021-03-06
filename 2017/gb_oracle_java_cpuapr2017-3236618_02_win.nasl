###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_java_cpuapr2017-3236618_02_win.nasl 6092 2017-05-10 07:02:40Z cfi $
#
# Oracle Java SE Security Updates (cpuapr2017-3236618) 02 - Windows
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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

CPE = "cpe:/a:oracle:jre";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810746");
  script_version("$Revision: 6092 $");
  script_cve_id("CVE-2017-3512", "CVE-2017-3511");
  script_bugtraq_id(97727, 97731);
  script_tag(name:"cvss_base", value:"5.1");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-05-10 09:02:40 +0200 (Wed, 10 May 2017) $");
  script_tag(name:"creation_date", value:"2017-04-19 13:06:39 +0530 (Wed, 19 Apr 2017)");
  script_name("Oracle Java SE Security Updates (cpuapr2017-3236618) 02 - Windows");

  script_tag(name: "summary" , value:"The host is installed with Oracle Java SE
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"Multiple flaws exists due to multiple
  unspecified errors in 'AWT', and 'JCE' sub-components.");

  script_tag(name: "impact" , value:"Successful exploitation will allow
  attackers to cause some unspecified impacts. 

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Oracle Java SE version 1.7.0.131
  and earlier, 1.8.0.121 and earlier on Windows");

  script_tag(name:"solution", value:"Apply the patch from below link,
  http://www.oracle.com/technetwork/security-advisory/cpujan2017-2881727.html");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/security-advisory/cpuapr2017-3236618.html");
  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/security-advisory/cpuapr2017-3236618.html#AppendixJAVA");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_java_prdts_detect_win.nasl");
  script_mandatory_keys("Sun/Java/JRE/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
jreVer = "";

## Get version
if(!jreVer = get_app_version(cpe:CPE))
{
  CPE = "cpe:/a:sun:jre";
  if(!jreVer = get_app_version(cpe:CPE)){
    exit(0);
  }
}

if(jreVer =~ "^(1\.(7|8))")
{
  jreVer = ereg_replace(pattern:"[a-z]+_|[a-z]+-|-|_|[a-z]+", string:jreVer, replace: ".");

  if(version_in_range(version:jreVer, test_version:"1.7.0", test_version2:"1.7.0.131") ||
     version_in_range(version:jreVer, test_version:"1.8.0", test_version2:"1.8.0.121"))
  {
    report = report_fixed_ver(installed_version:jreVer, fixed_version: "Apply the patch");
    security_message(data:report);
    exit(0);
  }
}

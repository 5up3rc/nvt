###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mysql_unspecified_vuln03_july14_win.nasl 39440 2014-07-24 17:26:12Z july$
#
# Oracle MySQL Multiple Unspecified vulnerabilities-03 July14 (Windows)
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
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

CPE = "cpe:/a:mysql:mysql";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804723");
  script_version("$Revision: 6663 $");
  script_cve_id("CVE-2014-2494", "CVE-2014-4207");
  script_bugtraq_id(68579, 68593);
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-07-11 11:58:05 +0200 (Tue, 11 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-07-24 17:29:02 +0530 (Thu, 24 Jul 2014)");
  script_name("Oracle MySQL Multiple Unspecified vulnerabilities-03 July14 (Windows)");

  tag_summary =
"This host is running Oracle MySQL and is prone to multiple unspecified
vulnerabilities.";

  tag_vuldetect =
"Get the installed version with the help of detect NVT and check the version
is vulnerable or not.";

  tag_insight =
"Unspecified errors in the MySQL Server component via unknown vectors related
to ENARC and SROPTZR.";

  tag_impact =
"Successful exploitation will allow attackers to manipulate certain data
and cause a DoS (Denial of Service).

Impact Level: Application";

  tag_affected =
"Oracle MySQL version 5.5.37 and earlier on Windows.";

  tag_solution =
"Apply the patch from below link,
http://www.oracle.com/technetwork/topics/security/cpujul2014-1972956.html";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);

  script_xref(name : "URL" , value : "http://secunia.com/advisories/59521");
  script_xref(name : "URL" , value : "http://www.computerworld.com/s/article/9249690/Oracle_to_release_115_security_patches");
  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/topics/security/cpujul2014-1972956.html#AppendixMSQL");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Databases");
  script_tag(name:"qod_type", value:"remote_banner");
  script_tag(name:"solution_type", value:"VendorFix");
  script_dependencies("mysql_version.nasl", "os_detection.nasl");
  script_require_ports("Services/mysql", 3306);
  script_mandatory_keys("MySQL/installed","Host/runs_windows");
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

## Variable Initialization
mysqlVer = "";
sqlPort = "";

if(host_runs("Windows") != "yes"){
  exit(0);
}

## Get Port
if(!sqlPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get version
if(!mysqlVer = get_app_version(cpe:CPE, port:sqlPort)){
  exit(0);
}

if(mysqlVer =~ "^(5\.5)")
{
  if(version_in_range(version:mysqlVer, test_version:"5.5", test_version2:"5.5.37"))
  {
    security_message(sqlPort);
    exit(0);
  }
}

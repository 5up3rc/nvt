###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mysql_mult_unspecified_vuln02_jul15.nasl 6141 2017-05-17 09:03:37Z teissa $
#
# Oracle MySQL Multiple Unspecified Vulnerabilities-02 Jul15
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

CPE = "cpe:/a:oracle:mysql";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805929");
  script_version("$Revision: 6141 $");
  script_cve_id("CVE-2015-2648", "CVE-2015-4752", "CVE-2015-2643", "CVE-2015-2582");
  script_bugtraq_id(75822, 75849, 75830, 75751);
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-05-17 11:03:37 +0200 (Wed, 17 May 2017) $");
  script_tag(name:"creation_date", value:"2015-07-21 10:38:02 +0530 (Tue, 21 Jul 2015)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Oracle MySQL Multiple Unspecified Vulnerabilities-02 Jul15");

  script_tag(name:"summary", value:"This host is running Oracle MySQL and is
  prone to multiple unspecified vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help of
  detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"Unspecified errors exists in the MySQL Server
  component via unknown vectors related to DML, Server : I_S, Server : Optimizer,
  and GIS.");

  script_tag(name:"impact", value:"Successful exploitation will allow an
  authenticated remote attacker to cause denial-of-service attack.

  Impact Level: Application");

  script_tag(name:"affected", value:"Oracle MySQL Server 5.5.43 and earlier, and
  5.6.24 and earlier on Windows.");

  script_tag(name:"solution", value:"Apply the patch from below link,
  http://www.oracle.com/technetwork/topics/security/cpujul2015-2367936.html");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/topics/security/cpujul2015-2367936.html");

  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Databases");
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
if(!sqlPort = get_app_port(cpe:CPE))
{
  CPE = "cpe:/a:mysql:mysql";
  if(!sqlPort = get_app_port(cpe:CPE)){
    exit(0);
  }
}

## Get version
if(!mysqlVer = get_app_version(cpe:CPE, port:sqlPort)){
  exit(0);
}

if(mysqlVer =~ "^(5\.(5|6))")
{
  if(version_in_range(version:mysqlVer, test_version:"5.6", test_version2:"5.6.24")||
     version_in_range(version:mysqlVer, test_version:"5.5", test_version2:"5.5.43"))
  {
    report = 'Installed version: ' + mysqlVer + '\n';
    security_message(data:report, port:sqlPort);
    exit(0);
  }
}

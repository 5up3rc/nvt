###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_tomcat_dos_vuln_june15_win.nasl 2015-06-16 15:04:10 +0530 Jun$
#
# Apache Tomcat Denial Of Service Vulnerability - Jun15 (Windows)
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

CPE = "cpe:/a:apache:tomcat";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805703");
  script_version("$Revision: 5082 $");
  script_cve_id("CVE-2014-0230");
  script_bugtraq_id(74475);
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-01-24 12:14:23 +0100 (Tue, 24 Jan 2017) $");
  script_tag(name:"creation_date", value:"2015-06-16 15:04:10 +0530 (Tue, 16 Jun 2015)");
  script_name("Apache Tomcat Denial Of Service Vulnerability - Jun15 (Windows)");

  script_tag(name:"summary", value:"This host is installed with Apache Tomcat
  and is prone to denial of service vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with
  the help of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw is due to improper handling of
  cases where an HTTP response occurs before finishing the reading of an
  entire request body ");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to conduct denial of service attack.

  Impact Level: Application");

  script_tag(name:"affected", value:"Apache Tomcat 6.x before 6.0.44,
  7.x before 7.0.55, and 8.x before 8.0.9 on Windows.");

  script_tag(name:"solution", value:"Upgrade to version 6.0.44 or 7.0.55 or
  8.0.9 or later. For updates refer to http://tomcat.apache.org");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");
  script_xref(name:"URL", value:"http://tomcat.apache.org/security-6.html");
  script_xref(name:"URL", value:"http://tomcat.apache.org/security-7.html");
  script_xref(name:"URL", value:"http://openwall.com/lists/oss-security/2015/04/10/1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Web Servers");
  script_dependencies("gb_apache_tomcat_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("ApacheTomcat/installed","Host/runs_windows");
  script_require_ports("Services/www", 8080);
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
appPort = "";
appVer = "";

## exit, if its not windows
if(host_runs("Windows") != "yes") exit(0);

## get the port
if(!appPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get the version
if(!appVer = get_app_version(cpe:CPE, port:appPort))
{
  exit(0);
}

if(appVer =~ "^6\.0")
{
  if(version_in_range(version:appVer, test_version:"6.0", test_version2:"6.0.43"))
  {
    fix = "6.0.44";
    VULN = TRUE;
  }
}

if(appVer =~ "^7\.0")
{
  if(version_in_range(version:appVer, test_version:"7.0", test_version2:"7.0.54"))
  {
    fix = "7.0.55";
    VULN = TRUE;
  }
}

if(appVer =~ "^8\.0")
{
  if(version_in_range(version:appVer, test_version:"8.0", test_version2:"8.0.8"))
  {
    fix = "8.0.9";
    VULN = TRUE;
  }
}

if(VULN)
{
  report = 'Installed version: ' + appVer + '\n' +
           'Fixed version:     ' + fix  + '\n';
  security_message(data:report, port:appPort);
  exit(0);
}

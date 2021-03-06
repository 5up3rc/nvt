###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_tomcat_limited_directory_traversal_vuln_win.nasl 2016-02-25 11:25:47 +0530 Feb$
#
# Apache Tomcat Limited Directory Traversal Vulnerability - Feb16 (Windows)
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.807404");
  script_version("$Revision: 5083 $");
  script_cve_id("CVE-2015-5174");
  script_bugtraq_id(83329);
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-01-24 12:21:46 +0100 (Tue, 24 Jan 2017) $");
  script_tag(name:"creation_date", value:"2016-02-25 11:25:47 +0530 (Thu, 25 Feb 2016)");
  script_name("Apache Tomcat Limited Directory Traversal Vulnerability - Feb16 (Windows)");

  script_tag(name:"summary", value:"This host is installed with Apache Tomcat
  and is prone to Limited Directory Traversal Vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with
  the help of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw is due to an improper validation of
  path while accessing resources via the ServletContext methods getResource(),
  getResourceAsStream() and getResourcePaths() the paths should be limited to
  the current web application.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  authenticated users to bypass intended SecurityManager restrictions and
  list a parent directory.

  Impact Level: Application");
  
  script_tag(name:"affected", value:"Apache Tomcat 6.x before 6.0.45,
  7.x before 7.0.65, and 8.0.0.RC1 before 8.0.27 on Windows.");

  script_tag(name:"solution", value:"Upgrade to version 6.0.45 or 7.0.65 or
  8.0.27 or later.
  For updates refer to http://tomcat.apache.org");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");
  script_xref(name:"URL", value:"http://tomcat.apache.org/security-9.html");
  script_xref(name:"URL", value:"http://tomcat.apache.org/security-8.html");
  script_xref(name:"URL", value:"http://tomcat.apache.org/security-7.html");
  script_xref(name:"URL", value:"http://tomcat.apache.org/security-6.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
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
if(!appVer = get_app_version(cpe:CPE, port:appPort)){
  exit(0);
}

if(appVer =~ "^(6|8|7)")
{
  ## Grep for vulnerable version
  if(version_in_range(version:appVer, test_version:"6.0.0", test_version2:"6.0.44"))
  {
    fix = "6.0.45";
    VULN = TRUE;
  }

  if(version_in_range(version:appVer, test_version:"7.0.0", test_version2:"7.0.64"))
  {
    fix = "7.0.65";
    VULN = TRUE;
  }

  if(version_in_range(version:appVer, test_version:"8.0.0", test_version2:"8.0.26"))
  {
    fix = "8.0.27";
    VULN = TRUE;
  }
  
  if(VULN)
  {
    report = report_fixed_ver(installed_version:appVer, fixed_version:fix);
    security_message(data:report, port:appPort);
    exit(0);
  }
}

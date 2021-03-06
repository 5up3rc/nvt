###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cpython_crlf_injection_vuln_win.nasl 7174 2017-09-18 11:48:08Z asteins $
#
# Cpython CRLF Injection Vulnerability (Windows)
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

CPE = "cpe:/a:python:python";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809218");
  script_version("$Revision: 7174 $");
  script_cve_id("CVE-2016-5699");
  script_bugtraq_id(91226);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-09-18 13:48:08 +0200 (Mon, 18 Sep 2017) $");
  script_tag(name:"creation_date", value:"2016-09-12 14:53:53 +0530 (Mon, 12 Sep 2016)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Cpython CRLF Injection Vulnerability (Windows)");

  script_tag(name:"summary", value:"This host is running Cpython and is
  prone to CRLF injection Vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help of
  detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw exists due to the httplib library 
  did not properly check 'HTTPConnection.putheader' function arguments.");

  script_tag(name:"impact", value:"Successful exploitation will allows remote
  attackers to inject arbitrary HTTP headers via CRLF sequences in a URL.

  Impact Level: Application");

  script_tag(name:"affected", value:"Cpython before 2.7.10 and
  3.x before 3.4.4 on Windows.");

  script_tag(name:"solution", value:"Upgrade to Cpython version 2.7.10, or
  3.4.4, or later. For updates refer to https://hg.python.org/cpython");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://hg.python.org/cpython/rev/1c45047c5102");

  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("gb_Python_detection.nasl", "os_detection.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("pyVer/installed","Host/runs_windows");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

## Variable Initialization
pythonPort = "";
pythonVer = "";

## exit, if its not windows
if(host_runs("Windows") != "yes") exit(0);

## Get HTTP Port
if(!pythonPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get Version
if(!pythonVer = get_app_version(cpe:CPE, port:pythonPort)){
  exit(0);
}

## Check for version before 2.7.10
if(version_is_less(version:pythonVer, test_version:"2.7.10"))
{
  fix = '2.7.10';
  VULN = TRUE;
}

## Check for version 3.x before 3.4.4
else if(pythonVer =~ "^(3\.)")
{
  if(version_in_range(version:pythonVer, test_version:"3.0", test_version2:"3.4.3"))
  {
    fix = '3.4.4';
    VULN = TRUE;
  }
}

if(VULN)
{
  report = report_fixed_ver(installed_version:pythonVer, fixed_version:fix);
  security_message(data:report, port:pythonPort);
  exit(0);
}

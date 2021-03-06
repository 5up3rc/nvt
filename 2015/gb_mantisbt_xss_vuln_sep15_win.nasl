###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mantisbt_xss_vuln_sep15_win.nasl 6391 2017-06-21 09:59:48Z teissa $
#
# MantisBT Cross Site Scripting Vulnerability September15 (Windows)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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

CPE = "cpe:/a:mantisbt:mantisbt";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806037");
  script_version("$Revision: 6391 $");
  script_cve_id("CVE-2014-8987");
  script_bugtraq_id(71184);
  script_tag(name:"cvss_base", value:"3.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-06-21 11:59:48 +0200 (Wed, 21 Jun 2017) $");
  script_tag(name:"creation_date", value:"2015-09-01 12:57:59 +0530 (Tue, 01 Sep 2015)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("MantisBT Cross Site Scripting Vulnerability September15 (Windows)");

  script_tag(name:"summary", value:"This host is running MantisBT and is prone
  to cross site scripting vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw is due to MantisBT Configuration
  Report page 'adm_config_report.php' did not escape a parameter before
  displaying it on the page.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers remote attackers to inject arbitrary web script or HTML via the
  'config_option' parameter.

  Impact Level: Application");

  script_tag(name:"affected", value:"MantisBT versions 1.2.13 through 1.2.17
  on Windows");

  script_tag(name:"solution", value:"Upgrade to version 1.2.18 or later, For
  updates refer to http://www.mantisbt.org.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://www.mantisbt.org/bugs/view.php?id=17870");
  script_xref(name : "URL" , value : "http://www.openwall.com/lists/oss-security/2014/11/14/9");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("mantis_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("mantisbt/installed","Host/runs_windows");
  script_require_ports("Services/www", 80);
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
mantisPort = 0;
mantisVer = "";

## exit, if its windows
if(host_runs("Windows") != "yes")exit(0);

## Get HTTP Port
if(!mantisPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get Version
if(!mantisVer = get_app_version(cpe:CPE, port:mantisPort)){
  exit(0);
}

## Checking for Vulnerable version
if(version_in_range(version:mantisVer, test_version:"1.2.13", test_version2:"1.2.17"))
{
  report = 'Installed version: ' + mantisVer + '\n' +
           'Fixed version:     ' + "1.2.18" + '\n';
  security_message(data:report, port:mantisPort);
  exit(0);
}


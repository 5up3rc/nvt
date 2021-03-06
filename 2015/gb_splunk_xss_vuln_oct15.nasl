###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_splunk_xss_vuln_oct15.nasl 6254 2017-05-31 09:04:18Z teissa $
#
# Splunk Enterprise Cross-Site Scripting Vulnerability -Oct15
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

CPE = "cpe:/a:splunk:splunk";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805772");
  script_version("$Revision: 6254 $");
  script_cve_id("CVE-2015-7604");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-05-31 11:04:18 +0200 (Wed, 31 May 2017) $");
  script_tag(name:"creation_date", value:"2015-10-30 10:45:47 +0530 (Fri, 30 Oct 2015)");
  script_name("Splunk Enterprise Cross-Site Scripting Vulnerability -Oct15");

  script_tag(name: "summary" , value:"The host is installed with Splunk and is
  prone to cross-site scripting vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Flaw is due to improper validation of
  user-supplied input passed via unspecified vectors before being returned
  to the user.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attacker to execute arbitrary script code in a user's browser session within
  the trust relationship between their browser and the server.

  Impact Level: Application");

  script_tag(name: "affected" , value:"Splunk Enterprise version 6.2.x before 6.2.6");

  script_tag(name: "solution" , value:"Upgrade to Splunk Enterprise version
  6.2.6 or later. For updates refer to http://www.splunk.com");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner");

  script_xref(name : "URL" , value : "http://www.splunk.com/view/SP-CAAAPAM");
  script_xref(name : "URL" , value : "http://www.securitytracker.com/id/1033655");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_splunk_detect.nasl");
  script_mandatory_keys("Splunk/installed");
  script_require_ports("Services/www", 8000);
  exit(0);
}

##Code starts from here##

include("version_func.inc");
include("host_details.inc");

## Variable Initialization
http_port = "";
SplunkVer = "";

## Get HTTP Port
if(!http_port = get_app_port(cpe:CPE)){
  exit(0);
}

if(!SplunkVer = get_app_version(cpe:CPE, port:http_port)){
  exit(0);
}

## Grep for vulnerable version
if(version_in_range(version:SplunkVer, test_version:"6.2.0", test_version2:"6.2.5"))
{
  report = 'Installed version: ' + SplunkVer + '\n' +
           'Fixed version:     6.2.6'  + '\n';
  security_message(data:report);
  exit(0);
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_php_server_monitor_mult_csrf_vuln.nasl 6505 2017-07-03 09:58:27Z teissa $
#
# PHP Server Monitor Multiple CSRF Vulnerabilities
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

CPE = "cpe:/a:phpserver:monitor";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806528");
  script_version("$Revision: 6505 $");
  script_tag(name:"cvss_base", value:"6.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-07-03 11:58:27 +0200 (Mon, 03 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-11-02 18:23:47 +0530 (Mon, 02 Nov 2015)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("PHP Server Monitor Multiple CSRF Vulnerabilities");

  script_tag(name:"summary", value:"This host is running PHP Server Monitor and
  is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"Multiple flaws are due to multiple CSRF
  issues in the application.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to add arbitrary users & servers to the system, modify system
  configurations and delete arbitrary servers.

  Impact Level: Application");

  script_tag(name:"affected", value:"PHP Server Monitor 3.1.1");

  script_tag(name:"solution", value:"No solution or patch was made available for
  at least one year since disclosure of this vulnerability. Likely none will be
  provided anymore. General solution options are to upgrade to a newer release,
  disable respective features, remove the product or replace the product by
  another one.");

  script_tag(name:"solution_type", value:"WillNotFix");
  script_xref(name : "URL" , value : "https://packetstormsecurity.com/files/134144");
  script_xref(name : "URL" , value : "https://packetstormsecurity.com/files/134143");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_php_server_monitor_detect.nasl");
  script_mandatory_keys("PHP/Server/Monitor/Installed");
  script_require_ports("Services/www", 80);
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
monPort = 0;
monVer = "";

## Get HTTP Port
if(!monPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get Version
if(!monVer = get_app_version(cpe:CPE, port:monPort)){
  exit(0);
}

## Checking for Vulnerable version
if(version_is_equal(version:monVer, test_version:"3.1.1"))
{
  report = 'Installed version: ' + monVer + '\n' +
           'Fixed version:     NoneAvailable\n';

  security_message(data:report, port:monPort);
  exit(0);
}

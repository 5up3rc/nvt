##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_sync_breeze_enterprise_server_bof_vuln_nov16.nasl 6586 2017-07-07 06:23:25Z cfischer $
#
# Sync Breeze Enterprise Server Buffer Overflow Vulnerability - Nov16
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

CPE = "cpe:/a:sync:sync_breeze_enterprise";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809481");
  script_version("$Revision: 6586 $");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-07-07 08:23:25 +0200 (Fri, 07 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-11-29 12:58:33 +0530 (Tue, 29 Nov 2016)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Sync Breeze Enterprise Server Buffer Overflow Vulnerability - Nov16");

  script_tag(name: "summary" , value:"The host is running Sync Breeze Enterprise
  Server and is prone to buffer overflow vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help of
  detect nvt and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw is due to an error when processing
  web requests and can be exploited to cause a buffer overflow via an overly long
  string passed to 'Login' request.");

  script_tag(name: "impact" , value:"Successful exploitation may allow remote
  attackers to cause the application to crash, creating a denial-of-service
  condition.

  Impact Level: Application");

  script_tag(name: "affected" , value:"Sync Breeze Enterprise version 9.1.16
  and earlier.");

  script_tag(name: "solution" , value:"No solution or patch was made available for at least one year
  since disclosure of this vulnerability. Likely none will be provided anymore. General solution options
  are to upgrade to a newer release, disable respective features, remove the product or replace the product
  by another one.");

  script_tag(name:"solution_type", value:"WillNotFix");

  script_xref(name : "URL" , value : "http://www.syncbreeze.com");
  script_xref(name : "URL" , value : "https://www.exploit-db.com/exploits/40831");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("gb_sync_breeze_enterprise_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("Sync/Breeze/Enterprise/installed", "Host/runs_windows");
  script_require_ports("Services/www", 80);
  exit(0);
}

##
#Code Starts Here
##

include("host_details.inc");
include("version_func.inc");

##Variable initialization
syncVer = "";
syncPort = "";
report = "";

##Get Port
if(!syncPort = get_app_port(cpe:CPE)){
  exit(0);
}

##Get version
if(!syncVer = get_app_version(cpe:CPE, port:syncPort)){
  exit(0);
}

##Check for versions less than and equal to 9.1.16
if(version_is_less_equal(version:syncVer, test_version:"9.1.16"))
{
  report = report_fixed_ver(installed_version:syncVer, fixed_version:"None Available");
  security_message(data:report, port:syncPort);
  exit(0);
}

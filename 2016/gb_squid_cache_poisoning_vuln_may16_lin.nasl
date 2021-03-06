##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_squid_cache_poisoning_vuln_may16_lin.nasl 7174 2017-09-18 11:48:08Z asteins $
#
# Squid Cache Poisoning Vulnerability May16 (Linux)
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

CPE = "cpe:/a:squid-cache:squid";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.808041");
  script_version("$Revision: 7174 $");
  script_cve_id("CVE-2016-4554");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-09-18 13:48:08 +0200 (Mon, 18 Sep 2017) $");
  script_tag(name:"creation_date", value:"2016-05-18 12:20:08 +0530 (Wed, 18 May 2016)");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("Squid Cache Poisoning Vulnerability May16 (Linux)");

  script_tag(name:"summary", value:"This host is running Squid and is prone
  to cache poisoning vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw exists due to an incorrect input
  validation in HTTP Request processing.");

  script_tag(name:"impact", value:"Successful exploitation will allows remote
  attackers to cause cache poisoning and to bypass of same-origin security
  policy. 

  Impact Level: Application");
 
  script_tag(name:"affected", value:"Squid version prior to 3.5.18 on Linux.");

  script_tag(name:"solution", value:"Upgrade to Squid version 3.5.18 or later.
  For updates refer to http://www.squid-cache.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://www.squid-cache.org/Advisories/SQUID-2016_8.txt");
  
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_squid_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("squid_proxy_server/installed","Host/runs_unixoide");
  script_require_ports("Services/www", 3128, 8080);
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

## Variable Initialization
squidPort = "";
squidVer = "";

## exit, if its windows
if(host_runs("Windows") == "yes") exit(0);

## Get HTTP Port
if(!squidPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get Version
if(!squidVer = get_app_version(cpe:CPE, port:squidPort)){
  exit(0);
}

if(version_is_less(version:squidVer, test_version:"3.5.18"))
{
  report = report_fixed_ver(installed_version:squidVer, fixed_version:"3.5.18");
  security_message(data:report, port:squidPort);
  exit(0);
} 

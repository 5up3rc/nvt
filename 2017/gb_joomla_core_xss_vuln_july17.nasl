###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_joomla_core_xss_vuln_july17.nasl 6810 2017-07-28 07:41:58Z santu $
#
# Joomla! Core Cross-Site Scripting Vulnerability - July17
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:joomla:joomla";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811257");
  script_version("$Revision: 6810 $");
  script_cve_id("CVE-2017-11612");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-07-28 09:41:58 +0200 (Fri, 28 Jul 2017) $");
  script_tag(name:"creation_date", value:"2017-07-26 11:07:10 +0530 (Wed, 26 Jul 2017)");
  script_name("Joomla! Core Cross-Site Scripting Vulnerability - July17");

  script_tag(name:"summary", value:"This host is running Joomla and is prone
  to cross-site scripting vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw exists due to Inadequate filtering
  of potentially malicious HTML tags in various components of the application.");

  script_tag(name:"impact", value:"Successfully exploiting this issue will allow
  remote attacker to conduct cross-site scripting attacks.

  Impact Level: Application");

  script_tag(name:"affected", value:"Joomla core versions 1.5.0 through 3.7.3");

  script_tag(name:"solution", value:"Upgrade to Joomla version 3.7.4 or later.
  For updates refer to https://www.joomla.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner");

  script_xref(name : "URL" , value : "https://developer.joomla.org/security-centre/701-20170704-core-installer-lack-of-ownership-verification");
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("joomla_detect.nasl");
  script_mandatory_keys("joomla/installed");
  script_require_ports("Services/www", 80);
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

## Variable Initialization
jPort = "";
jVer = "";

## get the port
if(!jPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get the version
if(!jVer = get_app_version(cpe:CPE, port:jPort)){
  exit(0);
}

## Check for version
if(version_in_range(version:jVer, test_version:"1.5.0", test_version2:"3.7.3"))
{
  report = report_fixed_ver( installed_version:jVer, fixed_version:"3.7.4");
  security_message( data:report, port:jPort);
  exit(0);
}
exit(0);

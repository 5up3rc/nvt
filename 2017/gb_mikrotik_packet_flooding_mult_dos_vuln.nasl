###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mikrotik_packet_flooding_mult_dos_vuln.nasl 7295 2017-09-27 09:02:50Z teissa $
#
# MikroTik RouterOS Packet Flooding Multiple Denial-of-Service Vulnerabilities
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:mikrotik:routeros";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811066");
  script_version("$Revision: 7295 $");
  script_cve_id("CVE-2017-7285", "CVE-2017-8338");
  script_bugtraq_id(97266);
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-09-27 11:02:50 +0200 (Wed, 27 Sep 2017) $");
  script_tag(name:"creation_date", value:"2017-06-02 15:14:27 +0530 (Fri, 02 Jun 2017)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("MikroTik RouterOS Packet Flooding Multiple Denial-of-Service Vulnerabilities");

  script_tag(name: "summary" , value:"This host is running MikroTik router
  and is prone to multiple denial of service vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with
  the help of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"Multiple flaws exist due to errors in the
  network stack of MikroTik exhausting all available CPU via a flood of TCP
  RST packets and UDP packets.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to conduct a denial-of-service condition on the MikroTik router.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"MikroTik RouterOS versions 6.38.5");

  script_tag(name: "solution" , value:"No solution or patch is available as of
  27th September, 2017. Information regarding this issue will be updated once the
  solution details are made available.
  For updates refer to https://mikrotik.com.");

  script_tag(name:"solution_type", value:"NoneAvailable");

  script_xref(name : "URL" , value : "https://www.exploit-db.com/exploits/41752");
  script_xref(name : "URL" , value : "https://cxsecurity.com/issue/WLB-2017030242");
  script_xref(name : "URL" , value : "https://cxsecurity.com/issue/WLB-2017050062");
  script_xref(name : "URL" , value : "http://seclists.org/fulldisclosure/2017/May/59");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_mikrotik_router_routeros_detect.nasl");
  script_mandatory_keys("mikrotik/detected", "mikrotik/routeros/version");
  script_require_ports("Services/www", 10000);
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

## Variable Initialization
appPort = "";
appVer = "";

## get the port
if(!appPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get the version
if(!appVer = get_app_version(cpe:CPE, port:appPort)){
  exit(0);
}

##Check for version
if(appVer == "6.38.5")
{
  report = report_fixed_ver(installed_version:appVer, fixed_version:"NoneAvailable");
  security_message(data:report, port:appPort);
  exit(0);
}

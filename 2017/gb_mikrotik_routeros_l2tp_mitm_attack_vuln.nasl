###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mikrotik_routeros_l2tp_mitm_attack_vuln.nasl 6270 2017-06-02 08:02:50Z cfischer $
#
# MikroTik RouterOS 'L2TP' Man-in-the-Middle Attack Vulnerability
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
  script_oid("1.3.6.1.4.1.25623.1.0.810609");
  script_version("$Revision: 6270 $");
  script_cve_id("CVE-2017-6297");
  script_bugtraq_id(96447);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-06-02 10:02:50 +0200 (Fri, 02 Jun 2017) $");
  script_tag(name:"creation_date", value:"2017-03-09 16:21:26 +0530 (Thu, 09 Mar 2017)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("MikroTik RouterOS 'L2TP' Man-in-the-Middle Attack Vulnerability");

  script_tag(name: "summary" , value:"This host is running MikroTik router
  and is prone to a man in the middle attack vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with
  the help of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw exists due to an error in the L2TP
  client which does not enable IPsec encryption after a reboot.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to view unencrypted transmitted data and gain access to networks on
  the L2TP server by monitoring the packets for the transmitted data and
  obtaining the L2TP secret.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"MikroTik RouterOS versions 6.83.3 and
  6.37.4");

  script_tag(name: "solution" , value:"Update to version 6.37.5, 6.83.4 or later.
  For updates refer https://mikrotik.com.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://blog.milne.it/2017/02/24/mikrotik-routeros-security-vulnerability-l2tp-tunnel-unencrypted-cve-2017-6297");
  script_xref(name : "URL" , value : "https://mikrotik.com/download/changelogs/");

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

if(appVer =~ "^6\.")
{
  if(version_is_equal(version:appVer, test_version:"6.83.3")||
     version_is_equal(version:appVer, test_version:"6.37.4"))
  {
    report = report_fixed_ver(installed_version:appVer, fixed_version:"Workaround");
    security_message(data:report, port:appPort);
    exit(0);
  }
}

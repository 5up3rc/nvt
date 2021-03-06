###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_webLogic_server_cpujul2017-3236622_01.nasl 6981 2017-08-22 06:39:29Z asteins $
#
# Oracle WebLogic Server Multiple Vulnerabilities (cpujul2017-3236622)
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

CPE = "cpe:/a:bea:weblogic_server";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811244");
  script_version("$Revision: 6981 $");
  script_cve_id("CVE-2017-5638", "CVE-2017-10147", "CVE-2017-10178", "CVE-2013-2027",
                "CVE-2017-10148", "CVE-2017-10063");
  script_bugtraq_id(96729, 99651, 99644, 78027, 99652, 99653);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-08-22 08:39:29 +0200 (Tue, 22 Aug 2017) $");
  script_tag(name:"creation_date", value:"2017-07-19 12:53:23 +0530 (Wed, 19 Jul 2017)");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("Oracle WebLogic Server Multiple Vulnerabilities (cpujul2017-3236622)");

  script_tag(name: "summary" , value:"The host is running Oracle WebLogic Server
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws exists due to some unspecified
  errors in the 'Sample apps (Struts 2)', 'Core Components', 'Web Container', 'WLST'
  and 'Web Services' components of application.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to have an impact on confidentiality, integrity and availability.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Oracle WebLogic Server versions 10.3.6.0,
  12.1.3.0, 12.2.1.1 and 12.2.1.2");

  script_tag(name:"solution", value:"Apply update from the link mentioned below,
  http://www.oracle.com/technetwork/security-advisory/cpujul2017-3236622.html");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/security-advisory/cpujul2017-3236622.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("oracle_webLogic_server_detect.nasl");
  script_mandatory_keys("OracleWebLogicServer/installed");
  script_require_ports("Services/www", 7001);
  exit(0);
}


##
#Code Starts Here
##

include("host_details.inc");
include("version_func.inc");

##Variable initialization
webVer = "";
webPort = "";
report = "";

##Get Port
if(!webPort = get_app_port(cpe:CPE)){
  exit(0);
}

##Get version
if(!webVer = get_app_version(cpe:CPE, port:webPort)){
  exit(0);
}

affected = make_list('10.3.6.0', '12.1.3.0', '12.2.1.2', '12.2.1.1');
foreach version (affected)
{
  if( webVer == version)
  {
    report = report_fixed_ver(installed_version:webVer, fixed_version:"Apply the appropriate patch");
    security_message(data:report, port:webPort);
    exit(0);
  }
}

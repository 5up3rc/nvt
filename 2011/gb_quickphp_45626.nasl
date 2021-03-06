###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_quickphp_45626.nasl 7015 2017-08-28 11:51:24Z teissa $
#
# QuickPHP 'index.php' Remote Source Code Disclosure Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH
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

tag_summary = "QuickPHP is prone to a remote source-code-disclosure vulnerability
because it fails to properly sanitize user-supplied input.

An attacker can exploit this vulnerability to view the source code
of files in the context of the server process; this may aid in
further attacks.

QuickPHP 1.10.0 is vulnerable; other versions may also be affected.";


if (description)
{
 script_id(103002);
 script_version("$Revision: 7015 $");
 script_tag(name:"last_modification", value:"$Date: 2017-08-28 13:51:24 +0200 (Mon, 28 Aug 2017) $");
 script_tag(name:"creation_date", value:"2011-01-03 14:40:34 +0100 (Mon, 03 Jan 2011)");
 script_bugtraq_id(45626);
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
 script_name("QuickPHP 'index.php' Remote Source Code Disclosure Vulnerability");
 
 script_xref(name : "URL" , value : "https://www.securityfocus.com/bid/45626");
 script_xref(name : "URL" , value : "http://www.zachsaw.co.cc/?pg=quickphp_php_tester_debugger");

 script_tag(name:"qod_type", value:"remote_vul");
 script_category(ACT_ATTACK);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2011 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl","webmirror.nasl");
 script_require_ports("Services/www", 5723);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("version_func.inc");
   
port = get_http_port(default:5723);
if(!get_port_state(port))exit(0);
if(!can_host_php(port:port))exit(0);

phps = get_kb_list("www/"+port+"/content/extensions/php");
if(!isnull(phps)) {
  phps = make_list(phps);
} else {
  phps = make_list("/index.php");
}

max   = 5;
count = 1;

foreach php (phps) {

  count++;

  url = string(php,"."); 

  if(http_vuln_check(port:port, url:url,pattern:"(<\?([ ]+)|<\?php)")) {
     
    security_message(port:port);
    exit(0);

  }

if(count >= max) exit(0);

}

exit(0);

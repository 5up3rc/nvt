# OpenVAS Vulnerability Test
# $Id: ldu_801.nasl 7287 2017-09-27 06:56:51Z cfischer $
# Description: Land Down Under <= 801 Multiple Vulnerabilities
#
# Authors:
# Josh Zlatin-Amishav <josh at ramat doti cc>
#
# Copyright:
# Copyright (C) 2005 Josh Zlatin-Amishav
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

tag_summary = "The remote web server contains several PHP scripts that permit SQL
injection and cross-site scripting attacks. 

Description :

The remote version of Land Down Under is prone to several SQL injection
and cross-site scripting attacks due to its failure to sanitize
user-supplied input to several parameters used by the 'events.php',
'index.php', and 'list.php' scripts.  A malicious user can exploit
exploit these flaws to manipulate SQL queries, steal authentication
cookies, and the like.";

tag_solution = "Unknown at this time.";

if(description)
{
 script_id(19603);
 script_version("$Revision: 7287 $");
 script_tag(name:"last_modification", value:"$Date: 2017-09-27 08:56:51 +0200 (Wed, 27 Sep 2017) $");
 script_tag(name:"creation_date", value:"2006-03-26 17:55:15 +0200 (Sun, 26 Mar 2006)");
 script_cve_id("CVE-2005-2788", "CVE-2005-2884");
 script_bugtraq_id(14685, 14746, 14820);
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

 name = "Land Down Under <= 801 Multiple Vulnerabilities";
 script_name(name);

 summary = "Checks for SQL injection in LDU's list.php";


 script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_active");

 script_family("Web application abuses");
 script_copyright("Copyright (C) 2005 Josh Zlatin-Amishav");
 script_dependencies("ldu_detection.nasl");
 script_require_ports("Services/www", 80);
 script_mandatory_keys("ldu/installed");

 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_xref(name : "URL" , value : "http://securityfocus.com/archive/1/409511");
 script_xref(name : "URL" , value : "http://www.packetstormsecurity.org/0509-advisories/LDU801.txt");
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);
if(!can_host_php(port:port)) exit(0);

# Test an install.
install = get_kb_item(string("www/", port, "/ldu"));
if (isnull(install)) exit(0);
matches = eregmatch(string:install, pattern:"^(.+) under (/.*)$");
if (!isnull(matches)) {
 dir = matches[2];

 req = http_get(
   item:string(
     dir, "/list.php?",
     "c='&s=title&w=asc&o=", 
     SCRIPT_NAME, 
     "&p=1"
   ), 
   port:port
 );
 res = http_keepalive_send_recv(port:port, data:req, bodyonly:TRUE);

 if 
 ( 
   "MySQL error" >< res && 
   egrep(string:res, pattern:string("syntax to use near '(asc&o=|0.+page_", SCRIPT_NAME, ")"))
 )
 {
        security_message(port);
        exit(0);
 }
}

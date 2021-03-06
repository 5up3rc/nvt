###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_igallery_49712.nasl 5719 2017-03-24 13:29:29Z cfi $
#
# i-Gallery 'd' Parameter Cross Site Scripting Vulnerability
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

tag_summary = "i-Gallery is prone to a cross-site scripting vulnerability because it
fails to properly sanitize user-supplied input.

An attacker could leverage this issue to execute arbitrary script code
in the browser of an unsuspecting user in the context of the affected
site. This could allow the attacker to steal cookie-based
authentication credentials and launch other attacks.

i-Gallery 3.4 is vulnerable; other versions may also be affected.";

if (description)
{
 script_id(103263);
 script_version("$Revision: 5719 $");
 script_tag(name:"last_modification", value:"$Date: 2017-03-24 14:29:29 +0100 (Fri, 24 Mar 2017) $");
 script_tag(name:"creation_date", value:"2011-09-22 13:43:24 +0200 (Thu, 22 Sep 2011)");
 script_bugtraq_id(49712);
 script_tag(name:"cvss_base", value:"4.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
 script_name("i-Gallery 'd' Parameter Cross Site Scripting Vulnerability");
 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/49712");
 script_xref(name : "URL" , value : "http://www.b-cp.com/igallery/download.asp");
 script_tag(name:"qod_type", value:"remote_vul");
 script_category(ACT_ATTACK);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2011 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port( default:80 );
if( ! can_host_asp( port:port ) ) exit( 0 );

foreach dir( make_list_unique( "/igallery", "/gallery", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";
  url = string(dir, "/igallery.asp?d=%22%3E%3Cscript%3Ealert%28%27openvas-xss-test%27%29%3C/script%3E"); 

  if( http_vuln_check( port:port, url:url, pattern:"<script>alert\('openvas-xss-test'\)</script>", check_header:TRUE ) ) {
    report = report_vuln_url( port:port, url:url );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );

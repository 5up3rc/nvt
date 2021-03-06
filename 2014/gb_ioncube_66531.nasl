###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ioncube_66531.nasl 5698 2017-03-23 14:04:51Z cfi $
#
# ionCube Loader Wizard 'loader-wizard.php' Multiple Security Vulnerabilities
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

tag_insight = "An attacker can exploit these issues to obtain potentially sensitive
information, to view arbitrary files from the local filesystem and to
execute arbitrary script code in the browser of an unsuspecting user
in the context of the affected site. This may allow the attacker to
steal cookie-based authentication credentials to launch other attacks.";

tag_impact = "ionCube Loader is prone to the following security vulnerabilities:
1. A cross-site scripting vulnerbility
2. An information-disclosure vulnerabilities
3. An Arbitrary File Disclosure Vulnerability";

tag_affected = "Versions prior to ionCube Loader 2.46 are vulnerable. ";
tag_summary = "ionCube Loader is prone to multiple security vulnerabilities:";
tag_solution = "Updates are available.";
tag_vuldetect = "Send a crafted HTTP GET request and check the response.";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.103932");
 script_bugtraq_id(66531);
 script_version ("$Revision: 5698 $");
 script_tag(name:"cvss_base", value:"6.4");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:P");
 script_name("ionCube Loader Wizard 'loader-wizard.php' Multiple Security Vulnerabilities");
 script_xref(name:"URL", value:"http://www.securityfocus.com/bid/66531");
 script_tag(name:"last_modification", value:"$Date: 2017-03-23 15:04:51 +0100 (Thu, 23 Mar 2017) $");
 script_tag(name:"creation_date", value:"2014-04-01 13:11:55 +0200 (Tue, 01 Apr 2014)");
 script_category(ACT_ATTACK);
 script_tag(name:"qod_type", value:"remote_vul");
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2014 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");

 script_tag(name : "impact" , value : tag_impact);
 script_tag(name : "vuldetect" , value : tag_vuldetect);
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name : "affected" , value : tag_affected);

 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
   
port = get_http_port( default:80 );
if( ! can_host_php( port:port ) ) exit( 0 );

foreach dir( make_list_unique( "/ioncube", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";
  url = dir + '/loader-wizard.php?page=phpinfo';

  if( http_vuln_check(port:port, url:url,pattern:"<title>phpinfo()" ) ) {
    report = report_vuln_url( port:port, url:url );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );

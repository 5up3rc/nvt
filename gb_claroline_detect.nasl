###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_claroline_detect.nasl 6065 2017-05-04 09:03:08Z teissa $
#
# Claroline Version Detection
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800627");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 6065 $");
  script_tag(name:"last_modification", value:"$Date: 2017-05-04 11:03:08 +0200 (Thu, 04 May 2017) $");
  script_tag(name:"creation_date", value:"2009-06-19 09:45:44 +0200 (Fri, 19 Jun 2009)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("Claroline Version Detection");
  script_family("Product detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"This script finds the installed Claroline Version and saves the
  version in KB.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

port = get_http_port( default:80 );

if( ! can_host_php( port:port ) ) exit( 0 );

foreach dir( make_list_unique( "/claroline/claroline/install", cgi_dirs( port:port ) ) ) {

  install = dir;
  if( dir == "/" ) dir = "";

  rcvRes = http_get_cache( item: dir + "/index.php", port:port );

  if( rcvRes =~ "HTTP/1.. 200" && "Claroline" >< rcvRes ) {

    version = "unknown";

    ver = eregmatch( pattern:"Claroline ([0-9.]+)(rc[0-9])?", string:rcvRes );
    if( ver[1] != NULL ) {
      if( ver[2] != NULL ) {
        version = ver[1] + "." + ver[2];
      } else {
        version = ver[1];
      }
    }

    tmp_version = version + " under " + install; 
    set_kb_item( name:"www/"+ port + "/Claroline", value:tmp_version );

    ## build cpe and store it as host_detail
    cpe = build_cpe( value: version, exp:"^([0-9.]+)", base:"cpe:/a:claroline:claroline:" );
    if( isnull( cpe ) )
      cpe = 'cpe:/a:claroline:claroline';

    ## Register Product and Build Report
    register_product( cpe:cpe, location:install, port:port );

    log_message( data: build_detection_report( app:"Claroline",
                                               version:version,
                                               install:install,
                                               cpe:cpe,
                                               concluded:ver[0] ),
                                               port:port );
  }
}

exit( 0 );
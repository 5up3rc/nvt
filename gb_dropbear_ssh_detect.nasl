###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_dropbear_ssh_detect.nasl 6278 2017-06-04 16:24:30Z cfischer $
#
# Dropbear SSH Detection
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.105112");
  script_version("$Revision: 6278 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-06-04 18:24:30 +0200 (Sun, 04 Jun 2017) $");
  script_tag(name:"creation_date", value:"2014-11-11 10:04:39 +0100 (Tue, 11 Nov 2014)");
  script_name("Dropbear SSH Detection");
  script_category(ACT_GATHER_INFO);
  script_family("Product detection");
  script_copyright("This script is Copyright (C) 2014 Greenbone Networks GmbH");
  script_dependencies("ssh_detect.nasl");
  script_require_ports("Services/ssh", 22);

  script_tag(name:"summary", value:"The script sends a connection
  request to the server and attempts to extract the version number
  from the reply.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("cpe.inc");
include("host_details.inc");
include("misc_func.inc");
include("ssh_func.inc");

port = get_kb_item( "Services/ssh" );
if( ! port ) port = 22;
if( ! get_port_state( port ) ) exit( 0 );

banner = get_kb_item( "SSH/banner/" + port );

if( banner && "dropbear" >< tolower( banner ) ) {

  version = "unknown";
  vers = eregmatch( pattern:"SSH-.*dropbear[_-]([0-9.]+)", string:banner );
  if( vers[1] ) version = vers[1];
}

if( ! banner || version == "unknown" ) {

  # The ssh_get_server_banner function will only be available after
  # we switch to libssh 0.6.  Thus for the time being, we use a workaround.
  soc = open_sock_tcp( port );
  if ( ! soc ) exit( 0 );

  buf = recv_line( socket:soc, length:1024 );
  if( buf && "dropbear" >< buf ) {

    version = "unknown";
    vers = eregmatch( pattern:"SSH-.*dropbear[_-]([0-9.]+)", string:buf );
    if( vers[1] ) version = vers[1];
  }
  close( soc );
}

if( version ) {

  replace_kb_item( name:"dropbear/installed", value:TRUE );
  install = port + "/tcp";

  cpe = build_cpe( value:version, exp:"^([0-9.]+)", base:"cpe:/a:matt_johnston:dropbear_ssh_server:" );
  if( isnull( cpe ) )
    cpe = "cpe:/a:matt_johnston:dropbear_ssh_server";

  register_product( cpe:cpe, location:install, port:port );

  log_message( data:build_detection_report( app:"Dropbear",
                                            version:version,
                                            install:install,
                                            cpe:cpe,
                                            concluded:vers[0] ),
                                            port:port );
}

exit( 0 );

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_BusyBox_unprotected_telnet.nasl 5427 2017-02-26 20:21:22Z cfi $
#
# Unprotected BusyBox Telnet Console
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.103696");
  script_version("$Revision: 5427 $");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Unprotected BusyBox Telnet Console");
  script_tag(name:"last_modification", value:"$Date: 2017-02-26 21:21:22 +0100 (Sun, 26 Feb 2017) $");
  script_tag(name:"creation_date", value:"2013-04-11 12:36:40 +0100 (Thu, 11 Apr 2013)");
  script_category(ACT_ATTACK);
  script_family("General");
  script_copyright("This script is Copyright (C) 2013 Greenbone Networks GmbH");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/telnet", 23);

  script_xref(name:"URL", value:"http://www.busybox.net/");

  tag_summary = "The remote BusyBox Telnet Console is not protected by a password.";

  tag_solution = "Set a password.";

  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);

  script_tag(name:"solution_type", value:"Mitigation");
  script_tag(name:"qod_type", value:"remote_vul");

  exit(0);
}

include("telnet_func.inc");

port = get_telnet_port( default:23 );

soc = open_sock_tcp( port );
if( ! soc ) exit( 0 );

buf = telnet_negotiate( socket:soc );

if( "BusyBox" >!< buf && "list of built-in commands" >!< buf ) exit( 0 );

send( socket:soc, data:'id\n' );
recv = recv( socket:soc, length:512 );

send( socket:soc, data:'exit\n' );
close( soc );

if( recv =~ "uid=[0-9]+.*gid=[0-9]+.*" ) {
  security_message( port:port );
  exit( 0 );
}

exit( 99 );

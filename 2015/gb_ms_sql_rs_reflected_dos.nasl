###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_sql_rs_reflected_dos.nasl 5740 2017-03-28 03:23:03Z ckuerste $
#
# MS SQL Server Resolution Service Amplification Reflected DRDoS
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH
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

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.105187");
 script_version ("$Revision: 5740 $");
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");

 script_name("MS SQL Server Resolution Service Amplification Reflected DRDoS");

 script_xref(name:"URL", value:"http://kurtaubuchon.blogspot.de/2015/01/mc-sqlr-amplification-ms-sql-server.html");

 script_tag(name:"last_modification", value:"$Date: 2017-03-28 05:23:03 +0200 (Tue, 28 Mar 2017) $");
 script_tag(name:"creation_date", value:"2015-01-26 13:45:36 +0100 (Mon, 26 Jan 2015)");

 script_category(ACT_ATTACK);
 script_family("Denial of Service");
 script_copyright("This script is Copyright (C) 2015 Greenbone Networks GmbH");
 script_dependencies("mssql_ping.nasl");
 script_require_udp_ports(1434);
 script_mandatory_keys("mssql/remote_version");
 script_exclude_keys("keys/islocalhost","keys/islocalnet");

 script_tag(name:"impact" , value: "Successfully exploiting this vulnerability allows attackers to
cause denial-of-service conditions against remote hosts");

 script_tag(name:"vuldetect" , value: "Send a request with a single byte and check the length of the response");
 script_tag(name:"solution" , value: "Restrict access to this port.");
 script_tag(name:"summary" , value: "The remote MS SQL Server allows distributed reflection and amplification (DRDoS) attacks");
 script_tag(name:"qod_type", value:"registry");
 script_tag(name:"solution_type", value:"VendorFix");

 exit(0);
}

port = 1434;

if( islocalnet() || islocalhost() ) exit( 0 );

soc = open_sock_udp( port );
if( ! soc )  exit();

byte = raw_string( 0x02 );

send( socket:soc, data:byte );
recv = recv( socket:soc, length:4096 );

close( soc );

if( strlen( recv ) > 50 )
{
  report = 'By sending a request with a single byte, we received a response of ' +  strlen( recv ) + ' bytes\n';
  security_message( port:port, proto:'udp', data:report );
  exit( 0 );
}

exit( 99 );


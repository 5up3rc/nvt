###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_solarwinds_lem_default_cmc_credentials.nasl 6159 2017-05-18 09:03:44Z teissa $
#
# SolarWinds Log and Event Manager cmc SSH Default Credentials
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
 script_oid("1.3.6.1.4.1.25623.1.0.105452");
 script_version("$Revision: 6159 $");
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_name("SolarWinds Log and Event Manager cmc SSH Default Credentials");
 script_tag(name:"last_modification", value:"$Date: 2017-05-18 11:03:44 +0200 (Thu, 18 May 2017) $");
 script_tag(name:"creation_date", value:"2015-11-13 19:06:56 +0100 (Fri, 13 Nov 2015)");
 script_category(ACT_ATTACK);
 script_family("Default Accounts");
 script_copyright("This script is Copyright (C) 2015 Greenbone Networks GmbH");
 script_require_ports("Services/ssh", 22);

 script_tag(name: "summary" , value: 'The remote SolarWinds Log and Event Manager is prone to a default account authentication bypass vulnerability.');

 script_tag(name: "impact" , value:'This issue may be exploited by a remote attacker to gain access to sensitive information or modify system configuration.');

 script_tag(name: "vuldetect" , value: 'Try to login with default credentials.');
 script_tag(name: "insight" , value: 'It was possible to login with default credentials: cmc/password');
 script_tag(name: "solution" , value: 'Change the password.');

 script_dependencies("find_service.nasl");

 script_require_ports("Services/ssh", 22, 32022);
 script_tag(name:"qod_type", value:"exploit");
 script_tag(name:"solution_type", value:"Workaround");

 exit(0);
}

include("ssh_func.inc");

port = get_kb_item("Services/ssh");
if( ! port ) exit( 0 );

if( ! get_port_state( port ) ) exit( 0 );

user = 'cmc';
pass = 'password';

soc = open_sock_tcp( port );
if( ! soc ) exit( 0 );

login = ssh_login( socket:soc, login:user, password:pass, pub:FALSE, priv:FALSE, passphrase:FALSE );
if( login == 0 )
{
  buf = ssh_cmd( socket:soc, cmd:"exit", nosh:TRUE, pty:TRUE, pattern:"cmc>" );
  close( soc );

  if( "CMC Build" >< buf )
  {
    security_message( port:port );
    exit( 0 );
  }
}

if( soc ) close( soc );
exit( 99 );


###############################################################################
# OpenVAS Vulnerability Test
# $Id: telnet_func.inc 5480 2017-03-03 17:19:50Z cfi $
#
# Methods to handle telnet
#
# Authors:
# Michel Arboi <arboi@alussinan.org>
#
# Copyright:
# Copyright (C) 2002 Michel Arboi <arboi@alussinan.org>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#
# $Revision: 5480 $
#
###############################################################################

OPT_WILL 	= 0xfb;
OPT_WONT 	= 0xfc;
OPT_DO   	= 0xfd;
OPT_DONT 	= 0xfe;

OPT_SUBOPT 	= 0xfa;
OPT_ENDSUBOPT 	= 0xf0;

function get_telnet_banner( port ) {

  local_var sb, banner, soc;

  if( ! port ) {
    set_kb_item( name:"nvt_debug_empty/" + get_script_oid(), value:get_script_oid() + "#-#port#-#get_telnet_banner" );
    return( 0 );
  }

  if( ! get_port_state( port ) ) return ( 0 );

  sb = "telnet/banner/" + port;
  banner = get_kb_item( sb );
  if( banner ) return( banner );

  soc = open_sock_tcp( port );
  if( ! soc ) return( 0 );
  banner = telnet_negotiate( socket:soc );
  close( soc );
  if( strlen( banner ) )
    replace_kb_item( name:sb, value:str_replace( find:raw_string(0), replace:'', string:banner ) );
  return( banner );
}


function telnet_negotiate( socket ) {

  local_var opt, code, s, counter, counter2, buf, prev;

  if( ! socket ) set_kb_item( name: "nvt_debug_empty/" + get_script_oid(), value:get_script_oid() + "#-#socket#-#telnet_negotiate" );

  counter = 0;

  while( TRUE ) {
    s = recv( socket:socket, length:1, timeout:3 );
    if( ! strlen( s ) ) break;
    if( ord( s[0] ) != 0xff ) buf += s;
    else {
      counter++;
    s  = recv( socket:socket, length:2 );

    if( ord( s[0] ) == OPT_DO ) send( socket:socket, data:raw_string( 0xff, OPT_WONT ) + s[1] );
    if( ord( s[0] ) == OPT_WILL ) send( socket:socket, data:raw_string( 0xff, OPT_DONT ) + s[1] );
    if( ord( s[0] ) == OPT_SUBOPT ) {
      # The remote telnet server is autistic :/
      prev = recv(socket:socket, length:1);
      counter2 = 0;
      while( ord( prev ) != 0xff && ord( s[0] ) != OPT_ENDSUBOPT ) {
        prev = s;
        # No timeout - the answer is supposed to be cached
        s = recv( socket:socket, length:1, timeout:0 );
        if ( ! strlen( s ) ) return buf;
        counter2++;
	if( counter2 >= 100 ) return buf;
      }
    }
    # Not necessary and may introduce endless loops
    #if ( ord(s[0]) == OPT_DONT ) send( socket:socket, data:raw_string( 0xff, OPT_WONT ) + s[1] );
    #if ( ord(s[0]) == OPT_WONT ) send( socket:socket, data:raw_string( 0xff, OPT_DONT ) + s[1] );
    }
    if( counter >= 100 || strlen( buf ) >= 4096 ) break;
  }
  return buf;
}

function set_telnet_banner( port, banner ) {

  local_var sb;

  if( ! port ) set_kb_item( name: "nvt_debug_empty/" + get_script_oid(), value:get_script_oid() + "#-#port#-#set_telnet_banner" );
  if( ! banner ) set_kb_item( name: "nvt_debug_empty/" + get_script_oid(), value:get_script_oid() + "#-#banner#-#set_telnet_banner" );

  sb = "telnet/banner/" + port;
  replace_kb_item( name:sb, value:str_replace( find:raw_string(0), replace:'', string:banner ) );
}

function get_telnet_port( default ) {

  local_var default, port;

  if( ! default ) set_kb_item( name: "nvt_debug_empty/" + get_script_oid(), value:get_script_oid() + "#-#default#-#get_telnet_port" );

  port = get_kb_item( "Services/telnet" );
  if( port ) default = port;

  # PJL ports printing everything sent to them
  # so exit for such a port here
  if( telnet_is_pjl_port( port:default ) ) exit( 0 );

  if( ! get_port_state( default ) ) exit( 0 );

  return default;
}

# Duplicated from misc_func.inc
function telnet_is_pjl_port( port ) {

  local_var port, pjl_ports, pjl_port;

  if( ! port ) {
    set_kb_item( name:"nvt_debug_empty/" + get_script_oid(), value:get_script_oid() + "#-#port#-#telnet_is_pjl_port" );
    return;
  }

  pjl_ports = get_kb_list( 'Services/PJL' );
  if( ! pjl_ports ) return;

  foreach pjl_port( pjl_ports ) {
    if( port == pjl_port ) return TRUE;
  }

  return;
}
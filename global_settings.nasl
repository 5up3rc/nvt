###############################################################################
# OpenVAS Vulnerability Test
# $Id: global_settings.nasl 7366 2017-10-06 10:55:39Z cfischer $
#
# Global variable settings
#
# Authors:
# Michel Arboi <arboi@alussinan.org>
#
# Copyright:
# Copyright (C) 2004 Michel Arboi
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
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
  script_oid("1.3.6.1.4.1.25623.1.0.12288");
  script_version("$Revision: 7366 $");
  script_tag(name:"last_modification", value:"$Date: 2017-10-06 12:55:39 +0200 (Fri, 06 Oct 2017) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("Global variable settings");
  script_category(ACT_SETTINGS);
  script_copyright("This script is Copyright (C) 2004 Michel Arboi");
  script_family("Settings");

  script_add_preference(name:"Enable CGI scanning", type:"checkbox", value:"yes");
  script_add_preference(name:"Regex pattern to exclude directories from CGI scanning : ", type:"entry", value:"/(index\.php|image|img|css|js$|js/|javascript|style|theme|icon|jquery|graphic|grafik|picture|bilder)");
  script_add_preference(name:"Use regex pattern to exclude directories from CGI scanning : ", type:"checkbox", value:"yes");

  script_add_preference(name:"Enable generic web application scanning", type:"checkbox", value:"no");

  script_add_preference(name:"Network type", type:"radio", value:"Mixed (use RFC 1918);Private LAN; Public WAN (Internet)");
  script_add_preference(name:"Report verbosity", type:"radio", value:"Normal;Quiet;Verbose");

  script_add_preference(name:"Log verbosity", type:"radio", value:"Normal;Quiet;Verbose;Debug");
  script_add_preference(name:"Debug level", type:"entry", value:"0");
  script_add_preference(name:"HTTP User-Agent", type:"entry", value: "");
  script_add_preference(name:"Strictly unauthenticated", type:"checkbox", value: "no");
  script_add_preference(name:"Exclude printers from scan", type:"checkbox", value:"yes");
  script_add_preference(name:"Enable SSH Debug", type:"checkbox", value:"no");
  script_add_preference(name:"Mark host as dead if going offline (failed ICMP ping) during scan", type:"checkbox", value:"no");
  script_add_preference(name:"Service discovery on non-default UDP ports (slow)", type:"checkbox", value:"no");

  script_tag(name:"summary", value:"This plugin configures miscellaneous global variables for OpenVAS scripts.
  It does not perform any security check but may disable or change the behaviour of others.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("network_func.inc");

opt = script_get_preference( "Service discovery on non-default UDP ports (slow)" );
if( opt == "yes" ) set_kb_item( name:"Settings/non-default_udp_service_discovery", value:TRUE );

opt = script_get_preference( "Mark host as dead if going offline (failed ICMP ping) during scan" );
if( opt == "yes" ) set_kb_item( name:"Settings/mark_host_dead_failed_icmp", value:TRUE );

opt = script_get_preference( "Enable CGI scanning" );
if( opt == "no" ) set_kb_item( name:"Settings/disable_cgi_scanning", value:TRUE );

opt = script_get_preference( "Enable generic web application scanning" );
if( opt == "no" ) set_kb_item( name:"Settings/disable_generic_webapp_scanning", value:TRUE );

opt = script_get_preference( "Regex pattern to exclude directories from CGI scanning : " );
if( ! opt ) {
  set_kb_item( name:"Settings/cgi_dirs_exclude_pattern", value:"/(index\.php|image|img|css|js$|javascript|style|theme|icon|jquery|graphic|grafik|picture|bilder)" );
} else {
  set_kb_item( name:"Settings/cgi_dirs_exclude_pattern", value:opt );
}

opt = script_get_preference( "Use regex pattern to exclude directories from CGI scanning : " );
if( opt != "no" ) set_kb_item( name:"Settings/use_cgi_dirs_exclude_pattern", value:TRUE );

opt = script_get_preference( "Report verbosity" );
if( ! opt ) opt = "Normal";
set_kb_item( name:"global_settings/report_verbosity", value:opt );

opt = script_get_preference( "Log verbosity" );
if( ! opt ) opt = "Quiet";
set_kb_item( name:"global_settings/log_verbosity", value:opt );

opt = script_get_preference( "Debug level" );
if( ! opt ) opt = "0";
set_kb_item( name:"global_settings/debug_level", value:int( opt ) );

opt = script_get_preference( "Network type" );
if( ! opt ) opt = "Mixed (RFC 1918)";
set_kb_item( name:"global_settings/network_type", value:opt );

opt = script_get_preference( "HTTP User-Agent" );
if( ! opt ) opt = "Mozilla/5.0 [en] (X11, U; OpenVAS " + OPENVAS_VERSION + ")";
set_kb_item( name:"global_settings/http_user_agent", value:opt );
set_kb_item( name:"http/user-agent", value:opt );

opt = script_get_preference( "Strictly unauthenticated" );
if( opt == "yes" ) set_kb_item( name:"global_settings/authenticated_scans_disabled", value:TRUE );

opt = script_get_preference( "Exclude printers from scan" );
if( opt == "yes" ) set_kb_item( name:"global_settings/exclude_printers", value:"yes" );

cgi_bin = cgibin();
cgis = split( cgi_bin, sep:":", keep:FALSE );
foreach cgi( cgis ) {
  set_kb_item( name:"/user/cgis", value:cgi );
}

opt = script_get_preference( "Enable SSH Debug" );
if( opt == "yes" ) set_kb_item( name:"global_settings/ssh/debug", value:TRUE );

if( TARGET_IS_IPV6() )
  set_kb_item( name:"keys/TARGET_IS_IPV6", value:TRUE );

if( islocalhost() )
  set_kb_item( name:"keys/islocalhost", value:TRUE );

if( islocalnet() )
  set_kb_item( name:"keys/islocalnet", value:TRUE );

if( is_private_addr() )
  set_kb_item( name:"keys/is_private_addr", value:TRUE );

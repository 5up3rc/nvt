###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_endpoint_manager_mdm_installed.nasl 6125 2017-05-15 09:03:42Z teissa $
#
# IBM Endpoint Manager MDM Installed
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

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.105131");
 script_tag(name:"cvss_base", value:"0.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_tag(name:"qod_type", value:"remote_banner");
 script_version ("$Revision: 6125 $");
 script_tag(name:"last_modification", value:"$Date: 2017-05-15 11:03:42 +0200 (Mon, 15 May 2017) $");
 script_tag(name:"creation_date", value:"2014-12-03 13:24:33 +0100 (Wed, 03 Dec 2014)");
 script_name("IBM Endpoint Manager MDM Installed");

 script_tag(name: "summary" , value: "The script sends a connection
request to the server and attempts to detect if Mobile Device Management
component is installed.");

 script_category(ACT_GATHER_INFO);
 script_family("Product detection");
 script_copyright("This script is Copyright (C) 2014 Greenbone Networks GmbH");
 script_dependencies("gb_ibm_endpoint_manager_web_detect.nasl");
 script_require_ports("Services/www", 443);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_mandatory_keys("ibm_endpoint_manager/installed");
 exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");
include("global_settings.inc");
include("cpe.inc");
include("host_details.inc");

port = get_http_port( default:443 );

url = '/';
req = http_get( item:url, port:port );
buf = http_keepalive_send_recv( port:port, data:req, bodyonly:FALSE );

if( ">Mobile Device Enrollment<" >< buf && "_mdm_session=" >< buf && "Server: Jetty" >< buf )
{
  set_kb_item( name:'ibm_endpoint_manager/MDM', value:TRUE );
  log_message( port:port, data:"IBM Endpoint Manager Mobile Device Management is running at this port" );
  exit( 0 );
}

exit( 0 );


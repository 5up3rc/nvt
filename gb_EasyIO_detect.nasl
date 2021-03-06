###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_EasyIO_detect.nasl 4969 2017-01-09 10:12:25Z ckuerste $
#
# EasyIO Detection
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
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
 script_oid("1.3.6.1.4.1.25623.1.0.140105");
 script_tag(name:"cvss_base", value:"0.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version ("$Revision: 4969 $");
 script_tag(name:"last_modification", value:"$Date: 2017-01-09 11:12:25 +0100 (Mon, 09 Jan 2017) $");
 script_tag(name:"creation_date", value:"2016-12-28 14:32:35 +0100 (Wed, 28 Dec 2016)");
 script_name("EasyIO Detection");

 script_tag(name: "summary" , value: "The script performs HTTP based detection of EasyIO");

 script_tag(name:"qod_type", value:"remote_banner");

 script_category(ACT_GATHER_INFO);
 script_family("Product detection");
 script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

port = get_http_port( default:80 );

url = '/sdcard/cpt/app/signin.php';
req = http_get( item:url, port:port );
buf = http_keepalive_send_recv( port:port, data:req, bodyonly:FALSE );

if( "<title>Signin CPT Graphics</title>" >!< buf ) exit( 0 );

cpe = 'cpe:/a:easyio:easyio';
set_kb_item( name:"easyio/installed", value:TRUE );

register_product( cpe:cpe, location:"/sdcard/cpt/app/", port:port, service:"www" );

report = build_detection_report( app:"EasyIO", version:"unknown", install:"/sdcard/cpt/app/",  cpe:cpe );

log_message( port:port, data:report );

exit( 0 );



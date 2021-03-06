###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_hnap_detect.nasl 6032 2017-04-26 09:02:50Z teissa $
#
# HNAP Detection
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

SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.103908";   

if (description)
{
 script_oid(SCRIPT_OID);
 script_tag(name:"cvss_base", value:"0.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_tag(name:"qod_type", value:"remote_banner");
 script_version ("$Revision: 6032 $");
 script_tag(name:"last_modification", value:"$Date: 2017-04-26 11:02:50 +0200 (Wed, 26 Apr 2017) $");
 script_tag(name:"creation_date", value:"2014-02-18 11:22:35 +0100 (Tue, 18 Feb 2014)");
 script_name("HNAP Detection");

 tag_summary =
"The script sends a connection request to the server and attempts
to determine if HNAP is supported.";


 script_tag(name : "summary" , value : tag_summary);
 
 script_category(ACT_GATHER_INFO);
 script_family("Service detection");
 script_copyright("This script is Copyright (C) 2014 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80, 8099);
 script_exclude_keys("Settings/disable_cgi_scanning");
 exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port( default:8080 );

if( ! get_port_state( port ) ) exit (0);

url = '/HNAP1';
req = http_get( item:url, port:port );
buf = http_send_recv( port:port, data:req, bodyonly:FALSE );

if( "soap:Envelope" >< buf && "SOAPActions" >< buf && "http://purenetworks.com/HNAP1" >< buf )
{
  if( "<VendorName>" >< buf )
  {
    vendor = eregmatch( pattern:"<VendorName>([^<]+)</VendorName>", string:buf );
    if( ! isnull( vendor[1] ) )
    {
      set_kb_item(name:"HNAP/vendor", value:vendor[1]);
      report += 'Vendor: ' + vendor[1] + '\n';
    }  
  }  

  if( "<ModelName>" >< buf )
  {
    model = eregmatch( pattern:"<ModelName>([^<]+)</ModelName>", string:buf );
    if( ! isnull( model[1] ) )
    {
      set_kb_item(name:"HNAP/model", value:model[1]);
      report += 'Model: ' + model[1] + '\n';
    }  
  }

  if( "<FirmwareVersion>" >< buf )
  {
    fw = eregmatch( pattern:"<FirmwareVersion>([^<]+)</FirmwareVersion>", string:buf );
    if( ! isnull( fw[1] ) )
    {
      set_kb_item(name:"HNAP/firmware", value:fw[1]);
      report += 'Firmware: ' + fw[1] + '\n';
    }  
  }  

  set_kb_item(name:"HNAP/port", value:port);
  log_message(data:'The remote host supports the Home Network Administration Protocol (HNAP).\n' + report, port:port);

  exit( 0 );
}  

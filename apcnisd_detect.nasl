###############################################################################
# OpenVAS Vulnerability Test
# $Id: apcnisd_detect.nasl 7000 2017-08-24 11:51:46Z teissa $
#
# apcupsd and apcnisd Detection
#
# Authors:
# Michael Meyer
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH
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

tag_summary = "This host is running apcupsd or apcnisd . apcupsd and apcnisd
   can be used for power mangement and controlling of APC's UPS
   models.";

if (description)
{
 script_id(100292);
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version("$Revision: 7000 $");
 script_tag(name:"last_modification", value:"$Date: 2017-08-24 13:51:46 +0200 (Thu, 24 Aug 2017) $");
 script_tag(name:"creation_date", value:"2009-10-05 19:43:01 +0200 (Mon, 05 Oct 2009)");
 script_tag(name:"cvss_base", value:"0.0");

 script_name("apcupsd and apcnisd Detection");
 script_category(ACT_GATHER_INFO);
 script_tag(name:"qod_type", value:"remote_banner");
 script_family("Service detection");
 script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl");
 script_require_ports("Services/unknown", 3551, 7000);
 script_tag(name : "summary" , value : tag_summary);
 script_xref(name : "URL" , value : "http://www.apcupsd.com/");
 exit(0);
}

include("misc_func.inc");
include("global_settings.inc");

ports = make_list(7000, 3551);

foreach port (ports) {

  if(!get_port_state(port))continue;
  soc = open_sock_tcp(port);
  if(!soc)continue;
  req  = raw_string(0x00, 0x06);
  req += string("status");

  send(socket:soc, data:req);
  buf = recv(socket:soc, length:4096);
  
  if("APC" >< buf && "STATUS" >< buf) {
   register_service(port:port, proto:"apcnisd"); 
   if(report_verbosity > 0) { 
      log_message(port:port);
      exit(0);
   }   
 }  
}

exit(0);

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_SyndeoCMS_detect.nasl 5736 2017-03-27 13:36:24Z cfi $
#
# SyndeoCMS Detection
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH
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

tag_summary = "This host is running SyndeoCMS, an Open Source Content Management
System.";

if(description)
{
 script_id(100783);
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version("$Revision: 5736 $");
 script_tag(name:"last_modification", value:"$Date: 2017-03-27 15:36:24 +0200 (Mon, 27 Mar 2017) $");
 script_tag(name:"creation_date", value:"2010-09-06 14:44:23 +0200 (Mon, 06 Sep 2010)");
 script_tag(name:"cvss_base", value:"0.0");
 script_name("SyndeoCMS Detection");
 script_category(ACT_GATHER_INFO);
 script_tag(name:"qod_type", value:"remote_banner");
 script_family("Service detection");
 script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "summary" , value : tag_summary);
 script_xref(name : "URL" , value : "http://www.syndeocms.org");
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

SCRIPT_OID = "1.3.6.1.4.1.25623.1.0.100783";
SCRIPT_DESC = "SyndeoCMS Detection";

port = get_http_port(default:80);
if(!can_host_php(port:port))exit(0);

foreach dir( make_list_unique( "/cms", cgi_dirs( port:port ) ) ) {

 install = dir;
 if( dir == "/" ) dir = "";
 url = dir + "/index.php";
 buf = http_get_cache( item:url, port:port );
 if( buf == NULL ) continue;

 if("SyndeoCMS" >< buf)  {

    vers = string("unknown");
    ### try to get version 

    url = string(dir, "/starnet/README.txt");
    req = http_get(item:url, port:port);
    buf = http_keepalive_send_recv(port:port, data:req, bodyonly:TRUE);
    if( buf == NULL )continue;

    version = eregmatch(string: buf, pattern: "Version ([0-9.]+)",icase:TRUE);

    if ( !isnull(version[1]) ) {
       vers=chomp(version[1]);
    } else {

      url = string(dir, "/starnet/CHANGELOG.txt");
      req = http_get(item:url, port:port);
      buf = http_keepalive_send_recv(port:port, data:req, bodyonly:TRUE);
      if( buf == NULL )continue;

      version = eregmatch(string: buf, pattern: "Changelist for ([0-9.]+)",icase:TRUE);
    }  
   
    set_kb_item(name: string("www/", port, "/syndeocms"), value: string(vers," under ",install));

    if(vers != "unknown") {
      register_host_detail(name:"App", value:string("cpe:/a:syndeocms:syndeocms:",vers), nvt:SCRIPT_OID, desc:SCRIPT_DESC);
    } else {
      register_host_detail(name:"App", value:string("cpe:/a:syndeocms:syndeocms:"), nvt:SCRIPT_OID, desc:SCRIPT_DESC);
    }  

    info = string("SyndeoCMS Version '");
    info += string(vers);
    info += string("' was detected on the remote host in the following directory(s):\n\n");
    info += string(install, "\n");
    log_message(port:port,data:info);
    exit(0);
  }
}

exit(0);

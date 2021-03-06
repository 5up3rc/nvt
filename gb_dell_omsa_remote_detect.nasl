###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_dell_omsa_remote_detect.nasl 6919 2017-08-14 09:55:24Z ckuersteiner $
#
# Dell OpenManage Server Administrator Remote Detection
#
# Authors:
# Rinu Kuriaksoe <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807563");
  script_version("$Revision: 6919 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-08-14 11:55:24 +0200 (Mon, 14 Aug 2017) $");
  script_tag(name:"creation_date", value:"2016-04-27 10:47:16 +0530 (Wed, 27 Apr 2016)");
  script_name("Dell OpenManage Server Administrator Remote Detection");

  script_tag(name : "summary" , value : "Detection of installed version
  of Dell OpenManage Server Administrator.

  This script sends HTTP GET request and try to get the version from the
  response, and sets the result in KB.");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 1311);
  exit(0);
}

##
### Code Starts Here
##

include("cpe.inc");
include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");

##Get HTTP Port
omsaPort = get_http_port(default:1311);

## Taking care of root installation and servlet installation
foreach dir (make_list("/", "/servlet"))
{
  install = dir;
  if( dir == "/" ) dir = "";

  ## Send and Receive the response
  omsaReq = http_get(item: string(dir, "/Login?omacmd=getlogin&page=Login&managedws=true"), port:omsaPort);
  omsaRes = http_keepalive_send_recv(port:omsaPort, data:omsaReq);

  ##Confirm Application
  if('application">Server Administrator' >< omsaRes && '>Login' >< omsaRes &&
     'dell' >< omsaRes)
  {
    ## Send and Receive the response
    url =  dir + "/UDataArea?plugin=com.dell.oma.webplugins.AboutWebPlugin";
    omsaReq = http_get(item: url, port:omsaPort);
    omsaRes = http_keepalive_send_recv(port:omsaPort, data:omsaReq);
   
    ## Grep for version
    vers = eregmatch(pattern:'class="desc25">Version ([0-9.]+)' , string:omsaRes);
    if(vers[1]){
      omsaVer = vers[1];
    } else {
      omsaVer = "Unknown";
    }

    ## Set the KB value
    set_kb_item(name:"Dell/OpenManage/Server/Administrator/Installed", value:TRUE);

    ## build cpe and store it as host_detail
    cpe = build_cpe(value:omsaVer, exp:"^([0-9.]+)", base:"cpe:/a:dell:openmanage_server_administrator:");
    if(!cpe)
      cpe= "cpe:/a:dell:openmanage_server_administrator";

    register_product(cpe:cpe, location:install, port:omsaPort);

    log_message(data: build_detection_report(app: "Dell OpenManage Server Administrator",
                                             version: omsaVer,
                                             install: install,
                                             cpe: cpe,
                                             concluded: vers[0], concludedUrl: url),
                port: omsaPort);
    exit(0);
  }
}

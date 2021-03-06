###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_netscape_fasttrack_server_detect.nasl 6813 2017-07-31 08:25:50Z santu $
#
# Netscape FastTrack Server Version Detection
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.811544");
  script_version("$Revision: 6813 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-07-31 10:25:50 +0200 (Mon, 31 Jul 2017) $");
  script_tag(name:"creation_date", value:"2017-07-28 13:24:46 +0530 (Fri, 28 Jul 2017)");
  script_name("Netscape FastTrack Server Version Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"Detection of installed version
  of Netscape FastTrack Server.

  This script sends HTTP GET request and try to get the version from the
  response, and sets the result in KB.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");


##variable initialization
netport = 0;
netver = "";
cpe = "";

##Get HTTP Port
if(!netport = get_http_port(default:80)){
  exit(0);
}

## Get banner
banner = get_http_banner(port:netport);

#Confirm application
if(banner && "Server: Netscape-FastTrack" >< banner)
{
  netver = "Unknown";

  ## Set kb
  set_kb_item(name:"Netscape/FastTrack/Server/Installed", value:TRUE);

  ## Grep for version
  netver = eregmatch( pattern:'Netscape-FastTrack/([0-9.]+)', string:banner);
  if(netver[1])
  {
    netver = netver[1]; 
    set_kb_item(name:"Netscape/FastTrack/Server/version", value:netver);
  }

  ## build cpe and store it as host_detail
  cpe = build_cpe(value: netver, exp:"^([0-9.]+)", base:"cpe:/a:netscape:fasttrack_server:");
  if(!cpe)
    cpe = "cpe:/a:netscape:fasttrack_server";

  register_product(cpe:cpe, location:"/", port:netport);

  log_message(data: build_detection_report(app: "Netscape FastTrack Server",
                                           version: netver,
                                           install: "/",
                                           cpe: cpe,
                                           concluded: netver),
                                           port: netport);
}

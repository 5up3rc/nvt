###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ipswitch_whatsup_detect.nasl 5877 2017-04-06 09:01:48Z teissa $
#
# Ipswitch WhatsUp Gold Detection
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
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
 script_oid("1.3.6.1.4.1.25623.1.0.106162");
 script_version ("$Revision: 5877 $");
 script_tag(name: "last_modification", value: "$Date: 2017-04-06 11:01:48 +0200 (Thu, 06 Apr 2017) $");
 script_tag(name: "creation_date", value: "2016-08-02 08:27:33 +0700 (Tue, 02 Aug 2016)");
 script_tag(name: "cvss_base", value: "0.0");
 script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:N/C:N/I:N/A:N");

 script_tag(name: "qod_type", value: "remote_banner");

 script_name("Ipswitch WhatsUp Gold Detection");

 script_tag(name: "summary" , value: "Detection of Ipswitch WhatsUp Gold

The script sends a connection request to the server and attempts to detect the presence of Ipswitch WhatsUp
Gold and to extract its version");

 script_category(ACT_GATHER_INFO);

 script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
 script_family("Product detection");
 script_dependencies("find_service.nasl");
 script_require_ports("Services/www", 443);
 script_exclude_keys("Settings/disable_cgi_scanning");

 script_xref(name: "URL", value: "https://www.ipswitch.com/application-and-network-monitoring/whatsup-gold");


 exit(0);
}

include("cpe.inc");
include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default: 443);

res = http_get_cache(item: "/", port: port);

if ("Server: WhatsUp" >!< res)
  exit(0);

host = http_host_name(port: port);

req = 'POST /NmConsole/CoreNm/User/DlgUserLogin/DlgUserLogin.asp HTTP/1.1\r\n' +
      'Host: ' + host + '\r\n' +
      # Seems to need a proper User Agent, OPENVAS_HTTP_USER_AGENT doesn't work
      'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:47.0) Gecko/20100101 Firefox/47.0\r\n' +
      'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\n' +
      'Accept-Language: en-US,en;q=0.5\r\n' +
      'Accept-Encoding: gzip, deflate\r\n' +
      'Connection: close\r\n' +
      'Content-Type: application/x-www-form-urlencoded\r\n' +
      'Content-Length: 0\r\n\r\n';

res  = http_keepalive_send_recv(port: port, data: req);

if ("Login - WhatsUp Gold" >< res) {
  version = "unknown";

  vers = eregmatch(pattern: '"VersionText">.remium Edition&nbsp;v([0-9.]+)( Build ([0-9]+))?', string: res);
  if (!isnull(vers[1]))
    version = vers[1];

  if (!isnull(vers[3]))
    build = vers[3];

  set_kb_item(name: "ipswitch_whatsup/installed", value: TRUE);
  if (version != "unknown")
    set_kb_item(name: "ipswitch_whatsup/version", value: version);
  if (build)
    set_kb_item(name: "ipswitch_whatsup/build", value: build);

  cpe = build_cpe(value: version, exp: "^([0-9.]+)", base: "cpe:/a:ipswitch:whatsup_gold:");
  if (!cpe)
    cpe = "cpe:/a:ipswitch:whatsup_gold";

  register_product(cpe: cpe, location: "/", port: port);

  log_message(data: build_detection_report(app: "Ipswitch WhatsUp Gold", version: version, install: "/",
                                           cpe: cpe, concluded: vers[0]),
              port: port);
  exit(0);
}

exit(0);

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_hp_printer_detect.nasl 7288 2017-09-27 07:21:24Z cfischer $
#
# HP Printer Detection
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
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
  script_oid("1.3.6.1.4.1.25623.1.0.103675");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 7288 $");
  script_tag(name:"last_modification", value:"$Date: 2017-09-27 09:21:24 +0200 (Wed, 27 Sep 2017) $");
  script_tag(name:"creation_date", value:"2013-03-07 14:31:24 +0100 (Thu, 07 Mar 2013)");
  script_name("HP Printer Detection");
  script_category(ACT_GATHER_INFO);
  script_family("Product detection");
  script_copyright("This script is Copyright (C) 2013 Greenbone Networks GmbH");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"Detection of HP Printers.

  The script sends a connection request to the remote host and
  attempts to detect if the remote host is a HP printer.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("hp_printers.inc");
include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");
include("misc_func.inc");

port = get_http_port(default:80);

urls = get_hp_detect_urls();

foreach url (keys(urls)) {

  buf = http_get_cache(item:url, port:port);

  if(match = eregmatch(pattern:urls[url], string:buf, icase:TRUE)) {

    if(isnull(match[1]))continue;

    if(!isnull(match[5]))
      model = match[5];
    else if(!isnull(match[4]))
      model = match[4];
    else if(!isnull(match[3]))
      model = match[3];
    else if (isnull(match[3]) && !isnull(match[2]))
      model = match[2];
    else
      model = match[1];

    if(!model)exit(0);

    chomp(model);

    if( "Server: HP HTTP Server" >< buf )
    {
      version = eregmatch( pattern:'Server: HP HTTP Server.*\\{([^},]+).*\\}[\r\n]+', string:buf );
      if( ! isnull( version[1] ) ) fw_ver = version[1];
    }

    set_kb_item(name:"target_is_printer", value:1);
    set_kb_item(name:"hp_printer/installed", value:1);
    set_kb_item(name:"hp_printer/port", value: port);
    set_kb_item(name:"hp_model", value:model);

    if( fw_ver )  set_kb_item( name:"hp_fw_ver", value:fw_ver );

    cpe_model = tolower(model);

    cpe = 'cpe:/h:hp:' + cpe_model;
    cpe = str_replace(string:cpe,find:" ", replace:":", count:1);
    cpe = str_replace(string:cpe,find:" ", replace:"_");

    register_product(cpe:cpe, location:port + '/tcp', port:port);

    report = 'The remote Host is a HP ' + model + ' printer device.\nCPE: ' + cpe + '\n';

    if( fw_ver ) report += 'Firmware version: ' + fw_ver + '\n';

    report += 'Concluded: ' + match[0];

    log_message(data:report, port:port);

    pref = get_kb_item("global_settings/exclude_printers");
    if( pref  == "yes" )
    {
        replace_kb_item( name:"Host/dead", value:TRUE );
        log_message( port:port, data:'The remote host is a printer. The scan has been disabled against this host.\nIf you want to scan the remote host, uncheck the "Exclude printers from scan" option and re-scan it.');
    }

    exit(0);

  }
}

exit(0);

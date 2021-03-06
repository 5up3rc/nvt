###############################################################################
# OpenVAS Vulnerability Test
# $Id: FormMail_detect.nasl 5864 2017-04-05 07:47:30Z cfi $
#
# FormMail Detection
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100201");
  script_version("$Revision: 5864 $");
  script_tag(name:"last_modification", value:"$Date: 2017-04-05 09:47:30 +0200 (Wed, 05 Apr 2017) $");
  script_tag(name:"creation_date", value:"2009-05-14 20:19:12 +0200 (Thu, 14 May 2009)");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("FormMail Detection");  
  script_category(ACT_GATHER_INFO);
  script_family("Product detection");
  script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"http://www.scriptarchive.com/formmail.html");

  script_tag(name:"summary", value:"The FormMail Script was found at this port. FormMail is a generic
  HTML form to e-mail gateway that parses the results of any form and
  sends them to the specified users.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

port = get_http_port( default:80 );

files = make_list( "formmail.pl", "formmail.pl.cgi", "FormMail.cgi", "FormMail.pl" );

foreach dir( make_list_unique( "/formmail", cgi_dirs( port:port ) ) ) {

  install = dir;
  if( dir == "/" ) dir = "";

  foreach file( files ) {

    url = dir + "/" + file;
    req = http_get( item:url, port:port );
    buf = http_keepalive_send_recv( port:port, data:req, bodyonly:FALSE );
    if( isnull( buf ) ) continue;

    if( egrep( pattern:'FormMail', string:buf, icase:TRUE ) &&
        ( egrep( pattern:'A Free Product of', string:buf, icase:TRUE ) ||
          egrep( pattern:'Bad Referrer', string:buf, icase:TRUE ) ) ) { 

      vers = "unknown";

      version = eregmatch( string:buf, pattern:'FormMail.*v([0-9.]+)', icase:TRUE );

      if( ! isnull( version[1] ) ) vers = version[1];

      tmp_version = vers + " under " + install;
      set_kb_item( name:"www/" + port + "/FormMail", value:tmp_version );
      set_kb_item( name:"www/" + port + "/FormMail/file", value:file );
      replace_kb_item( name:"FormMail/installed", value:TRUE );

      cpe = build_cpe( value:tmp_version, exp:"^([0-9.]+)", base:"cpe:/a:matt_wright:formmail:" );
      if( isnull( cpe ) )
        cpe = "cpe:/a:matt_wright:formmail";

      register_product( cpe:cpe, location:install, port:port );

      log_message( data:build_detection_report( app:"FormMail",
                                                version:vers,
                                                install:install,
                                                cpe:cpe,
                                                concluded:version[0] ),
                                                port:port );
      exit( 0 );
    }
  }
}

exit( 0 );

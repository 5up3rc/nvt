###############################################################################
# OpenVAS Vulnerability Test
# $Id: dont_scan_printers.nasl 6315 2017-06-12 10:34:26Z cfischer $
#
# Do not scan printers
#
# Authors:
# Michel Arboi <arboi@alussinan.org>
#
# Copyright:
# Copyright (C) 2003 by Michel Arboi
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
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
  script_oid("1.3.6.1.4.1.25623.1.0.11933");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 6315 $");
  script_tag(name:"last_modification", value:"$Date: 2017-06-12 12:34:26 +0200 (Mon, 12 Jun 2017) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("Do not scan printers");
  script_category(ACT_SETTINGS);
  script_copyright("This script is Copyright (C) 2003 by Michel Arboi");
  script_family("Settings");
  script_dependencies("global_settings.nasl", "dont_print_on_printers.nasl");
  script_mandatory_keys("global_settings/exclude_printers");

  script_tag(name:"summary", value:"The host seems to be a printer. The scan has been disabled against this host.");

  script_tag(name:"solution", value:"If you want to scan the remote host, uncheck the 'Exclude printers from scan' option
  within the 'Global variable settings' and re-scan it.");

  script_tag(name:"insight", value:"Many printers react very badly to a network scan. Some of them will crash, 
  while others will print a number of pages. This usually disrupt office work
  and is usually a nuisance. As a result, the scan has been disabled against this host.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("global_settings.inc");

pref = get_kb_item( "global_settings/exclude_printers" );

if( get_kb_item( "Host/scanned" ) == 0 ) exit( 0 );

if( ! is_printer = get_kb_item( "Host/is_printer" ) ) exit( 0 );

if( pref && pref != "no" ) {
  replace_kb_item( name:"Host/dead", value:TRUE );
  log_message( port:0 );
}

exit( 0 );
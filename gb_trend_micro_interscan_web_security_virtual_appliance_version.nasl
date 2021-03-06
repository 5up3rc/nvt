###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_trend_micro_interscan_web_security_virtual_appliance_version.nasl 6040 2017-04-27 09:02:38Z teissa $
#
# Trend Micro Interscan Web Security Virtual Appliance Detection
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH
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
 script_oid("1.3.6.1.4.1.25623.1.0.105246");
 script_tag(name:"cvss_base", value:"0.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version ("$Revision: 6040 $");
 script_tag(name:"last_modification", value:"$Date: 2017-04-27 11:02:38 +0200 (Thu, 27 Apr 2017) $");
 script_tag(name:"creation_date", value:"2015-04-08 10:07:13 +0200 (Wed, 08 Apr 2015)");
 script_name("Trend Micro Interscan Web Security Virtual Appliance Detection");

 script_tag(name: "summary" , value: "This script performs SSH based detection of Trend Micro Interscan Web Security Virtual Appliance");

 script_tag(name:"qod_type", value:"package");

 script_category(ACT_GATHER_INFO);
 script_family("Product detection");
 script_copyright("This script is Copyright (C) 2015 Greenbone Networks GmbH");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("IWSVA/system");
 exit(0);
}

include("host_details.inc");

if( ! system = get_kb_item( "IWSVA/system" ) ) exit( 0 );

if( "IWSVA" >!< system ) exit( 0 );

set_kb_item( name:"IWSVA/installed", value:TRUE );

cpe = 'cpe:/a:trendmicro:interscan_web_security_virtual_appliance';

match = eregmatch( pattern:"IWSVA ([0-9.]+)_Build_Linux_([0-9]+)", string:system );

rep_vers = 'unknown';

if( ! isnull( match[1] ) )
{
  vers = match[1];
  set_kb_item( name:"IWSVA/version", value:vers );
  cpe += ':' + vers;
}

if( ! isnull( match[2] ) )
{
  build = match[2];
  set_kb_item( name:"IWSVA/build", value:build );
}

register_product( cpe:cpe, location:'ssh' );

report = 'Detected Trend Micro Interscan Web Security Virtual Appliance (ssh)\n' +
         'Version: ' + vers + '\n';

if( build ) report+=  'Build:   ' + build + '\n';

report += 'CPE:     ' + cpe + '\n';
log_message( port:0, data:report );

exit( 0 );


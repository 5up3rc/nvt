###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_emc_data_domain_detect_snmp.nasl 7236 2017-09-22 14:59:19Z cfischer $
#
# EMC Data Domain Detection (SNMP)
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
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
 script_oid("1.3.6.1.4.1.25623.1.0.140142");
 script_tag(name:"cvss_base", value:"0.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version ("$Revision: 7236 $");
 script_tag(name:"last_modification", value:"$Date: 2017-09-22 16:59:19 +0200 (Fri, 22 Sep 2017) $");
 script_tag(name:"creation_date", value:"2017-02-01 12:25:05 +0100 (Wed, 01 Feb 2017)");
 script_name("EMC Data Domain Detection (SNMP)");

 script_tag(name: "summary" , value: "This script performs SNMP based detection of EMC Data Domain.");

 script_tag(name:"qod_type", value:"package");

 script_category(ACT_GATHER_INFO);
 script_family("Product detection");
 script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
 script_dependencies("gb_snmp_sysdesc.nasl");
 script_require_udp_ports("Services/udp/snmp", 161);
 script_mandatory_keys("SNMP/sysdesc/available");

 exit(0);
}

include("host_details.inc");
include("snmp_func.inc");

port    = get_snmp_port(default:161);
sysdesc = get_snmp_sysdesc(port:port);
if(!sysdesc) exit(0);

if("Data Domain OS" >!< sysdesc ) exit( 0 );

replace_kb_item( name:"emc/data_domain/installed", value:TRUE );

# Data Domain OS 6.0.0.9-544198
vb = eregmatch( pattern:'Data Domain OS ([0-9.]+[^-]+)-([0-9]+)', string:sysdesc );

if( ! isnull( vb[1] ) )
  set_kb_item( name:"emc/data_domain/version/snmp", value:vb[1] );

if( ! isnull( vb[2] ) )
  set_kb_item( name:"emc/data_domain/build/snmp", value:vb[2] );

exit( 0 );


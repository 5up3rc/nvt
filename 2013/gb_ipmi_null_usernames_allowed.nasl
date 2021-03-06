###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ipmi_null_usernames_allowed.nasl 6104 2017-05-11 09:03:48Z teissa $
#
# IPMI Null Usernames Allowed
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

tag_summary = "The remote IPMI service allows 'null usernames'.";
tag_solution = "Don't allow accounts with a null username or password.";

SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.103838";  

if (description)
{
 script_oid(SCRIPT_OID);
 script_version ("$Revision: 6104 $");
 script_tag(name:"last_modification", value:"$Date: 2017-05-11 11:03:48 +0200 (Thu, 11 May 2017) $");
 script_tag(name:"creation_date", value:"2013-11-26 12:23:03 +0100 (Tue, 26 Nov 2013)");
 script_tag(name:"cvss_base", value:"7.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:P/A:N");
 script_name("IPMI Null Usernames Allowed");
 script_category(ACT_GATHER_INFO);
 script_tag(name:"qod_type", value:"remote_banner");
 script_family("General");
 script_copyright("This script is Copyright (C) 2013 Greenbone Networks GmbH");
 script_dependencies("gb_ipmi_detect.nasl");
 script_require_udp_ports("Services/udp/ipmi", 623);
 script_mandatory_keys("ipmi/null_username");

 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);

 exit(0);
}

port = get_kb_item("Services/udp/ipmi");
if(!port)exit(0);

if(!get_udp_port_state(port))exit(0);

if(get_kb_item("ipmi/null_username")) {
  security_message(port:port, proto:"udp");
  exit(0);
}   

exit(99);


###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mysql_51925.nasl 6018 2017-04-24 09:02:24Z teissa $
#
# MySQL Unspecified Remote Code Execution Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
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

tag_summary = "MySQL is prone to an unspecified remote code-execution vulnerability.

Attackers can exploit this vulnerability to execute arbitrary code in
the context of the affected application.

Limited information is available regarding this issue; this BID will
be updated as more information becomes available.

MySQL 5.5.20 is vulnerable; other versions may also be affected.";


SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.103471";
CPE = "cpe:/a:mysql:mysql";

if (description)
{
 script_oid(SCRIPT_OID);
 script_bugtraq_id(51925);
 script_version ("$Revision: 6018 $");

 script_name("MySQL Unspecified Remote Code Execution Vulnerability");

 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/51925");
 script_xref(name : "URL" , value : "http://www.mysql.com/");
 script_xref(name : "URL" , value : "https://lists.immunityinc.com/pipermail/canvas/2012-February/000011.html");

 script_tag(name:"cvss_base", value:"7.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
 script_tag(name:"qod_type", value:"remote_banner_unreliable");
 script_tag(name:"last_modification", value:"$Date: 2017-04-24 11:02:24 +0200 (Mon, 24 Apr 2017) $");
 script_tag(name:"creation_date", value:"2012-04-19 11:22:35 +0200 (Thu, 19 Apr 2012)");
 script_category(ACT_GATHER_INFO);
 script_family("Databases");
 script_tag(name:"qod_type", value:"remote_banner_unreliable");
 script_copyright("This script is Copyright (C) 2012 Greenbone Networks GmbH");
 script_dependencies("mysql_version.nasl");
 script_require_ports("Services/mysql", 3306);
 script_mandatory_keys("MySQL/installed");
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("misc_func.inc");
include("version_func.inc");
include("global_settings.inc");
include("host_details.inc");

sqlPort = get_app_port(cpe:CPE, nvt:SCRIPT_OID); 
if(!sqlPort){
  sqlPort = 3306;
}

if(!get_port_state(sqlPort)){
  exit(0);
}

mysqlVer = get_app_version(cpe:CPE, nvt:SCRIPT_OID, port:sqlPort);
if(isnull(mysqlVer)){
  exit(0);
}

mysqlVer = eregmatch(pattern:"([0-9.a-z]+)", string:mysqlVer);
if(!isnull(mysqlVer[1]))
{
  if(version_is_equal(version:mysqlVer[1], test_version:"5.5.20")){
    security_message(port:sqlPort);
  }
}

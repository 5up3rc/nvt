# OpenVAS Vulnerability Test
# $Id: SHN_MySQL_Privilege_Escalation.nasl 6063 2017-05-03 09:03:05Z teissa $
# Description: MySQL mysqld Privilege Escalation Vulnerability
#
# Authors:
# Vincent Renardias <vincent@strongholdnet.com>
#
# Copyright:
# Copyright (C) 2003 StrongHoldNet
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#

tag_summary = "You are running a version of MySQL which is older than version 3.23.56.
It is vulnerable to a vulnerability that may allow the mysqld service
to start with elevated privileges.

An attacker can exploit this vulnerability by creating a DATADIR/my.cnf
that includes the line 'user=root' under the '[mysqld]' option section.

When the mysqld service is executed, it will run as the root
user instead of the default user.";

tag_solution = "Upgrade to at least version 3.23.56";

SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.11378";
CPE = "cpe:/a:mysql:mysql";

if(description)
{
 
 script_oid(SCRIPT_OID);
 script_version("$Revision: 6063 $");
 script_tag(name:"last_modification", value:"$Date: 2017-05-03 11:03:05 +0200 (Wed, 03 May 2017) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_bugtraq_id(7052);
 script_cve_id("CVE-2003-0150");
 script_tag(name:"qod_type", value:"remote_banner_unreliable");
 script_tag(name:"cvss_base", value:"9.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:C/I:C/A:C");
 name = "MySQL mysqld Privilege Escalation Vulnerability";
 script_name(name);
 

 summary = "Checks for the remote MySQL version";
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright("This script is Copyright (C) 2003 StrongHoldNet");
 family = "Remote file access";
 script_family(family);
 script_dependencies("find_service.nasl", "mysql_version.nasl");
 script_require_ports("Services/mysql", 3306);
 script_require_keys("MySQL/installed");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

#
# The script code starts here
#

include("misc_func.inc");
include("host_details.inc");


if(!port = get_app_port(cpe:CPE, nvt:SCRIPT_OID))exit(0);
if(!ver = get_app_version(cpe:CPE, nvt:SCRIPT_OID, port:port))exit(0);

if(ereg(pattern:"3\.(([0-9]\..*)|(1[0-9]\..*)|(2(([0-2]\..*)|3\.(([0-9]$)|([0-4][0-9])|(5[0-5])))))",
	string:ver))security_message(port);

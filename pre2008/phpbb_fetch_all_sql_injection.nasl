# OpenVAS Vulnerability Test
# $Id: phpbb_fetch_all_sql_injection.nasl 7273 2017-09-26 11:17:25Z cfischer $
# Description: phpBB Fetch All < 2.0.12
#
# Authors:
# David Maciejak <david dot maciejak at kyxar dot fr>
# based on work from (C) Tenable Network Security
#
# Copyright:
# Copyright (C) 2004 David Maciejak
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

tag_summary = "The remote host is running a version of phpBB FetchAll older than 2.0.12.

It is reported that this version of phpBB Fetch All is susceptible 
to an SQL injection vulnerability. This issue is due to a failure of
the application to properly sanitize user-supplied input before using 
it in an SQL query.

The successful exploitation of this vulnerability depends on the 
implementation of the web application that includes phpBB Fetch All 
as a component.  It may or may not be possible to effectively pass 
malicious SQL statements to the underlying function. 

Successful exploitation could result in compromise of the application, 
disclosure or modification of data or may permit an attacker to exploit 
vulnerabilities in the underlying database implementation.";

tag_solution = "Upgrade to phpBB Fetch All 2.0.12 or later";

if(description)
{
 script_id(14226);
 script_version("$Revision: 7273 $");
 script_tag(name:"last_modification", value:"$Date: 2017-09-26 13:17:25 +0200 (Tue, 26 Sep 2017) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_bugtraq_id(10868, 10893);
 script_xref(name:"OSVDB", value:"8353");
 script_tag(name:"cvss_base", value:"6.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
 script_name("phpBB Fetch All < 2.0.12");
 script_category(ACT_GATHER_INFO);
 script_tag(name:"qod_type", value:"remote_banner");
 script_copyright("This script is Copyright (C) 2004 David Maciejak");
 script_family("Web application abuses");
 script_dependencies("phpbb_detect.nasl");
 script_require_ports("Services/www", 80);
 script_mandatory_keys("phpBB/installed");

 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);

kb = get_kb_item("www/" + port + "/phpBB");
if ( ! kb ) exit(0);
matches = eregmatch(pattern:"(.*) under (.*)", string:kb);
location = matches[2];

res = http_get_cache(item:location + "/index.php", port:port);
if ( ! res ) exit(0);

if ( ereg(pattern:"Fetch by phpBB Fetch All ([01]\..*|2\.0\.([0-9]|1[01])[^0-9])", string:res))
	security_message(port);


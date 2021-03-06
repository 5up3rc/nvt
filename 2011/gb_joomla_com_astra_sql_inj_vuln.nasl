##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_joomla_com_astra_sql_inj_vuln.nasl 7024 2017-08-30 11:51:43Z teissa $
#
# Joomla Component 'com_astra' SQL Injection Vulnerability
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will let attackers to to cause SQL Injection
attack and gain sensitive information.

Impact Level: Application";

tag_affected = "Joomla Astra component.";

tag_insight = "The flaw is due to input passed via the 'F' parameter to
'index.php' when 'option' is set to 'com_astra' is not properly sanitised
before being used in the SQL query.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "This host is running Joomla Astra component and is prone to SQL
injection vulnerability.";

if(description)
{
  script_id(802130);
  script_version("$Revision: 7024 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-30 13:51:43 +0200 (Wed, 30 Aug 2017) $");
  script_tag(name:"creation_date", value:"2011-08-05 09:04:20 +0200 (Fri, 05 Aug 2011)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("Joomla Component 'com_astra' SQL Injection Vulnerability");
  script_xref(name : "URL" , value : "http://packetstormsecurity.org/files/view/103666/joomlaastra-sql.txt");

  script_tag(name:"qod_type", value:"remote_active");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2011 Greenbone Networks GmbH");
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

## Get HTTP port
joomlaPort = get_http_port(default:80);
if(!joomlaPort){
  exit(0);
}

## Get the installed dir
if(!joomlaDir = get_dir_from_kb(port:joomlaPort, app:"joomla")){
  exit(0);
}

## Construct the request
url = string(joomlaDir ,"/index.php?option=com_astra&S=3&F='");

if(http_vuln_check(port:joomlaPort, url:url, pattern:"You have an error in" +
                   " your SQL syntax;", check_header: TRUE)){
  security_message(joomlaPort);
}

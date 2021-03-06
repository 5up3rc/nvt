###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_simple_machines_forum_session_hijacking_vuln.nasl 7044 2017-09-01 11:50:59Z teissa $
#
# Simple Machines Forum Session Hijacking Vulnerability
#
# Authors:
# Rachana Shetty <srachana@secpod.com>
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

tag_impact = "Successful exploitation will allow attackers to obtain sensitive
information such as user's session credentials and may aid in further
attacks.

Impact Level: Application";

tag_affected = "Simple Machines Forum (SMF) 2.0";

tag_insight = "The flaw exists due to improper handling of user's sessions,
allowing a remote attacker to hijack a valid user's session via a specially
crafted link.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "The host is installed with Simple Machines Forum and is prone
to session hijacking vulnerability.";

if(description)
{
  script_id(802334);
  script_version("$Revision: 7044 $");
  script_tag(name:"last_modification", value:"$Date: 2017-09-01 13:50:59 +0200 (Fri, 01 Sep 2017) $");
  script_tag(name:"creation_date", value:"2011-09-16 17:22:17 +0200 (Fri, 16 Sep 2011)");
  script_bugtraq_id(49078);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_name("Simple Machines Forum Session Hijacking Vulnerability");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/69056");
  script_xref(name : "URL" , value : "http://www.exploit-db.com/exploits/17637/");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_simple_machines_forum_detect.nasl");
  script_require_ports("Services/www", 80);
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

## Get the default port
smfPort = get_http_port(default:80);
if(!smfPort){
  exit(0);
}

## Get the version From kb
ver = get_version_from_kb(port:smfPort, app:"SMF");
if(!ver){
  exit(0);
}

if(version_is_equal(version:ver, test_version:"2.0")){
  security_message(smfPort);
}

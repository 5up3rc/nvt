###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_openwebmail_mult_xss_vuln.nasl 5122 2017-01-27 12:16:00Z teissa $
#
# OpenWebMail Multiple XSS Vulnerabilities
#
# Authors:
# Nikita MR <rnikita@secpod.com>
#
# Copyright:
# Copyright (c) 2009 SecPod, http://www.secpod.com
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

tag_impact = "Successful exploitation will allow remote attackers to inject arbitrary
  web script or HTML via unknown vectors and conduct cross-sites attacks.
  Impact Level: Application";
tag_affected = "OpenWebMail versions prior to 2.53";
tag_insight = "The vulnerability is caused because the application does not
  sanitise the user supplied data.";
tag_solution = "Upgrade to version 2.53 or later.
  http://openwebmail.org/";
tag_summary = "This host is installed with OpenWebMail and is prone to
  multiple cross-sites scripting vulnerabilities.";

if(description)
{
  script_id(900943);
  script_version("$Revision: 5122 $");
  script_tag(name:"last_modification", value:"$Date: 2017-01-27 13:16:00 +0100 (Fri, 27 Jan 2017) $");
  script_tag(name:"creation_date", value:"2009-09-22 10:03:41 +0200 (Tue, 22 Sep 2009)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_cve_id("CVE-2008-7202");
  script_bugtraq_id(25175);
  script_name("OpenWebMail Multiple XSS Vulnerabilities");
  script_xref(name : "URL" , value : "http://freshmeat.net/projects/openwebmail/releases/270453");
  script_xref(name : "URL" , value : "http://pridels-team.blogspot.com/2007/08/openwebmail-multiple-xss-vuln.html");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Web application abuses");
  script_dependencies("openwebmail_detect.nasl");
  script_require_ports("Services/www", 80);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("http_func.inc");
include("version_func.inc");

owmPort = get_http_port(default:80);
if(!owmPort)
{
  exit(0);
}

owmVer = get_kb_item("www/" + owmPort + "/openwebmail");
owmVer = eregmatch(pattern:"^(.+) under (/.*)$", string:owmVer);

if(owmVer[1] =~ "[0-9.]+")
{
  if(version_is_less(version:owmVer[1], test_version:"2.53")){
    security_message(owmPort);
  }
}

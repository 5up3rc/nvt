# OpenVAS Vulnerability Test
# $Id: pinnacle_xss.nasl 6053 2017-05-01 09:02:51Z teissa $
# Description: Pinnacle ShowCenter Skin XSS
#
# Authors:
# David Maciejak <david dot maciejak at kyxar dot fr>
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

tag_summary = "The remote host runs the Pinnacle ShowCenter web based interface.

The remote version  of this software is vulnerable to cross-site 
scripting attack due to a lack of sanity checks on skin parameter
in the SettingsBase.php script.

With a specially crafted URL, an attacker can cause arbitrary
code execution resulting in a loss of integrity.";

tag_solution = "Upgrade to the newest version of this software.";

# Ref: Secunia Research

if(description)
{
  script_id(15485);
  script_version("$Revision: 6053 $");
  script_tag(name:"last_modification", value:"$Date: 2017-05-01 11:02:51 +0200 (Mon, 01 May 2017) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_cve_id("CVE-2004-1700");
  script_bugtraq_id(11415);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_name("Pinnacle ShowCenter Skin XSS");


  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_analysis");
  
  script_copyright("This script is Copyright (C) 2004 David Maciejak");
  script_family("Web application abuses");
  script_dependencies("cross_site_scripting.nasl"); 
  script_require_ports("Services/www", 8000);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:8000);
if ( ! port ) exit(0);
if(!can_host_php(port:port)) exit(0);
if ( get_kb_item("www/" + port + "/generic_xss") ) exit(0);

if(get_port_state(port))
{
  buf = http_get(item:"/ShowCenter/SettingsBase.php?Skin=<script>foo</script>", port:port);
  r = http_keepalive_send_recv(port:port, data:buf, bodyonly:1);
  if( r == NULL )exit(0);
  if(r =~ "HTTP/1\.. 200" && egrep(pattern:"<script>foo</script>", string:r))
  {
    security_message(port);
  }
}
exit(0);

# OpenVAS Vulnerability Test
# $Id: cvstrac_malformed_uri_dos.nasl 6056 2017-05-02 09:02:50Z teissa $
# Description: CVSTrac malformed URI infinite loop DoS
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

tag_summary = "The remote host seems to be running cvstrac, 
a web-based bug and patch-set tracking system for CVS.

This version contains a flaw related to the parameter parser 
that may allow an attacker to create a malformed URL, 
which causes the application to hang.  An attacker, exploiting
this flaw, would only need network access to the cvstrac server.
Upon sending a malformed link, the cvstrac server would go into
an infinite loop, rendering the services as unavailable.

***** OpenVAS has determined the vulnerability exists on the target
***** simply by looking at the version number(s) of CVSTrac
***** installed there.";

tag_solution = "Update to version 1.1.4 or disable this CGI suite";

if(description)
{
 script_id(14289);
 script_version("$Revision: 6056 $");
 script_tag(name:"last_modification", value:"$Date: 2017-05-02 11:02:50 +0200 (Tue, 02 May 2017) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
 script_xref(name:"OSVDB", value:"8646");
 name = "CVSTrac malformed URI infinite loop DoS";

 script_name(name);

 summary = "Checks for CVSTrac version";
 
 
 script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_banner");
 
 script_copyright("This script is Copyright (C) 2004 David Maciejak");
 family = "Web application abuses";
 script_family(family);
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

#
# The script code starts here
#

include("http_func.inc");

port = get_http_port(default:80);
kb = get_kb_item("www/" + port + "/cvstrac" );
if ( ! kb ) exit(0);
stuff = eregmatch(pattern:"(.*) under (.*)", string:kb );
version = stuff[1]; 
if(ereg(pattern:"^(0\.|1\.(0|1\.[0-3]([^0-9]|$)))", string:version))
	security_message(port);

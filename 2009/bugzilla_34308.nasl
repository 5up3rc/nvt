###############################################################################
# OpenVAS Vulnerability Test
# $Id: bugzilla_34308.nasl 4574 2016-11-18 13:36:58Z teissa $
#
# Bugzilla 'attachment.cgi' Cross Site Request Forgery Vulnerability
#
# Authors:
# Michael Meyer
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
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

tag_summary = "Bugzilla is prone to a cross-site request-forgery vulnerability.
  An attacker can exploit this issue to submit attachments in the
  context of the logged-in user.

  This issue affects versions prior to Bugzilla 3.2.3 and 3.3.4.";

tag_solution = "The vendor released updates to address this issue. Please see http://www.bugzilla.org/
  for more information.";


if (description)
{
 script_id(100094);
 script_version("$Revision: 4574 $");
 script_tag(name:"last_modification", value:"$Date: 2016-11-18 14:36:58 +0100 (Fri, 18 Nov 2016) $");
 script_tag(name:"creation_date", value:"2009-03-31 18:59:35 +0200 (Tue, 31 Mar 2009)");
 script_cve_id("CVE-2009-1213");
 script_bugtraq_id(34308);
 script_tag(name:"cvss_base", value:"6.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");

 script_name("Bugzilla 'attachment.cgi' Cross Site Request Forgery Vulnerability");
 script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
 script_dependencies("bugzilla_detect.nasl");
 script_require_ports("Services/www", 80);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/34308");
 exit(0);
}


include("http_func.inc");
include("version_func.inc");

port = get_http_port(default:80);
if(!port){
  exit(0);
}

if(Ver = get_kb_item(string("www/", port, "/bugzilla/version"))) {
  if(version_in_range(version:Ver, test_version:"3.2", test_version2:"3.2.3") ||
     version_in_range(version:Ver, test_version:"3.3", test_version2:"3.3.4")){
     security_message(port:port);
  }
}

exit(0);

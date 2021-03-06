###############################################################################
# OpenVAS Vulnerability Test
# $Id: nginx_36839.nasl 5002 2017-01-13 10:17:13Z teissa $
#
# nginx 'ngx_http_process_request_headers()' Remote Buffer Overflow Vulnerability
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

tag_summary = "The 'nginx' program is prone to a buffer-overflow vulnerability
because the application fails to perform adequate boundary checks on
user-supplied data.

Attackers can exploit this issue to execute arbitrary code within the
context of the affected application. Failed exploit attempts will
result in a denial-of-service condition.";

tag_solution = "Updates are available. Please see the references for more information.";

if (description)
{
 script_id(100321);
 script_version("$Revision: 5002 $");
 script_tag(name:"last_modification", value:"$Date: 2017-01-13 11:17:13 +0100 (Fri, 13 Jan 2017) $");
 script_tag(name:"creation_date", value:"2009-10-28 11:13:14 +0100 (Wed, 28 Oct 2009)");
 script_cve_id("CVE-2009-3896");
 script_bugtraq_id(36839);
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");

 script_name("nginx 'ngx_http_process_request_headers()' Remote Buffer Overflow Vulnerability");

 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/36839");
 script_xref(name : "URL" , value : "http://nginx.net/");
 script_xref(name : "URL" , value : "http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=552035");

 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("Web Servers");
 script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
 script_dependencies("nginx_detect.nasl");
 script_require_ports("Services/www", 80);
 script_mandatory_keys("nginx/installed");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("version_func.inc");

port = get_http_port(default:80);
if(!get_port_state(port))exit(0);

if(!vers = get_kb_item(string("nginx/", port, "/version")))exit(0);
if(!isnull(vers) && vers >!< "unknown") {


  if(version_in_range(version:vers, test_version:"0.7", test_version2: "0.7.61") ||
     version_in_range(version:vers, test_version:"0.6", test_version2: "0.6.38") ||
     version_in_range(version:vers, test_version:"0.5", test_version2: "0.5.37") ||
     version_in_range(version:vers, test_version:"0.4", test_version2: "0.4.14")) {

      security_message(port:port);

  }
}

exit(0);

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_vcenter_VMSA-2016-0010_remote_active.nasl 3992 2016-09-07 12:27:28Z cfi $
#
# VMSA-2016-0010 (vCenter) VMware product updates address multiple important security issues (remote active check)
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
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

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.105854");
 script_cve_id("CVE-2016-5331");
 script_tag(name:"cvss_base", value:"4.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
 script_version ("$Revision: 3992 $");

 script_name("VMSA-2016-0010 (vCenter) VMware product updates address multiple important security issues (remote active check)");

 script_xref(name:"URL", value:"http://www.vmware.com/security/advisories/VMSA-2016-0010.html");

 script_tag(name: "vuldetect" , value:"Send a special crafted HTTP GET request and check the response.");
 script_tag(name: "solution" , value:"Update to 6.0 U2 or newer");
 script_tag(name: "summary" , value:"vCenter contain an HTTP header injection vulnerability due to lack of input validation. An attacker can exploit
this issue to set arbitrary HTTP response headers and cookies, which may allow for cross-site scripting and malicious redirect attacks.");

 script_tag(name:"last_modification", value:"$Date: 2016-09-07 14:27:28 +0200 (Wed, 07 Sep 2016) $");
 script_tag(name:"creation_date", value:"2016-08-08 14:06:24 +0200 (Mon, 08 Aug 2016)");
 script_tag(name:"qod_type", value:"remote_vul");
 script_tag(name:"solution_type", value:"VendorFix");
 script_category(ACT_ATTACK);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2016reenbone Networks GmbH");
 script_dependencies("gb_vmware_vcenter_detect.nasl");
 script_mandatory_keys("VMware_vCenter/port");
 script_exclude_keys("Settings/disable_cgi_scanning");

 exit(0);

}

include("http_func.inc");
include("http_keepalive.inc");

if( ! port = get_kb_item( "VMware_vCenter/port" ) ) exit( 0 );

co = 'Set-Cookie:%20OpenVAS=' + rand();
co_s = str_replace( string:co, find:'%20', replace:' ');

h1 = 'greenbone:%20' + rand();
h1_s = str_replace( string:h1, find:'%20', replace:' ');

url = '/?syss%0d%0a' + co + '%0d%0a' + h1;

req = http_get( item:url, port:port );
buf = http_keepalive_send_recv( port:port, data:req, bodyonly:FALSE );

if( buf =~ "HTTP/1\.. 303" )
{
  if( egrep( pattern:'^' + co_s, string:buf ) && egrep( pattern:'^' + h1_s, string:buf ) )
  {
    report = report_vuln_url(  port:port, url:url );
    report += '\n\nResponse:\n\n' + buf;
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 0 );


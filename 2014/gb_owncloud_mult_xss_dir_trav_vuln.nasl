###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_owncloud_mult_xss_dir_trav_vuln.nasl 6759 2017-07-19 09:56:33Z teissa $
#
# ownCloud Multiple Cross-Site Scripting & Directory Traversal Vulnerabilities
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

CPE = "cpe:/a:owncloud:owncloud";
SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.804287";

if (description)
{
  script_oid(SCRIPT_OID);
  script_version("$Revision: 6759 $");
  script_cve_id("CVE-2013-2040", "CVE-2013-2039", "CVE-2013-2042");
  script_bugtraq_id(59950, 59947, 59952);
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-07-19 11:56:33 +0200 (Wed, 19 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-05-06 18:50:55 +0530 (Tue, 06 May 2014)");
  script_name("ownCloud Multiple Cross-Site Scripting & Directory Traversal Vulnerabilities");

  tag_summary =
"This host is installed with ownCloud and is prone to session fixation
vulnerability.";

  tag_vuldetect =
"Get the installed version with the help of detect NVT and check the version
is vulnerable or not.";

  tag_insight =
"Multiple flaws are due,
- Insufficient validation of user-supplied input passed via the 'url' parameter
to the apps/bookmarks/ajax/addBookmark.php & apps/bookmarks/ajax/editBookmark.php
scripts.
- Improper sanitization of user-supplied input passed via unspecified vectors
to lib/files/view.php, media/js/playlist.js, media/js/player.js or
media/js/collection.js script.";

  tag_impact =
"Successful exploitation will allow remote attackers to gain access to
arbitrary files and execute arbitrary script code in a user's browser
within the trust relationship between their browser and the server.

Impact Level: Application";

  tag_affected =
"ownCloud Server 4.x before 4.0.15, 4.5.x before 4.5.11, and 5.0.x before
5.0.6";

  tag_solution =
"Upgrade to ownCloud version 4.0.15 or 4.5.11 or 5.0.6 or later.
For updates refer to http://owncloud.org";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);

  script_xref(name : "URL" , value : "http://seclists.org/oss-sec/2013/q2/324");
  script_xref(name : "URL" , value : "http://owncloud.org/about/security/advisories/oC-SA-2013-021");
  script_xref(name : "URL" , value : "http://owncloud.org/about/security/advisories/oC-SA-2013-020");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_owncloud_detect.nasl");
  script_mandatory_keys("owncloud/installed");
  script_require_ports("Services/www", 80);
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
ownPort = "";
ownVer = "";

## get the port
if(!ownPort = get_app_port(cpe:CPE, nvt:SCRIPT_OID)){
  exit(0);
}

## Get version
if(!ownVer = get_app_version(cpe:CPE, nvt:SCRIPT_OID, port:ownPort)){
  exit(0);
}

## Grep for vulnerable version
if(version_in_range(version:ownVer, test_version:"4.0.0", test_version2:"4.0.14")||
   version_in_range(version:ownVer, test_version:"4.5.0", test_version2:"4.5.10")||
   version_in_range(version:ownVer, test_version:"5.0.0", test_version2:"5.0.5"))
{
  security_message(port:ownPort);
  exit(0);
}

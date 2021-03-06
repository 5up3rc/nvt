###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_itunes_playlist_code_exec_vuln_macosx.nasl 5956 2017-04-14 09:02:12Z teissa $
#
# Apple iTunes '.m3u' Playlist Code Execution Vulnerability (Mac OS X)
#
# Authors:
# Rachana Shetty <srachana@secpod.com>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will allow attackers to execute arbitrary code.
  Impact Level: System/Application";
tag_affected = "Apple iTunes version prior to 10.6.3 on Mac OS X";
tag_insight = "Apple iTunes fails to handle '.m3u' playlist, allowing to cause a heap
  overflow and execute arbitrary code on the target system.";
tag_solution = "Upgrade to Apple Apple iTunes version 10.6.3 or later,
  For updates refer to http://www.apple.com/itunes/download/";
tag_summary = "This host is installed with Apple iTunes and is prone to code
  execution vulnerabilities.";

if(description)
{
  script_id(802863);
  script_version("$Revision: 5956 $");
  script_cve_id("CVE-2012-0677");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-04-14 11:02:12 +0200 (Fri, 14 Apr 2017) $");
  script_tag(name:"creation_date", value:"2012-06-12 15:25:52 +0530 (Tue, 12 Jun 2012)");
  script_name("Apple iTunes '.m3u' Playlist Code Execution Vulnerability (Mac OS X)");
  script_xref(name : "URL" , value : "http://support.apple.com/kb/HT5318");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/49489");
  script_xref(name : "URL" , value : "http://www.securitytracker.com/id/1027142");
  script_xref(name : "URL" , value : "http://lists.apple.com/archives/security-announce/2012/Jun/msg00000.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_itunes_detect_macosx.nasl");
  script_require_keys("Apple/iTunes/MacOSX/Version");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

## Variable Initialization
ituneVer = "";

##Get the version from kb
ituneVer= get_kb_item("Apple/iTunes/MacOSX/Version");
if(!ituneVer){
  exit(0);
}

## Apple iTunes version < 10.6.3
if(version_is_less(version:ituneVer, test_version:"10.6.3")){
  security_message(0);
}

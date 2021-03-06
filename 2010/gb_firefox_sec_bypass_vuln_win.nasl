###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_firefox_sec_bypass_vuln_win.nasl 5306 2017-02-16 09:00:16Z teissa $
#
# Mozilla Firefox Browser Security Bypass Vulnerabilities - Win
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will allow attacker to bypass intended
access restrictions.

Impact Level: Application";

tag_affected = "Firefox version 4.0 to 4.0 Beta 7 on Windows";

tag_insight = "The flaw is due to error in 'WebSockets' implementation, does
not properly perform proxy upgrade negotiation, which has unspecified impact
and remote attack vectors.";

tag_solution = "Upgrade to Mozilla Firefox 4 Beta 8 or later,
For updates refer to http://www.mozilla.com/en-US/firefox/all.html";

tag_summary = "The host is installed with Mozilla Firefox browser and is prone
to secuirty bypass vulnerability.";

if(description)
{
  script_id(801562);
  script_version("$Revision: 5306 $");
  script_tag(name:"last_modification", value:"$Date: 2017-02-16 10:00:16 +0100 (Thu, 16 Feb 2017) $");
  script_tag(name:"creation_date", value:"2010-12-13 15:28:53 +0100 (Mon, 13 Dec 2010)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2010-4508");
  script_name("Mozilla Firefox Browser Security Bypass Vulnerabilities - Win");
  script_xref(name : "URL" , value : "https://wiki.mozilla.org/Platform/2010-12-07");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_firefox_detect_win.nasl");
  script_require_keys("Firefox/Win/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

ffVer = get_kb_item("Firefox/Win/Ver");
if(!ffVer){
  exit(0);
}

# Grep for firefox version 4.0 to 4.0.b7
if(version_in_range(version:ffVer, test_version:"4.0", test_version2:"4.0.b7")){
  security_message(0);
}

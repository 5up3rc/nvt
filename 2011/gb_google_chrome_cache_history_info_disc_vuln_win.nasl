###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_cache_history_info_disc_vuln_win.nasl 7052 2017-09-04 11:50:51Z teissa $
#
# Google Chrome Cache History Information Disclosure Vulnerabilities (Windows)
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

tag_impact = "Successful exploitation will allow remote attackers to gain
sensitive information about visited web page.

Impact Level: Application";

tag_affected = "Google Chrome version 15.0.874.121 and prior on Windows";

tag_insight = "Multiple flaws are due to improper capturing of data about the
times of Same Origin Policy violations during IFRAME and image loading attempts,
allows attacker to enumerate visited sites via crafted JavaScript code.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "The host is installed with Google Chrome and is prone to
information disclosure vulnerabilities.";

if(description)
{
  script_id(802358);
  script_version("$Revision: 7052 $");
  script_cve_id("CVE-2011-4691", "CVE-2011-4692");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-09-04 13:50:51 +0200 (Mon, 04 Sep 2017) $");
  script_tag(name:"creation_date", value:"2011-12-09 12:30:25 +0530 (Fri, 09 Dec 2011)");
  script_name("Google Chrome Cache History Information Disclosure Vulnerabilities (Windows)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/47127");
  script_xref(name : "URL" , value : "http://lcamtuf.coredump.cx/cachetime/");
  script_xref(name : "URL" , value : "http://sip.cs.princeton.edu/pub/webtiming.pdf");

  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_google_chrome_detect_win.nasl");
  script_require_keys("GoogleChrome/Win/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


include("version_func.inc");

## Get the version from KB
chromeVer = get_kb_item("GoogleChrome/Win/Ver");
if(!chromeVer){
  exit(0);
}

## Check for Google Chrome Version less than 15.0.874.121
if(version_is_less_equal(version:chromeVer, test_version:"15.0.874.121")){
  security_message(0);
}

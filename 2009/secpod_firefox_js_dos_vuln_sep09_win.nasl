###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_firefox_js_dos_vuln_sep09_win.nasl 5055 2017-01-20 14:08:39Z teissa $
#
# Mozilla Firefox 'JavaScript' DoS Vulnerabilities - Sep09 (Windows)
#
# Authors:
# Sharath S <sharaths@secpod.com>
#
# Copyright:
# Copyright (c) 2009 SecPod, http://www.secpod.com
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

tag_impact = "A remote, unauthenticated attacker could execute arbitrary code or cause a
  vulnerable application to crash.
  Impact Level: System/Application";
tag_affected = "Mozilla Firefox version prior to 3.0.14 and 3.5 before 3.5.2 on Windows.";
tag_insight = "The flaws are due to multiple errors in the browser and JavaScript engines
  can be exploited to corrupt memory.";
tag_solution = "Upgrade to Firefox version 3.0.14 or 3.5.2 or later
  http://www.mozilla.com/en-US/firefox/all.html";
tag_summary = "The host is installed with Firefox browser and is prone to Denial
  of Service vulnerabilities.";

if(description)
{
  script_id(900845);
  script_version("$Revision: 5055 $");
  script_tag(name:"last_modification", value:"$Date: 2017-01-20 15:08:39 +0100 (Fri, 20 Jan 2017) $");
  script_tag(name:"creation_date", value:"2009-09-11 18:01:06 +0200 (Fri, 11 Sep 2009)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-3071", "CVE-2009-3075");
  script_bugtraq_id(36343);
  script_name("Mozilla Firefox 'JavaScript' DoS Vulnerabilities - Sep09 (Windows)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/36671/");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2009/2585");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2009/mfsa2009-47.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Denial of Service");
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
if(!ffVer)
{
  exit(0);
}

# Grep for Firefox version < 3.0.14 and 3.5 < 3.5.2
if(version_is_less(version:ffVer, test_version:"3.0.14") ||
   version_in_range(version:ffVer,test_version:"3.5", test_version2:"3.5.1")){
  security_message(0);
}

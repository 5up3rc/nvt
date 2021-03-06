###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_seamonkey_mult_vuln_apr09_lin.nasl 5122 2017-01-27 12:16:00Z teissa $
#
# Mozilla Seamonkey Multiple Vulnerabilities Apr-09 (Linux)
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

tag_impact = "Successful exploitation could result in Information Disclosure, XSS, Script
  Injection, Memory Corruption, CSRF, Arbitrary JavaScript code execution or
  can cause denial of service attacks.
  Impact Level: System/Application";
tag_affected = "Seamonkey version prior to 1.1.17 on Linux.";
tag_insight = "For more information about vulnerabilities on Seamonkey, go through the links
  mentioned in references.";
tag_solution = "Upgrade to Seamonkey version 1.1.17
  http://www.seamonkey-project.org/releases";
tag_summary = "The host is installed with Mozilla Seamonkey and is prone to multiple
  vulnerabilities.";

if(description)
{
  script_id(900347);
  script_version("$Revision: 5122 $");
  script_tag(name:"last_modification", value:"$Date: 2017-01-27 13:16:00 +0100 (Fri, 27 Jan 2017) $");
  script_tag(name:"creation_date", value:"2009-04-30 06:40:16 +0200 (Thu, 30 Apr 2009)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2009-1302", "CVE-2009-1303", "CVE-2009-1304", "CVE-2009-1305",
                "CVE-2009-1306", "CVE-2009-1307", "CVE-2009-1308", "CVE-2009-1309",
                "CVE-2009-1311", "CVE-2009-1312");
  script_bugtraq_id(34656);
  script_name("Mozilla Seamonkey Multiple Vulnerabilities Apr-09 (Linux)");


  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Web application abuses");
  script_dependencies("gb_seamonkey_detect_lin.nasl");
  script_require_keys("Seamonkey/Linux/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"executable_version");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/34835");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2009/mfsa2009-14.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2009/mfsa2009-16.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2009/mfsa2009-17.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2009/mfsa2009-18.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2009/mfsa2009-19.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2009/mfsa2009-21.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2009/mfsa2009-22.html");
  exit(0);
}


include("version_func.inc");

smVer = get_kb_item("Seamonkey/Linux/Ver");
if(!smVer){
  exit(0);
}

# Grep for Seamonkey version prior to 1.1.17
if(version_is_less(version:smVer, test_version:"1.1.17")){
  security_message(0);
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_mozilla_prdts_mult_vuln_win01_jun10.nasl 6444 2017-06-27 11:24:02Z santu $
#
# Mozilla Firefox/Seamonkey Multiple Vulnerabilities june-10 (Windows)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2010 SecPod, http://www.secpod.com
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

tag_solution = "Upgrade to Firefox version 3.5.10, 3.6.4
  http://www.mozilla.com/en-US/firefox/all.html

  Upgrade to Seamonkey version 2.0.5
  http://www.seamonkey-project.org/releases/";

tag_impact = "Successful exploitation will let attackers to to cause a denial of service
  or execute arbitrary code.
  Impact Level: Application";
tag_affected = "Seamonkey version prior to 2.0.5,
  Firefox version 3.5.x before 3.5.10 and 3.6.x before 3.6.4";
tag_insight = "The flaws are due to:
   - Use-after-free vulnerability exists in the application, which allows
     attackers to execute arbitrary code via multiple plugin instances.
   - Error in the handling of HTTP headers, which does not properly handle
     situations in which both 'Content-Disposition: attachment' and
     'Content-Type: multipart' are present in HTTP headers, which allows
     attackers to conduct cross-site scripting (XSS) attacks via an uploaded
     HTML document.";
tag_summary = "The host is installed with Mozilla Firefox/Seamonkey and is prone to multiple
  vulnerabilities.";

if(description)
{
  script_id(902205);
  script_version("$Revision: 6444 $");
  script_tag(name:"last_modification", value:"$Date: 2017-06-27 13:24:02 +0200 (Tue, 27 Jun 2017) $");
  script_tag(name:"creation_date", value:"2010-07-01 15:58:11 +0200 (Thu, 01 Jul 2010)");
  script_cve_id("CVE-2010-1197", "CVE-2010-1198");
  script_bugtraq_id(41050);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Mozilla Products Firefox/Seamonkey Multiple Vulnerabilities june-10 (Windows)");

  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2010/mfsa2010-32.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2010/mfsa2010-28.html");

  script_tag(name:"qod_type", value:"registry");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 SecPod");
  script_family("General");
  script_dependencies("gb_firefox_detect_win.nasl", "gb_seamonkey_detect_win.nasl");
  script_mandatory_keys("Mozilla/Firefox_or_Seamonkey_or_Thunderbird/Installed");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "solution" , value : tag_solution);
  exit(0);
}


include("version_func.inc");

# Firefox Check
ffVer = get_kb_item("Firefox/Win/Ver");
if(ffVer)
{
  # Grep for Firefox version
  if(version_in_range(version:ffVer, test_version:"3.5.0", test_version2:"3.5.9") ||
     version_in_range(version:ffVer, test_version:"3.6.0", test_version2:"3.6.3"))
     {
       security_message(0);
       exit(0);
     }
}

# Seamonkey Check
smVer = get_kb_item("Seamonkey/Win/Ver");
if(smVer != NULL)
{
  # Grep for Seamonkey version < 2.0.5
  if(version_is_less(version:smVer, test_version:"2.0.5")){
    security_message(0);
  }
}

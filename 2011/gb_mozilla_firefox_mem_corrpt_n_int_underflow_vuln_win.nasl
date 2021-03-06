###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_firefox_mem_corrpt_n_int_underflow_vuln_win.nasl 7029 2017-08-31 11:51:40Z teissa $
#
# Mozilla Firefox Memory Corruption and Integer Underflow Vulnerabilities (Windows)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
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

tag_impact = "Successful exploitation allows remote attackers to execute arbitrary code
  with the privileges of the user running the affected application. Failed
  attempts may trigger a denial-of-service condition.
  Impact Level: System/Application";
tag_affected = "Mozilla Firefox 3.6.x before 3.6.23";
tag_insight = "The flaws are due to
  - An integer underflow error exists within the Regular Expression engine
    when evaluating certain regular expressions.
  - An unspecified error can be exploited to corrupt memory.";
tag_solution = "Upgrade to Firefox version 3.6.23 or later
  http://www.mozilla.com/en-US/firefox/all.html";
tag_summary = "The host is installed with Mozilla Firefox and is prone to memory
  corruption and integer underflow vulnerabilities.";

if(description)
{
  script_id(802170);
  script_version("$Revision: 7029 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-31 13:51:40 +0200 (Thu, 31 Aug 2017) $");
  script_tag(name:"creation_date", value:"2011-10-04 16:55:13 +0200 (Tue, 04 Oct 2011)");
  script_cve_id("CVE-2011-2996", "CVE-2011-2998");
  script_bugtraq_id(49845, 49809);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Mozilla Firefox Memory Corruption and Integer Underflow Vulnerabilities (Windows)");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2011/mfsa2011-36.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
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

## Firefox Check
ffVer = get_kb_item("Firefox/Win/Ver");
if(ffVer)
{
  ## Grep for Firefox versions before 3.6.23
  if(version_in_range(version:ffVer, test_version:"3.6.0", test_version2:"3.6.22")){
    security_message(0);
  }
}

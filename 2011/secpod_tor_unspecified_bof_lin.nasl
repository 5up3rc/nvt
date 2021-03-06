###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_tor_unspecified_bof_lin.nasl 7019 2017-08-29 11:51:27Z teissa $
#
# Tor Unspecified Heap Based Buffer Overflow Vulnerability (Linux)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2011 SecPod, http://www.secpod.com
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

tag_impact = "Successful exploitation will allow remote attackers to execute arbitrary
  code in the context of the user running the application. Failed exploit
  attempts will likely result in denial-of-service conditions.

  Impact level: Application";

tag_affected = "Tor version prior to 0.2.1.28 and 0.2.2.x before 0.2.2.20-alpha on Linux.";
tag_insight = "The issue is caused by an unknown heap overflow error when processing
  user-supplied data, which can be exploited to cause a heap-based buffer
  overflow.";
tag_solution = "Upgrade to version 0.2.1.28 or 0.2.2.20-alpha or later
  http://www.torproject.org/download/download.html.en";
tag_summary = "This host is installed with Tor and is prone to heap based buffer overflow
  vulnerability.";

if(description)
{
  script_id(902332);
  script_version("$Revision: 7019 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-29 13:51:27 +0200 (Tue, 29 Aug 2017) $");
  script_tag(name:"creation_date", value:"2011-02-05 04:12:38 +0100 (Sat, 05 Feb 2011)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2010-1676");
  script_bugtraq_id(45500);
  script_name("Tor Unspecified Heap Based Buffer Overflow Vulnerability (Linux)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/42536");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2010/3290");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 SecPod");
  script_family("Buffer overflow");
  script_dependencies("secpod_tor_detect_lin.nasl");
  script_require_keys("Tor/Linux/Ver");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name:"qod_type", value:"executable_version");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

torVer = get_kb_item("Tor/Linux/Ver");
if(!torVer){
  exit(0);
}

torVer = ereg_replace(pattern:"-", replace:".", string:torVer);

if(version_is_less(version:torVer, test_version:"0.2.1.28"))
{
  security_message(0);
  exit(0);
}

if(torVer =~ "^0\.2\.2.*")
{
  if(version_is_less(version:torVer, test_version:"0.2.2.20.alpha")){
    security_message(0);  
  }
}

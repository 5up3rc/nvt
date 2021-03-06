###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_pplive_code_exe_vuln.nasl 5122 2017-01-27 12:16:00Z teissa $
#
# PPLive Multiple Argument Injection Vulnerabilities
#
# Authors:
# Nikita MR <rnikita@secpod.com>
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

tag_impact = "By persuading a victim to click on a specially-crafted URI, attackers can
  execute arbitrary script code by loading malicious files(dll) through the
  UNC share pathname in the LoadModule argument.
  Impact Level: Application";
tag_affected = "PPLive version 1.9.21 and prior on Windows.";
tag_insight = "Improper validation of user supplied input to the synacast://, Play://,
  pplsv://, and ppvod:// URI handlers via a UNC share pathname in the
  LoadModule argument leads to this injection attacks.";
tag_solution = "No solution or patch was made available for at least one year since
  disclosure of this vulnerability. Likely none will be provided anymore. General
  solution options are to upgrade to a newer release, disable respective features,
  remove the product or replace the product by another one
  For updates refer to http://www.pplive.com/en/index.html";
tag_summary = "This host has PPLive installed and is prone to multiple argument
  injection vulnerabilities.";

if(description)
{
  script_id(900536);
  script_version("$Revision: 5122 $");
  script_tag(name:"last_modification", value:"$Date: 2017-01-27 13:16:00 +0100 (Fri, 27 Jan 2017) $");
  script_tag(name:"creation_date", value:"2009-04-02 08:15:32 +0200 (Thu, 02 Apr 2009)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-1087");
  script_bugtraq_id(34128);
  script_name("PPLive Multiple Argument Injection Vulnerabilities");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/34327");
  script_xref(name : "URL" , value : "http://www.milw0rm.com/exploits/8215");

  script_tag(name:"qod_type", value:"registry");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("General");
  script_dependencies("secpod_pplive_detect.nasl");
  script_require_keys("PPLive/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


include("version_func.inc");

ppliveVer = get_kb_item("PPLive/Ver");
if(!ppliveVer){
  exit(0);
}

# Check for PPLive version 1.9.21 and prior
if(version_is_less_equal(version:ppliveVer, test_version:"1.9.21")){
  security_message(0);
}

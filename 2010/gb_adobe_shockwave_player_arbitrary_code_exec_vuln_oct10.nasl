###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_shockwave_player_arbitrary_code_exec_vuln_oct10.nasl 5263 2017-02-10 13:45:51Z teissa $
#
# Adobe Shockwave player Arbitrary Code Execution Vulnerability
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

tag_impact = "Successful attack could allow attackers to execute arbitrary code
in the context of the user running the affected application, failed attacks may
cause a denial-of-service condition.

Impact Level: System/Application";

tag_affected = "Adobe Shockwave Player 11.5.8.612 and prior on Windows.";

tag_insight = "The flaw is due to a memory corruption error in the Director
(DIRAPI.dll) module when processing and calculating offsets while parsing
'rcsL' chunks in a Director file.";

tag_solution = "Upgrade to Adobe Shockwave Player version 11.5.9.615,
For updates refer to http://get.adobe.com/shockwave/otherversions/";

tag_summary = "This host has Adobe Shockwave Player installed and is prone to
arbitrary code execution vulnerability.";

if(description)
{
  script_id(801476);
  script_version("$Revision: 5263 $");
  script_tag(name:"last_modification", value:"$Date: 2017-02-10 14:45:51 +0100 (Fri, 10 Feb 2017) $");
  script_tag(name:"creation_date", value:"2010-11-02 18:01:36 +0100 (Tue, 02 Nov 2010)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2010-3653");
  script_bugtraq_id(44291);
  script_name("Adobe Shockwave player Arbitrary Code Execution Vulnerability");
  script_xref(name : "URL" , value : "http://www.exploit-db.com/exploits/15296/");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2010/2752");

  script_tag(name:"qod_type", value:"registry");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_adobe_shockwave_player_detect.nasl");
  script_require_keys("Adobe/ShockwavePlayer/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("version_func.inc");

shockVer = get_kb_item("Adobe/ShockwavePlayer/Ver");
if(!shockVer){
  exit(0);
}

# Grep for version <= 11.5.8.612
if(version_is_less_equal(version:shockVer, test_version:"11.5.8.612")){
  security_message(0);
}

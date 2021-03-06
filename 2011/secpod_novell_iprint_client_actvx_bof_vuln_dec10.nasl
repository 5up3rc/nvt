###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_novell_iprint_client_actvx_bof_vuln_dec10.nasl 7006 2017-08-25 11:51:20Z teissa $
#
# Novell iPrint Client 'ienipp.ocx' ActiveX Buffer Overflow Vulnerability
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
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

tag_impact = "Successful exploitation could allow attackers to execute arbitrary code in
  the context of the application.
  Impact Level: Application";
tag_affected = "Novell iPrint Client version 5.52";
tag_insight = "The flaw is due to an error in 'ienipp.ocx' in the method
  'GetDriverSettings' which blindly copies user supplied data into a
  fixed-length buffer on the stack.";
tag_solution = "Upgrade to Novell iPrint Client version 5.56 or later
  http://download.novell.com/Download?buildid=JV7fd0tFHHM~";
tag_summary = "The host is installed with Novell iPrint Client and is prone to
  Buffer Overflow vulnerability.";

if(description)
{
  script_id(902328);
  script_version("$Revision: 7006 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-25 13:51:20 +0200 (Fri, 25 Aug 2017) $");
  script_tag(name:"creation_date", value:"2011-01-03 16:00:43 +0100 (Mon, 03 Jan 2011)");
  script_cve_id("CVE-2010-4321");
  script_bugtraq_id(44966);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Novell iPrint Client 'ienipp.ocx' ActiveX Buffer Overflow Vulnerability");
  script_xref(name : "URL" , value : "http://www.zerodayinitiative.com/advisories/ZDI-10-256/");
  script_xref(name : "URL" , value : "http://www.novell.com/support/viewContent.do?externalId=7007234");

  script_tag(name:"qod_type", value:"registry");
  script_copyright("Copyright (c) 2010 SecPod");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("secpod_novell_prdts_detect_win.nasl");
  script_require_keys("Novell/iPrint/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("version_func.inc");

## Get the version from KB
iPrintVer = get_kb_item("Novell/iPrint/Ver");
if(!iPrintVer){
  exit(0);
}

## Check for Novell iPrint Client Version
if(version_is_equal(version:iPrintVer, test_version:"5.52")){
  security_message(0);
}

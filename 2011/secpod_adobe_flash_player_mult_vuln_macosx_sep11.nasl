###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_adobe_flash_player_mult_vuln_macosx_sep11.nasl 7029 2017-08-31 11:51:40Z teissa $
#
# Adobe Flash Player Multiple Vulnerabilities September-2011 (Mac OS X)
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

tag_impact = "Successful exploitation will let attackers to execute arbitrary code or cause
  a denial of service.
  Impact Level: System/Application";
tag_affected = "Adobe Flash Player versions prior to 10.3.183.10 on Mac OS X.";
tag_insight = "The flaws are due to
  - Stack-based buffer overflow in the ActionScript Virtual Machine (AVM)
    component, allows remote attackers to execute arbitrary code via
    unspecified vectors.
  - logic error issue, allows attackers to execute arbitrary code or cause a
    denial of service (browser crash) via unspecified vectors.
  - security control bypass, allows attackers to bypass intended access
    restrictions and obtain sensitive information via unspecified vectors
  - logic error vulnerability, allows remote attackers to execute arbitrary
    code via crafted streaming media
  - Cross-site scripting (XSS) vulnerability, allows remote attackers to
    inject arbitrary web script or HTML via a crafted URL.";
tag_solution = "Upgrade to Adobe Flash Player version 10.3.183.10 or later.
  For details refer, http://www.adobe.com/downloads/";
tag_summary = "This host is installed with Adobe Flash Player and is prone to
  multiple vulnerabilities.";

if(description)
{
  script_id(902740);
  script_version("$Revision: 7029 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-31 13:51:40 +0200 (Thu, 31 Aug 2017) $");
  script_tag(name:"creation_date", value:"2011-09-30 15:58:03 +0200 (Fri, 30 Sep 2011)");
  script_cve_id("CVE-2011-2426", "CVE-2011-2427", "CVE-2011-2428",
                "CVE-2011-2429", "CVE-2011-2430", "CVE-2011-2444");
  script_bugtraq_id(49714, 49715, 49716, 49718, 49717, 49710);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Adobe Flash Player Multiple Vulnerabilities September-2011 (Mac OS X)");


  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 SecPod");
  script_family("General");
  script_dependencies("secpod_adobe_prdts_detect_macosx.nasl");
  script_require_keys("Adobe/Flash/Player/MacOSX/Version");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value : "http://www.adobe.com/support/security/bulletins/apsb11-26.html");
  exit(0);
}


include("version_func.inc");

## Get the version from KB
flashVer = get_kb_item("Adobe/Flash/Player/MacOSX/Version");
if(!flashVer){
  exit(0);
}

## Check for Adobe Flash Player versions prior to 10.3.183.10
if(version_is_less(version:flashVer, test_version:"10.3.183.10")){
  security_message(0);
}

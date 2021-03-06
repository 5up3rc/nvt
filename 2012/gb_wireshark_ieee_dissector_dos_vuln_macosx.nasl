###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wireshark_ieee_dissector_dos_vuln_macosx.nasl 5977 2017-04-19 09:02:22Z teissa $
#
# Wireshark IEEE 802.11 Dissector Denial of Service Vulnerability (Mac OS X)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will allow remote attackers to cause a denial of
  service.
  Impact Level: Application";
tag_affected = "Wireshark versions 1.6.x before 1.6.6 on Mac OS X";
tag_insight = "The flaw is due to an error in the IEEE 802.11 dissector can be
  exploited to cause an infinite loop via a specially crafted packet.";
tag_solution = "Upgrade to the Wireshark version 1.6.6 or later,
  For updates refer to http://www.wireshark.org/download";
tag_summary = "This host is installed with Wireshark and is prone to denial of
  service vulnerability.";

if(description)
{
  script_id(802765);
  script_version("$Revision: 5977 $");
  script_cve_id("CVE-2012-1594");
  script_bugtraq_id(52738);
  script_tag(name:"cvss_base", value:"3.3");
  script_tag(name:"cvss_base_vector", value:"AV:A/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-04-19 11:02:22 +0200 (Wed, 19 Apr 2017) $");
  script_tag(name:"creation_date", value:"2012-04-24 15:24:35 +0530 (Tue, 24 Apr 2012)");
  script_name("Wireshark IEEE 802.11 Dissector Denial of Service Vulnerability (Mac OS X)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/48548/");
  script_xref(name : "URL" , value : "http://www.wireshark.org/security/wnpa-sec-2012-05.html");
  script_xref(name : "URL" , value : "http://www.openwall.com/lists/oss-security/2012/03/28/13");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2012 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("gb_wireshark_detect_macosx.nasl");
  script_require_keys("Wireshark/MacOSX/Version");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

## Variable Initialization
sharkVer = "";

## Get version from KB
sharkVer = get_kb_item("Wireshark/MacOSX/Version");
if(!sharkVer){
  exit(0);
}

## Check for vulnerable Wireshark versions
if(version_in_range(version:sharkVer, test_version:"1.6.0", test_version2:"1.6.5")){
  security_message(0);
}

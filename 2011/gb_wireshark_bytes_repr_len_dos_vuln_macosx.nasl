###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wireshark_bytes_repr_len_dos_vuln_macosx.nasl 7019 2017-08-29 11:51:27Z teissa $
#
# Wireshark 'bytes_repr_len' Denial of Service Vulnerability (Mac OS X)
#
# Authors:
# Rachana Shetty <srachana@secpod.com>
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
  service condition.
  Impact Level: Application";
tag_affected = "Wireshark version 1.4.5";
tag_insight = "The flaw is caused by an error in the 'bytes_repr_len' function, which allows
  remote attackers to cause a denial of service via arbitrary TCP traffic.";
tag_solution = "Upgrade to the Wireshark version 1.4.7 or later,
  For updates refer to http://www.wireshark.org/download";
tag_summary = "This host is installed with Wireshark and is prone to denial of
  service vulnerability.";

if(description)
{
  script_id(802877);
  script_version("$Revision: 7019 $");
  script_cve_id("CVE-2011-1956");
  script_bugtraq_id(48389);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-08-29 13:51:27 +0200 (Tue, 29 Aug 2017) $");
  script_tag(name:"creation_date", value:"2011-06-13 15:43:58 +0200 (Mon, 13 Jun 2011)");
  script_name("Wireshark 'bytes_repr_len' Denial of Service Vulnerability (Mac OS X)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/44449/");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/67789");
  script_xref(name : "URL" , value : "https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5837");

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
if(version_is_equal(version:sharkVer, test_version:"1.4.5")) {
  security_message(0);
}

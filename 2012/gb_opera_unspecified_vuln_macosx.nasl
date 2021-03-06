###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_opera_unspecified_vuln_macosx.nasl 5977 2017-04-19 09:02:22Z teissa $
#
# Opera Unspecified Vulnerability - June12 (Mac OS X)
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
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

tag_impact = "Unknown impact and attack vectors.
  Impact Level: System/Application";
tag_affected = "Opera version prior to 12.00 on Mac OS X";
tag_insight = "The flaw is due to an unspecified error in the application.";
tag_solution = "Upgrade to Opera version 12 or later,
  For updates refer to http://www.opera.com/";
tag_summary = "The host is installed with Opera and is prone to unspecified
  vulnerability.";

if(description)
{
  script_id(802655);
  script_version("$Revision: 5977 $");
  script_cve_id("CVE-2012-3559");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-04-19 11:02:22 +0200 (Wed, 19 Apr 2017) $");
  script_tag(name:"creation_date", value:"2012-06-22 10:10:10 +0530 (Fri, 22 Jun 2012)");
  script_name("Opera Unspecified Vulnerability - June12 (Mac OS X)");
  script_xref(name : "URL" , value : "http://www.opera.com/docs/changelogs/mac/1200/");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_opera_detect_macosx.nasl");
  script_require_keys("Opera/MacOSX/Version");
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

operaVer = "";

## Get Opera version from KB
operaVer = get_kb_item("Opera/MacOSX/Version");
if(!operaVer){
  exit(0);
}

## Check for opera version is less than 12.00
if(version_is_less(version:operaVer, test_version:"12.00")){
  security_message(0);
}

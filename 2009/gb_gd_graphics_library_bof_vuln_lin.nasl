###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_gd_graphics_library_bof_vuln_lin.nasl 4869 2016-12-29 11:01:45Z teissa $
#
# GD Graphics Library '_gdGetColors()' Buffer Overflow Vulnerability (Linux)
#
# Authors:
# Sharath S <sharaths@secpod.com>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation could allow attackers to potentially
compromise a vulnerable system.

Impact Level: System";

tag_affected = "GD Graphics Library version 2.x on Linux.";

tag_insight = "The flaw is due to error in '_gdGetColors' function in gd_gd.c
which fails to check certain colorsTotal structure member, whicn can be exploited
to cause buffer overflow or buffer over-read attacks via a crafted GD file.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "The host is installed with GD Graphics Library and is prone to
Buffer Overflow vulnerability.

This NVT may create FP and LSC's are taking care of it.";

if(description)
{
  script_id(801122);
  script_version("$Revision: 4869 $");
  script_tag(name:"deprecated", value:TRUE);
  script_tag(name:"last_modification", value:"$Date: 2016-12-29 12:01:45 +0100 (Thu, 29 Dec 2016) $");
  script_tag(name:"creation_date", value:"2009-10-23 16:18:41 +0200 (Fri, 23 Oct 2009)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-3546");
  script_bugtraq_id(36712);
  script_name("GD Graphics Library '_gdGetColors()' Buffer Overflow Vulnerability (Linux)");


  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Buffer overflow");
  script_dependencies("gb_gd_graphics_library_detect_lin.nasl");
  script_require_keys("GD-Graphics-Lib/Lin/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"solution_type", value:"WillNotFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/37069/");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2009/2929");
  script_xref(name : "URL" , value : "http://marc.info/?l=oss-security&m=125562113503923&w=2");
  exit(0);
}

exit(66); ## This NVT is deprecated as it may create FP.

gdVer = get_kb_item("GD-Graphics-Lib/Lin/Ver");

# Check GD Graphics Library version 2.x
if(gdVer =~ "^2\..*"){
  security_message(0);
}

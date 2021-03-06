###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_db2_unspesified_vuln_lin.nasl 7113 2017-09-13 06:03:30Z cfischer $
#
# IBM DB2 Unspecified Vulnerability (Linux)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

tag_impact = "Unknown impact.

  Impact Level: System/Application.";
tag_affected = "IBM DB2 version 9.1 prior to Fixpak 8";
tag_insight = "An unspecified error in the handling of 'SET SESSION AUTHORIZATION'
  statements that can be exploited to execute the statement without having
  the required privileges.";
tag_solution = "Update DB2 9.1 Fixpak 8 or later.
  http://www-01.ibm.com/support/docview.wss?rs=71&uid=swg27007053";
tag_summary = "The host is installed with IBM DB2 and is prone to unspecified
  vulnerability.";

if(description)
{
  script_id(801003);
  script_version("$Revision: 7113 $");
  script_tag(name:"last_modification", value:"$Date: 2017-09-13 08:03:30 +0200 (Wed, 13 Sep 2017) $");
  script_tag(name:"creation_date", value:"2009-10-06 07:21:15 +0200 (Tue, 06 Oct 2009)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-3473");
  script_name("IBM DB2 Unspecified Vulnerability (Linux)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/36890");
  script_xref(name : "URL" , value : "http://www-01.ibm.com/support/docview.wss?uid=swg21403619");
  script_xref(name : "URL" , value : "http://www-01.ibm.com/support/docview.wss?uid=swg21386689");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_ibm_db2_detect_linux_900217.nasl");
  script_require_keys("Linux/IBM_db2/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"executable_version");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

ibmVer = get_kb_item("Linux/IBM_db2/Ver");
if(!ibmVer){
  exit(0);
}

# Check for IBM DB2 Products Version 9.1 before FP8
# IBM DB2 9.1 FP8 =>9.1.0.8
if(version_in_range(version:ibmVer, test_version:"9.1",
                                    test_version2:"9.1.0.7")){
  security_message(0);
}

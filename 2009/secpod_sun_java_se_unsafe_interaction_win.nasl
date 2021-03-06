###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_sun_java_se_unsafe_interaction_win.nasl 6465 2017-06-28 13:17:01Z cfischer $
#
# Unsafe Interaction In Sun Java SE Abstract Window Toolkit (Windows)
#
# Authors:
# Sharath S <sharaths@secpod.com>
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

tag_impact = "Successful attacks will allow attackers to trick a user into interacting
  unsafely with an untrusted applet.
  Impact Level: System/Application";
tag_affected = "Sun Java SE version 6.0 before Update 15 on Windows.";
tag_insight = "An error in the Abstract Window Toolkit (AWT) implementation on Windows
  2000 Professional does not provide a Security Warning Icon.";
tag_solution = "Upgrade to Java SE version 6 Update 15
  http://java.sun.com/javase/downloads/index.jsp";
tag_summary = "This host is installed with Sun Java SE and is prone to Unsafe
  Interaction.";

if(description)
{
  script_id(900820);
  script_version("$Revision: 6465 $");
  script_tag(name:"last_modification", value:"$Date: 2017-06-28 15:17:01 +0200 (Wed, 28 Jun 2017) $");
  script_tag(name:"creation_date", value:"2009-08-24 07:49:31 +0200 (Mon, 24 Aug 2009)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2009-2717");
  script_name("Unsafe Interaction In Sun Java SE Abstract Window Toolkit (Windows)");
  script_xref(name : "URL" , value : "http://java.sun.com/javase/6/webnotes/6u15.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("General");
  script_dependencies("gb_java_prdts_detect_win.nasl");
  script_mandatory_keys("Sun/Java/JDK_or_JRE/Win/installed");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");

if(hotfix_check_sp(win2k:5) <= 0){
  exit(0);
}

# Get KB for JDK Version On Windows
jdkVer = get_kb_item("Sun/Java/JDK/Win/Ver");

if(jdkVer)
{
  jdkVer = ereg_replace(pattern:"_", string:jdkVer, replace: ".");
  # Check for 1.6 < 1.6.0_15 (6 Update 15)
  if(version_in_range(version:jdkVer, test_version:"1.6", test_version2:"1.6.0.14")){
    security_message(0);
    exit(0);
  }
}

# Get KB for JRE Version On Windows
jreVer = get_kb_item("Sun/Java/JRE/Win/Ver");

if(jreVer)
{
  jreVer = ereg_replace(pattern:"_", string:jreVer, replace: ".");
  # Check for 1.6 < 1.6.0_15 (6 Update 15)
  if(version_in_range(version:jreVer, test_version:"1.6", test_version2:"1.6.0.14")){
    security_message(0);
  }
}

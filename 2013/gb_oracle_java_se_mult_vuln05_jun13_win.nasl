###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_java_se_mult_vuln05_jun13_win.nasl 6093 2017-05-10 09:03:18Z teissa $
#
# Oracle Java SE Multiple Vulnerabilities -05 June 13 (Windows)
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_solution = "Apply patch from below link,
  http://www.oracle.com/technetwork/topics/security/javacpujun2013-1899847.html

  *****
  NOTE: Ignore this warning if above mentioned patch is installed.
  *****";

tag_impact = "Successful exploitation allows remote attackers to affect confidentiality,
  integrity, and availability via unknown vectors. Attackers can even execute
  arbitrary code on the target system.
  Impact Level: System/Application";

tag_affected = "Oracle Java SE Version 5.0 Update 45 and earlier";
tag_insight = "Flaws are due to unspecified errors related to Java Installer.";
tag_summary = "This host is installed with Oracle Java SE and is prone to
  multiple vulnerabilities.";

if(description)
{
  script_id(803823);
  script_version("$Revision: 6093 $");
  script_cve_id("CVE-2013-2467");
  script_bugtraq_id(60649);
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-05-10 11:03:18 +0200 (Wed, 10 May 2017) $");
  script_tag(name:"creation_date", value:"2013-06-24 18:12:09 +0530 (Mon, 24 Jun 2013)");
  script_name("Oracle Java SE Multiple Vulnerabilities -05 June 13 (Windows)");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/53846");
  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/topics/security/javacpujun2013-1899847.html");
  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/topics/security/javacpujun2013verbose-1899853.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_java_prdts_detect_win.nasl");
  script_mandatory_keys("Sun/Java/JRE/Win/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

## Variable Initialization
jreVer = "";

## Get JRE Version from KB
jreVer = get_kb_item("Sun/Java/JRE/Win/Ver");

if(jreVer && jreVer =~ "^(1\.5)")
{
  jreVer = ereg_replace(pattern:"_|-", string:jreVer, replace: ".");

  ##Check for Oracle Java SE Versions
  if(version_in_range(version:jreVer, test_version:"1.5", test_version2:"1.5.0.45"))
  {
    security_message(0);
    exit(0);
  }
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_java_se_jre_awt_comp_unspecified_vuln_win.nasl 4378 2016-10-28 09:01:50Z cfi $
#
# Oracle Java SE JRE AWT Component Unspecified Vulnerability - (Windows)
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803021");
  script_version("$Revision: 4378 $");
  #Remark: NIST don't see "security-in-depth fixes" as software flaws so this CVSS has a value of 0.0.
  #However we still should report missing security fixes with a criticality so this has been commented
  #out to avoid that the automatic CVSS score correction is setting the CVSS back to 0.0
  #script_cve_id("CVE-2012-0547");
  script_bugtraq_id(55339);
  script_tag(name:"cvss_base", value:"3.5");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:S/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2016-10-28 11:01:50 +0200 (Fri, 28 Oct 2016) $");
  script_tag(name:"creation_date", value:"2012-09-03 12:12:23 +0530 (Mon, 03 Sep 2012)");
  script_name("Oracle Java SE JRE AWT Component Unspecified Vulnerability - (Windows)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_java_prdts_detect_win.nasl");
  script_require_keys("Sun/Java/JRE/Win/Ver");

  script_xref(name:"URL", value:"https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-0547");
  script_xref(name:"URL", value:"http://secunia.com/advisories/50133");
  script_xref(name:"URL", value:"http://securitytracker.com/id/1027458");
  script_xref(name:"URL", value:"http://www.oracle.com/technetwork/topics/security/alert-cve-2012-4681-1835715.html");

  tag_impact = "Has no impact and remote attack vectors. The missing patch is a security-in-depth fix released by Oracle.

  Impact Level: Application";

  tag_affected = "Oracle Java SE versions 7 Update 6, 6 Update 34 and earlier";

  tag_insight = "Unspecified vulnerability in the JRE component related to AWT sub-component.";

  tag_solution = "Apply the patch from below link
  http://www.oracle.com/technetwork/topics/security/alert-cve-2012-4681-1835715.html";

  tag_summary = "This host is installed with Oracle Java SE JRE and is prone to
  unspecified vulnerability.";

  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);

  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

## Variable Initialization
jreVer = "";

## Get JRE Version from KB
jreVer = get_kb_item("Sun/Java/JRE/Win/Ver");

if(jreVer)
{
  jreVer = ereg_replace(pattern:"_|-", string:jreVer, replace: ".");

  ## Check for Oracle Java SE versions 7 Update 6 and earlier,
  if(version_in_range(version:jreVer, test_version:"1.7", test_version2:"1.7.0.6")||
     version_in_range(version:jreVer, test_version:"1.6", test_version2:"1.6.0.34")){
    security_message(port:0);
  }
}

exit(99);

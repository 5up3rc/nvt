###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_oracle_java_mult_unspecified_vuln_win_feb11.nasl 7024 2017-08-30 11:51:43Z teissa $
#
# Oracle Java SE Multiple Unspecified Vulnerabilities - Feb11 (Windows)
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

tag_impact = "Successful attacks will allow attackers to manipulate or gain knowledge of
  sensitive information, bypass restrictions, cause a denial of service or
  compromise a vulnerable system.
  Impact Level: Application";
tag_affected = "Oracle Java SE 1.4.2_29 and prior,
  Oracle Java SE 6 Update 23 and 5 Update 27 and prior.";
tag_insight = "The flaws are due to
  - Error in 'JRE' allows remote untrusted Java Web Start applications and
    untrusted Java applets to affect confidentiality, integrity via unknown
    vectors related to Deployment and Networking.
  - Error in 'JRE' component, which allows remote attackers to affect
    confidentiality, integrity, and availability via unknown vectors related to
    Sound, Swing, HotSpot and unspecified APIs.";
tag_solution = "Upgrade to Oracle Java SE 6 Update 24 or later
  For updates refer to http://java.com/en/download/index.jsp";
tag_summary = "This host is installed with Sun Java SE and is prone to multiple
  unspecified vulnerabilities.";

if(description)
{
  script_id(902344);
  script_version("$Revision: 7024 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-30 13:51:43 +0200 (Wed, 30 Aug 2017) $");
  script_tag(name:"creation_date", value:"2011-02-28 11:12:07 +0100 (Mon, 28 Feb 2011)");
  script_cve_id("CVE-2010-4447", "CVE-2010-4448", "CVE-2010-4454", "CVE-2010-4462",
                "CVE-2010-4465", "CVE-2010-4466", "CVE-2010-4469", "CVE-2010-4473",
                "CVE-2010-4475", "CVE-2010-4476");
  script_bugtraq_id(46409, 46398, 46391, 46394, 46406, 46411, 46400, 46403, 46410,
                    46091);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Oracle Java SE Multiple Unspecified Vulnerabilities (Windows)");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2011/0405");
  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/topics/security/javacpufeb2011-304611.html");

  script_tag(name:"qod_type", value:"registry");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 SecPod");
  script_family("General");
  script_dependencies("gb_java_prdts_detect_win.nasl");
  script_mandatory_keys("Sun/Java/JDK_or_JRE/Win/installed");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("smb_nt.inc");
include("version_func.inc");

# Get KB for JRE Version On Windows
jreVer = get_kb_item("Sun/Java/JRE/Win/Ver");
if(jreVer)
{
  jreVer = ereg_replace(pattern:"_|-", string:jreVer, replace: ".");
  
  # Check for 1.6 < 1.6.0_23 (6 Update 23), 1.5 < 1.5.0_27(5 Update 27), =< 1.4.2_29
  if(version_is_less_equal(version:jreVer, test_version:"1.4.2.29") ||
     version_in_range(version:jreVer, test_version:"1.6", test_version2:"1.6.0.23") ||
     version_in_range(version:jreVer, test_version:"1.5", test_version2:"1.5.0.27"))
  { 
    security_message(0);
    exit(0);
  }
}

# Get KB for JDK Version On Windows
jdkVer = get_kb_item("Sun/Java/JDK/Win/Ver");
if(jdkVer)
{
  jdkVer = ereg_replace(pattern:"_|-", string:jdkVer, replace: ".");

  # Check for 1.6 < 1.6.0_23 (6 Update 23), 1.5 < 1.5.0_27(5 Update 27), =< 1.4.2_29
  if(version_is_less_equal(version:jdkVer, test_version:"1.4.2.29") ||
     version_in_range(version:jdkVer, test_version:"1.6", test_version2:"1.6.0.23") ||
     version_in_range(version:jdkVer, test_version:"1.5", test_version2:"1.5.0.27")){ 
     security_message(0);
  }
}

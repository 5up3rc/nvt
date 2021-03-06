###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_tortoise_svn_insecure_lib_load_vuln.nasl 5373 2017-02-20 16:27:48Z teissa $
#
# TortoiseSVN Insecure Library Loading Vulnerability
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation could allow remote attackers to execute
arbitrary code and conduct DLL hijacking attacks.

Impact Level: System/Application";

tag_affected = "TortoiseSVN 1.6.10, Build 19898 and Prior.";

tag_insight = "The flaw is due to the application insecurely loading certain
libraries from the current working directory, which could allow attackers
to execute arbitrary code by tricking a user into opening a file from a
network share.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "This host is installed with TortoiseSVN and is prone to insecure
  library loading vulnerability.";

if(description)
{
  script_id(801290);
  script_version("$Revision: 5373 $");
  script_tag(name:"last_modification", value:"$Date: 2017-02-20 17:27:48 +0100 (Mon, 20 Feb 2017) $");
  script_tag(name:"creation_date", value:"2010-09-21 16:43:08 +0200 (Tue, 21 Sep 2010)");
  script_cve_id("CVE-2010-3199");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("TortoiseSVN Insecure Library Loading Vulnerability");
  desc = "
  Summary:
  " + tag_summary + "

  Vulnerability Insight:
  " + tag_insight + "

  Impact:
  " + tag_impact + "

  Affected Software/OS:
  " + tag_affected + "

  Solution:
  " + tag_solution;


  script_tag(name:"qod_type", value:"registry");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_tortoise_svn_detect.nasl");
  script_require_keys("TortoiseSVN/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"solution_type", value:"WillNotFix");
  script_xref(name : "URL" , value : "http://www.securityfocus.com/archive/1/archive/1/513442/100/0/threaded");
  script_xref(name : "URL" , value : "http://tortoisesvn.tigris.org/ds/viewMessage.do?dsForumId=4061&dsMessageId=2653163");
  script_xref(name : "URL" , value : "http://tortoisesvn.tigris.org/ds/viewMessage.do?dsForumId=4061&dsMessageId=2653202&orderBy=createDate&orderType=desc");
  exit(0);
}


include("version_func.inc");

## Get version from KB
svnVer = get_kb_item("TortoiseSVN/Ver");

if(svnVer != NULL)
{
  ##Check for TortoiseSVN versions < 1.6.19898
  if( version_is_less_equal(version:svnVer, test_version: "1.6.19898") ){
    security_message(0);
  }
}

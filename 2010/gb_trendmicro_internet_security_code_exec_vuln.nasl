###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_trendmicro_internet_security_code_exec_vuln.nasl 5373 2017-02-20 16:27:48Z teissa $
#
# Trend Micro Internet Security Pro 'UfPBCtrl.dll' Code Execution Vulnerability
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801264");
  script_version("$Revision: 5373 $");
  script_tag(name:"last_modification", value:"$Date: 2017-02-20 17:27:48 +0100 (Mon, 20 Feb 2017) $");
  script_tag(name:"creation_date", value:"2010-09-03 15:47:26 +0200 (Fri, 03 Sep 2010)");
  script_cve_id("CVE-2010-3189");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Trend Micro Internet Security Pro 'UfPBCtrl.dll' Code Execution Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_trendmicro_internet_security_detect.nasl");
  script_mandatory_keys("TrendMicro/Ver");

  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/61397");
  script_xref(name:"URL", value:"http://www.vupen.com/english/advisories/2010/2185");
  script_xref(name:"URL", value:"http://www.zerodayinitiative.com/advisories/ZDI-10-165/");
  script_xref(name:"URL", value:"http://esupport.trendmicro.com/pages/Hot-Fix-UfPBCtrldll-is-vulnerable-to-remote-attackers.aspx");

  script_tag(name:"impact", value:"Successful exploitation could allow remote attackers to execute arbitrary
  code on the system with the privileges of the victim.

  Impact Level: Application");
  script_tag(name:"affected", value:"Trend Micro Internet Security Pro 2010");
  script_tag(name:"insight", value:"The flaw is caused by an error in the 'extSetOwner()' function within the
  'UfPBCtrl.dll' ActiveX control when processing user-supplied parameters,
  which could be exploited by remote attackers to execute arbitrary code by
  tricking a user into visiting a specially crafted web page.");
  script_tag(name:"summary", value:"This host is installed with Trend Micro Internet Security Pro and
  is prone to code execution vulnerability.");
  script_tag(name:"solution", value:"Apply hotfix
  http://solutionfile.trendmicro.com/solutionfile/EN-1056426/TISPro_1750_win_en_hfb1695.exe

  *****
  NOTE: Ignore this warning if above mentioned patch is already applied.
  *****");

  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}


include("version_func.inc");

## Get version from KB
tmVer = get_kb_item("TrendMicro/Ver");

## Check for Trend Micro Internet Security Pro 2010 (Version 17.50)
if( version_is_equal(version:tmVer, test_version:"17.50") ){
  report = report_fixed_ver(installed_version:tmVer, fixed_version:"17.50 Hotfix 1695");
  security_message(data:report);
  exit(0);
}

exit(99);
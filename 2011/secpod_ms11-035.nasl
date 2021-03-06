###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms11-035.nasl 5362 2017-02-20 12:46:39Z cfi $
#
# Microsoft Windows WINS Remote Code Execution Vulnerability (2524426)
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
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

tag_impact = "Successful exploitation could allow remote attackers to execute arbitrary
  code with elevated privileges or cause a denial-of-service condition.
  Impact Level: System/Application";
tag_affected = "Microsoft Windows 2K3 Service Pack 2 and prior
  Microsoft Windows Server 2008 Service Pack 2 and prior";
tag_insight = "The flaw is caused by a logic error in the Windows Internet Name Service
  (WINS) when handling a socket send exception, which could cause certain user
  supplied values to remain within a stack frame and to be reused in another
  context, leading to arbitrary code execution with elevated privileges.";
tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://www.microsoft.com/technet/security/bulletin/MS11-035.mspx";
tag_summary = "This host is missing a critical security update according to
  Microsoft Bulletin MS11-035.";

if(description)
{
  script_id(902516);
  script_version("$Revision: 5362 $");
  script_tag(name:"last_modification", value:"$Date: 2017-02-20 13:46:39 +0100 (Mon, 20 Feb 2017) $");
  script_tag(name:"creation_date", value:"2011-05-11 14:45:15 +0200 (Wed, 11 May 2011)");
  script_cve_id("CVE-2011-1248");
  script_bugtraq_id(47730);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Microsoft Windows WINS Remote Code Execution Vulnerability (2524426)");
  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/2524426");
  script_xref(name : "URL" , value : "http://www.zerodayinitiative.com/advisories/ZDI-11-167/");
  script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/bulletin/MS11-035.mspx");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");

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
include("secpod_smb_func.inc");

## Check for OS and Service Pack
if(hotfix_check_sp(win2003:3, win2008:3) <= 0){
  exit(0);
}

## MS11-035 Hotfix (2524426)
if(hotfix_missing(name:"2524426") == 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

## Confirm WINS Installation
if(!registry_key_exists(key:"SYSTEM\CurrentControlSet\Services\WINS")){
  exit(0);
}

## Get Version from Wins.exe file
exeVer = fetch_file_version(syspath, file_name:"system32\Wins.exe");
if(!exeVer){
  exit(0);
}

## Windows 2003
if(hotfix_check_sp(win2003:3) > 0)
{
  SP = get_kb_item("SMB/Win2003/ServicePack");
  if("Service Pack 2" >< SP)
  {
    ## Check for Wins.exe version
    if(version_is_less(version:exeVer, test_version:"5.2.3790.4849")){
      security_message(0);
    }
    exit(0);
  }
  security_message(0);
}

## Windows Server 2008
else if(hotfix_check_sp(win2008:3) > 0)
{
  SP = get_kb_item("SMB/Win2008/ServicePack");
  if("Service Pack 1" >< SP)
  {
    ## Check for Wins.exe version
    if(version_is_less(version:exeVer, test_version:"6.0.6001.18629") ||
       version_in_range(version:exeVer, test_version:"6.0.6001.22000", test_version2:"6.0.6001.22890")){
      security_message(0);
    }
    exit(0);
  }

  if("Service Pack 2" >< SP)
  {
    ## Check for Wins.exe version
    if(version_is_less(version:exeVer, test_version:"6.0.6002.18441") ||
       version_in_range(version:exeVer, test_version:"6.0.6002.22000", test_version2:"6.0.6002.22620")){
      security_message(0);
    }
    exit(0);
  }
  security_message(0);
}

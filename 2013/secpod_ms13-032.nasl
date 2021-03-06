###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms13-032.nasl 5339 2017-02-18 16:28:22Z cfi $
#
# Microsoft Windows Active Directory Denial of Service Vulnerability (2830914)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2013 SecPod, http://www.secpod.com
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

tag_impact = "Successful exploitation will allow the remote attackers to cause a
  denial-of-service condition.
  Impact Level: System/Application.";

tag_affected = "Microsoft Windows 8
  Microsoft Windows Server 2012
  Microsoft Windows XP x32 Edition Service Pack 3 and prior
  Microsoft Windows XP x64 Edition Service Pack 2 and prior
  Microsoft Windows 7 x32/x64 Edition Service Pack 1 and prior
  Microsoft Windows 2003 x32/x64 Edition Service Pack 2 and prior
  Microsoft Windows Vista x32/x64 Edition Service Pack 2 and prior
  Microsoft Windows Server 2008 R2 x64 Edition Service Pack 1 and prior
  Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2 and prior";
tag_insight = "The flaw is due to an error within the implementations of Active Directory,
  Active Directory Application Mode (ADAM), Active Directory Lightweight
  Directory Service (AD LDS), and Active Directory Services when handling
  LDAP queries. This can be exploited to exhaust available memory resources and
  render the LDAP service non-responsive via a specially crafted LDAP query.";
tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://technet.microsoft.com/en-us/security/bulletin/ms13-032";
tag_summary = "This host is missing an important security update according to
  Microsoft Bulletin MS13-032.";

if(description)
{
  script_id(902965);
  script_version("$Revision: 5339 $");
  script_cve_id("CVE-2013-1282");
  script_bugtraq_id(58848);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-02-18 17:28:22 +0100 (Sat, 18 Feb 2017) $");
  script_tag(name:"creation_date", value:"2013-04-10 12:37:03 +0530 (Wed, 10 Apr 2013)");
  script_name("Microsoft Windows Active Directory Denial of Service Vulnerability (2830914)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/52917/");
  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/2801109");
  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/2772930");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/en-us/security/bulletin/ms13-032");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl");
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
if(hotfix_check_sp(xp:4, xpx64:3, win2003:3, win2003x64:3, winVista:3, win7:2,
   win7x64:2, win2008:3, win2008r2:2, win8:1, win2012:1) <= 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

if(hotfix_check_sp(win2003:3, win2003x64:3) > 0)
{
  if(registry_key_exists(key:"SYSTEM\CurrentControlSet\Services\NTDS\Performance"))
  {
    ntdsaVer = fetch_file_version(sysPath, file_name:"system32\Ntdsa.dll");
    if(ntdsaVer != NULL)
    {
      # Check for Ntdsa.dll version < 5.2.3790.5130
      if(version_is_less(version:ntdsaVer, test_version:"5.2.3790.5130"))
      {
        security_message(0);
        exit(0);
      }
    }
  }
}

if(hotfix_check_sp(xp:4, xpx64:3, win2003:3, win2003x64:3) > 0)
{
  if(registry_key_exists(key:"SYSTEM\CurrentControlSet\Services\ADAM\Linkage"))
  {
    # Get the version of Active Directory Application Mode
    adamdsaVer = fetch_file_version(sysPath, file_name:"ADAM\Adamdsa.dll");
    if(adamdsaVer != NULL)
    {
      if(version_is_less(version:adamdsaVer, test_version:"1.1.3790.5131"))
      {
        security_message(0);
        exit(0);
      }
    }
  }
}

## AD LAS For Windows 7, vista and 2008 server
## Get the version for Ntdsai.dll
dllVer = fetch_file_version(sysPath, file_name:"system32\Ntdsai.dll");
if(!dllVer){
  exit(0);
}

## Windows Vista and Windows Server 2008
if(hotfix_check_sp(winVista:3, win2008:3) > 0)
{
  ## Check for Ntdsai.dll version # 6.0.6002.18781
  if(version_is_less(version:dllVer, test_version:"6.0.6002.18781") ||
     version_in_range(version:dllVer, test_version:"6.0.6002.22000", test_version2:"6.0.6002.23035"))
  {
    security_message(0);
    exit(0);
  }
}

## Windows 7
else if(hotfix_check_sp(win7:2) > 0)
{
  ## Grep for Ntdsai.dll version
  if(version_is_less(version:dllVer, test_version:"6.1.7600.17232") ||
     version_in_range(version:dllVer, test_version:"6.1.7600.21000", tes_version2:"6.1.7600.21441") ||
     version_in_range(version:dllVer, test_version:"6.1.7601.17000", tes_version2:"6.1.7601.18074") ||
     version_in_range(version:dllVer, test_version:"6.1.7601.21000", tes_version2:"6.1.7601.22244")){
    security_message(0);
  }
}

else if(hotfix_check_sp(win8:1, win2012:1) > 0)
{
  ## Grep for Ntdsai.dll version
  if(version_is_less(version:dllVer, test_version:"6.2.9200.16522") ||
     version_in_range(version:dllVer, test_version:"6.2.9200.20000", test_version2:"6.2.9200.20625")){
    security_message(0);
  }
}

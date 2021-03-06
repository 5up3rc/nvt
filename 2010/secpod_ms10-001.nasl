###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms10-001.nasl 5934 2017-04-11 12:28:28Z antu123 $
#
# Microsoft Embedded OpenType Font Engine Remote Code Execution Vulnerabilities (972270)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Updated By: Madhuri D <dmadhuri@secpod.com> on 2010-11-23
#       - To detect file version 'Fontsub.dll' on vista, win 2008 and win 7
#
# Copyright:
# Copyright (c) 2010 SecPod, http://www.secpod.com
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
  script_id(901095);
  script_version("$Revision: 5934 $");
  script_tag(name:"last_modification", value:"$Date: 2017-04-11 14:28:28 +0200 (Tue, 11 Apr 2017) $");
  script_tag(name:"creation_date", value:"2010-01-13 15:42:20 +0100 (Wed, 13 Jan 2010)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2010-0018");
  script_bugtraq_id(37671);
  script_name("Microsoft Embedded OpenType Font Engine Remote Code Execution Vulnerabilities (972270)");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2010/0095");
  script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/bulletin/ms10-001.mspx");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");

  script_tag(name : "impact" , value : "Successful exploitation could allow remote attackers to crash an affected
  system or execute arbitrary code by tricking a user into visiting a specially
  crafted web page.
  Impact Level: System");
  script_tag(name : "affected" , value : "Micorsoft Windows 7
  Microsoft Windows 2000 Service Pack 4 and prior.
  Microsoft Windows XP Service Pack 3 and prior.
  Microsoft Windows 2003 Service Pack 2 and prior.
  Microsoft Windows Vista Service Pack 1/2 and prior.
  Microsoft Windows Server 2008 Service Pack 1/2 and prior.");
  script_tag(name : "insight" , value : "An integer overflow error in the LZCOMP decompressor within the Embedded
  OpenType Font Engine (EOT) when decompressing malformed files and content
  containing embedded fonts.");
  script_tag(name : "solution" , value : "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://www.microsoft.com/technet/security/bulletin/ms10-001.mspx");
  script_tag(name : "summary" , value : "This host is missing a critical security update according to
  Microsoft Bulletin MS10-001.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(win2k:5, xp:4, win2003:3, winVista:3, win7:1, win2008:3) <= 0){
  exit(0);
}

# Check for MS10-001 Hotfix Missing 972270
if(hotfix_missing(name:"972270") == 0){
  exit(0);
}

## Get System32 path
sysPath = smb_get_system32root();
if(sysPath)
{
  dllVer = fetch_file_version(sysPath, file_name:"Fontsub.dll");
  if(!dllVer){
     exit(0);
  }
}

# Windows 2K
if(hotfix_check_sp(win2k:5) > 0)
{
  # Grep for Fontsub.dll version < 5.0.2195.7348
  if(version_is_less(version:dllVer, test_version:"5.0.2195.7348")){
    security_message(0);
  }
}
# Windows XP
else if(hotfix_check_sp(xp:4) > 0)
{
  SP = get_kb_item("SMB/WinXP/ServicePack");
  if("Service Pack 2" >< SP)
  {
    # Grep for Fontsub.dll < 5.1.2600.3634
    if(version_is_less(version:dllVer, test_version:"5.1.2600.3634")){
      security_message(0);
    }
     exit(0);
  }
  else if("Service Pack 3" >< SP)
  {
    # Grep for Fontsub.dll <  5.1.2600.5888
    if(version_is_less(version:dllVer, test_version:"5.1.2600.5888")){
      security_message(0);
    }
     exit(0);
  }
  security_message(0);
}

# Windows 2003
else if(hotfix_check_sp(win2003:3) > 0)
{
  SP = get_kb_item("SMB/Win2003/ServicePack");
  if("Service Pack 2" >< SP)
  {
    # Grep for Fontsub.dll version < 5.2.3790.4530
    if(version_is_less(version:dllVer, test_version:"5.2.3790.4603")){
      security_message(0);
    }
    exit(0);
  }
  security_message(0);
}

## Get System32 path
sysPath = smb_get_system32root();
if(sysPath)
{
  dllVer = fetch_file_version(sysPath, file_name:"Fontsub.dll");
  if(!dllVer){
    exit(0);
  }
}

# Windows Vista
if(hotfix_check_sp(winVista:3) > 0)
{
  SP = get_kb_item("SMB/WinVista/ServicePack");
  if("Service Pack 1" >< SP)
  {
    # Grep for Fontsub.dll version < 6.0.6001.18344
    if(version_is_less(version:dllVer, test_version:"6.0.6001.18344")){
        security_message(0);
    }
     exit(0);
  }

  if("Service Pack 2" >< SP)
  {
    # Grep for Fontsub.dll version < 6.0.6002.18124
      if(version_is_less(version:dllVer, test_version:"6.0.6002.18124")){
      security_message(0);
    }
     exit(0);
  }
  security_message(0);
}

# Windows Server 2008
else if(hotfix_check_sp(win2008:3) > 0)
{
  SP = get_kb_item("SMB/Win2008/ServicePack");
  if("Service Pack 1" >< SP)
  {
    # Grep for Fontsub.dll version < 6.0.6001.18344
    if(version_is_less(version:dllVer, test_version:"6.0.6001.18344")){
      security_message(0);
    }
     exit(0);
  }

  if("Service Pack 2" >< SP)
  {
    # Grep for Fontsub.dll version < 6.0.6002.18124
    if(version_is_less(version:dllVer, test_version:"6.0.6002.18124")){
      security_message(0);
    }
    exit(0);
  }
 security_message(0);
}

# Windows 7
else if(hotfix_check_sp(win7:1) > 0)
{
  # Grep for Fontsub.dll version < version < 
  if(version_is_less(version:dllVer, test_version:"6.1.7600.16444")){
     security_message(0);
  }
}


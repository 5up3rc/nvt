###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms10-049.nasl 5934 2017-04-11 12:28:28Z antu123 $
#
# Remote Code Execution Vulnerabilities in SChannel (980436)
#
# Authors:
# Veerendra G.G <veerendragg@secpod.com>
#
# Updated By: Madhuri D <dmadhuri@secpod.com> on 2010-09-12
#    - To detect file version 'SChannel.dll' on vista, win 2008 and win 7
#
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
# Fioundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_id(900247);
  script_version("$Revision: 5934 $");
  script_tag(name:"last_modification", value:"$Date: 2017-04-11 14:28:28 +0200 (Tue, 11 Apr 2017) $");
  script_tag(name:"creation_date", value:"2010-08-11 15:08:29 +0200 (Wed, 11 Aug 2010)");
  script_bugtraq_id(36935);
  script_cve_id("CVE-2009-3555");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:P");
  script_name("Remote Code Execution Vulnerabilities in SChannel (980436)");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/54158");
  script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/bulletin/MS10-049.mspx");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");

  script_tag(name : "impact" , value : "Successful exploitation of this issue may allow attackers to perform limited
  man-in-the-middle attacks to inject data into the beginning of the
  application protocol stream to execute HTTP transactions, bypass
  authentication.
  Impact Level: Application");
  script_tag(name : "affected" , value : "Micorsoft Windows 7
  Microsoft Windows XP Service Pack 3 and prior.
  Microsoft Windows 2K3 Service Pack 2 and prior.
  Microsoft Windows Vista Service Pack 1/2 and prior.
  Microsoft Windows Server 2008 Service Pack 1/2 and prior.");
  script_tag(name : "insight" , value : "A flaw exists in the Microsoft Windows SChannel (Secure Channel)
  authentication component when using certificate based authentication, which
  allows spoofing.");
  script_tag(name : "solution" , value : "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://www.microsoft.com/technet/security/bulletin/MS10-049.mspx");
  script_tag(name : "summary" , value : "This host is missing a critical security update according to
  Microsoft Bulletin MS10-049.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(xp:4, win2003:3, winVista:3, win7:1, win2008:3) <= 0){
  exit(0);
}

## Check for Hotfix 980436 (MS10-049)
if(hotfix_missing(name:"980436") == 0){
  exit(0);
}

## Get System32 path
sysPath = smb_get_system32root();
if(sysPath)
{
  dllVer = fetch_file_version(sysPath, file_name:"Schannel.dll");
  if(!dllVer){
    exit(0);
  }
}

## Windows XP
if(hotfix_check_sp(xp:4) > 0)
{
  SP = get_kb_item("SMB/WinXP/ServicePack");
  if("Service Pack 3" >< SP)
  {
    ## Grep for Schannel.dll < 5.1.2600.6006
    if(version_is_less(version:dllVer, test_version:"5.1.2600.6006")){
      security_message(0);
    }
    exit(0);
  }
  security_message(0);
}

## Windows 2003
if(hotfix_check_sp(win2003:3) > 0)
{
  SP = get_kb_item("SMB/Win2003/ServicePack");
  if("Service Pack 2" >< SP)
  {
    ## Grep for Schannel.dll version < 5.2.3790.4724
    if(version_is_less(version:dllVer, test_version:"5.2.3790.4724")){
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
  dllVer = fetch_file_version(sysPath, file_name:"Schannel.dll");
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
    # Grep for Schannel.dll version < 6.0.6001.18490
    if(version_is_less(version:dllVer, test_version:"6.0.6001.18490")){
      security_message(0);
    }
     exit(0);
  }

  if("Service Pack 2" >< SP)
  {
    # Grep for Schannel.dll version < 6.0.6002.18269
      if(version_is_less(version:dllVer, test_version:"6.0.6002.18269")){
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
    # Grep for Schannel.dll version < 6.0.6001.18490
    if(version_is_less(version:dllVer, test_version:"6.0.6001.18490")){
      security_message(0);
    }
     exit(0);
  }

  if("Service Pack 2" >< SP)
  {
    # Grep for Schannel.dll version < 6.0.6002.18269
    if(version_is_less(version:dllVer, test_version:"6.0.6002.18269")){
      security_message(0);
    }
    exit(0);
  }
 security_message(0);
}

# Windows 7
else if(hotfix_check_sp(win7:1) > 0)
{
  # Grep for Schannel.dll version < 6.1.7600.16612
  if(version_is_less(version:dllVer, test_version:"6.1.7600.16612")){
     security_message(0);
  }
}


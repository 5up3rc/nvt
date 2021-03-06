###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms13-101.nasl 33668 2013-12-11 08:49:46Z dec$
#
# Microsoft Windows Kernel Local Privilege Escalation Vulnerabilities (2880430)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2013 SecPod, http://www.secpod.com
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
  script_id(903417);
  script_version("$Revision: 6079 $");
  script_cve_id("CVE-2013-3899", "CVE-2013-3902", "CVE-2013-3903", "CVE-2013-3907",
                "CVE-2013-5058");
  script_bugtraq_id(64080, 64084, 64090, 64087, 64091);
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-05-08 11:03:33 +0200 (Mon, 08 May 2017) $");
  script_tag(name:"creation_date", value:"2013-12-11 08:49:46 +0530 (Wed, 11 Dec 2013)");
  script_name("Microsoft Windows Kernel Local Privilege Escalation Vulnerabilities (2880430)");

  tag_summary =
"This host is missing an important security update according to
Microsoft Bulletin MS13-101";

  tag_vuldetect =
"Get the vulnerable file version and check appropriate patch is applied
or not.";

  tag_insight =
"Multiple flaws are due to ,
- An error within the win32k.sys driver can be exploited to corrupt memory.
- A use-after-free error exists within the win32k.sys driver.
- An error when processing TrueType font files can be exploited to cause
  a crash.
- A double fetch error exists within the portcls.sys driver.
- An integer overflow error exists within the win32k.sys driver.";

  tag_impact =
"Successful exploitation will allow remote attackers to cause a DoS (Denial of
Service) and gain escalated privileges.

Impact Level: System";

  tag_affected =
"Microsoft Windows 8
Windows 8.1 x32/x64 Edition
Microsoft Windows Server 2012
Microsoft Windows XP x32 Edition Service Pack 3 and prior
Microsoft Windows XP x64 Edition Service Pack 2 and prior
Microsoft Windows 7 x32/x64 Edition Service Pack 1 and prior
Microsoft Windows 2003 x32/x64 Edition Service Pack 2 and prior
Microsoft Windows Vista x32/x64 Edition Service Pack 2 and prior
Microsoft Windows Server 2008 R2 x64 Edition Service Pack 1 and prior
Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2 and prior";

  tag_solution =
"Run Windows Update and update the listed hotfixes or download and update
mentioned hotfixes in the advisory from the below link,
https://technet.microsoft.com/en-us/security/bulletin/ms13-101";


   script_tag(name : "summary" , value : tag_summary);
   script_tag(name : "vuldetect" , value : tag_vuldetect);
   script_tag(name : "solution" , value : tag_solution);
   script_tag(name : "insight" , value : tag_insight);
   script_tag(name : "affected" , value : tag_affected);
   script_tag(name : "impact" , value : tag_impact);
   script_tag(name:"qod_type", value:"registry");
   script_tag(name:"solution_type", value:"VendorFix");

   script_xref(name : "URL" , value : "http://secunia.com/advisories/55986");
   script_xref(name : "URL" , value : "http://support.microsoft.com/kb/2893984");
   script_xref(name : "URL" , value : "http://support.microsoft.com/kb/2887069");
   script_xref(name : "URL" , value : "http://www.securitytracker.com/id/1029461");
   script_xref(name : "URL" , value : "https://technet.microsoft.com/en-us/security/bulletin/ms13-101");
   script_category(ACT_GATHER_INFO);
   script_copyright("Copyright (C) 2013 SecPod");
   script_family("Windows : Microsoft Bulletins");
   script_dependencies("smb_reg_service_pack.nasl");
   script_mandatory_keys("SMB/WindowsVersion");
   exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Variables Initialization
sysPath = "";
win32SysVer="";

## Check for OS and Service Pack
if(hotfix_check_sp(xp:4, xpx64:3, win2003:3, win2003x64:3, winVista:3, win7:2,
                   win7x64:2, win2008:3, win2008r2:2, win8:1, win2012:1,
                   win8_1:1, win8_1x64:1) <= 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath){
  exit(0);
}

win32SysVer = fetch_file_version(sysPath, file_name:"system32\win32k.sys");
if(!win32SysVer){
  exit(0);
}

## Windows XP
if(hotfix_check_sp(xp:4) > 0)
{
  ## Grep for the file version
  if(version_is_less(version:win32SysVer, test_version:"5.1.2600.6473")){
    security_message(0);
  }
  exit(0);
}

## Windows XP Professional x64 edition and Windows Server 2003
if(hotfix_check_sp(xpx64:3,win2003x64:3,win2003:3) > 0)
{
  ## Grep for the file version
  if(version_is_less(version:win32SysVer, test_version:"5.2.3790.5250")){
    security_message(0);
  }
  exit(0);
}

## Windows Vista and Windows Server 2008
## Currently not supporting for Vista and Windows Server 2008 64 bit
if(hotfix_check_sp(winVista:3, win2008:3) > 0)
{
  ## Check for Win32k.sys version
  if(version_is_less(version:win32SysVer, test_version:"6.0.6002.18974") ||
     version_in_range(version:win32SysVer, test_version:"6.0.6002.22000", test_version2:"6.0.6002.23260")){
    security_message(0);
  }
  exit(0);
}

## Windows 7 and Windows Server 2008 R2
if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
{
  ## Check for Win32k.sys version
  if(version_is_less(version:win32SysVer, test_version:"6.1.7601.18300") ||
     version_in_range(version:win32SysVer, test_version:"6.1.7601.22000", test_version2:"6.1.7601.22495")){
    security_message(0);
  }
  exit(0);
}

## Windows 8 and Windows Server 2012
if(hotfix_check_sp(win8:1, win2012:1) > 0)
{
  ## Check for Win32k.sys version
  if(version_is_less(version:win32SysVer, test_version:"6.2.9200.16758") ||
     version_in_range(version:win32SysVer, test_version:"6.2.9200.20000", test_version2:"6.2.9200.20870")){
    security_message(0);
  }
  exit(0);
}

## Win 8.1
## Currently not supporting for Windows Server 2012 R2
if(hotfix_check_sp(win8_1:1, win8_1x64:1) > 0)
{
  if(version_is_less(version:win32SysVer, test_version:"6.3.9600.16457")){
   security_message(0);
  }
  exit(0);
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms17-019.nasl 7174 2017-09-18 11:48:08Z asteins $
#
# Microsoft Active Directory Federation Services Information Disclosure Vulnerability (4010320)
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.810813");
  script_version("$Revision: 7174 $");
  script_cve_id("CVE-2017-0043");
  script_bugtraq_id(96628);
  script_tag(name:"cvss_base", value:"2.9");
  script_tag(name:"cvss_base_vector", value:"AV:A/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-09-18 13:48:08 +0200 (Mon, 18 Sep 2017) $");
  script_tag(name:"creation_date", value:"2017-03-15 11:04:14 +0530 (Wed, 15 Mar 2017)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Active Directory Federation Services Information Disclosure Vulnerability (4010320)");

  script_tag(name: "summary" , value:"This host is missing an important security
  update according to Microsoft Bulletin MS17-019.");

  script_tag(name: "vuldetect" , value:"Get the vulnerable file version and check
  appropriate patch is applied or not.");

  script_tag(name: "insight" , value:"The flaw exists when Windows Active Directory
  Federation Services (ADFS) honors XML External Entities.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to read sensitive information about the target system.

  Impact Level: System");

  script_tag(name:"affected", value:"
  Microsoft Windows Server 2012/2012R2
  Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2
  Microsoft Windows Server 2008 R2 x64 Edition Service Pack 1.
  Microsoft Windows Server 2016.");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://technet.microsoft.com/library/security/MS17-019");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/4010320");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/library/security/MS17-019");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Variables Initialization
sysPath = "";
winVer = "";
uspVer  = "";

## Check for OS and Service Pack
if(hotfix_check_sp(win2008:3, win2008r2:2, win2008x64:3, win2012:1, win2012R2:1,
                   win2016:1) <= 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

## Fetch the version of 'Win32k.sys'
winVer = fetch_file_version(sysPath, file_name:"System32\Win32k.sys");
if(!winVer){
  exit(0);
}

## Windows 2008 R2
if(hotfix_check_sp(win2008r2:2) > 0)
{
  ## Check for Win32k.sys version
  ## Presently GDR information is not available.
  if(winVer && version_is_less(version:winVer, test_version:"6.1.7601.23677"))
  {
    Vulnerable_range = "Less than 6.1.7601.23677";
    VULN = TRUE ;
  }
}

## Windows Server 2008
else if(hotfix_check_sp(win2008:3, win2008x64:3) > 0)
{
    adfs = registry_key_exists(key:"SOFTWARE\Microsoft\ADFS");
    if(!adfs){
      exit(0);
    }

    dllVer = fetch_file_version(sysPath, file_name:"\ADFS\Microsoft.identityserver.dll");
    if(!dllVer){
      exit(0);
    }
    
    if(version_is_less(version:dllVer, test_version:"7.0.6002.19742"))
    { 
      Vulnerable_range = "Less than 7.0.6002.19742";
      VULN = TRUE ;
    }

    else if(version_in_range(version:dllVer, test_version:"7.0.6002.22000", test_version2:"7.0.6002.24066"))
    {
      Vulnerable_range = "7.0.6002.22000 - 7.0.6002.24066";
      VULN = TRUE ;
    }

    if(VULN)
    {
      report = 'File checked:     ' + sysPath + "\ADFS\Microsoft.identityserver.dll" + '\n' +
               'File version:     ' + dllVer + '\n' +
               'Vulnerable range: ' + Vulnerable_range + '\n' ;
      security_message(data:report);
      exit(0);
    }
}

## Windows 2012 x64
else if(hotfix_check_sp(win2012:1) > 0)
{
  ## Check for Win32k.sys version
  if(winVer && version_is_less(version:winVer, test_version:"6.2.9200.22099"))
  {
     Vulnerable_range = "Less than 6.2.9200.22099";
     VULN = TRUE ;
  }
}

## Win2012R2
else if(hotfix_check_sp(win2012R2:1) > 0)
{
  ## Check for Win32k.sys version
  if(winVer && version_is_less(version:winVer, test_version:"6.3.9600.18603"))
  {
    Vulnerable_range = "Less than 6.3.9600.18603";
    VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win2016:1) > 0)
{
  ## Windows 2016
  ## Check for Win32k.sys version
  if( winVer && version_in_range(version:winVer, test_version:"10.0.14393.0", test_version2:"10.0.14393.593"))
  {
    Vulnerable_range = "10.0.14393.0 - 10.0.14393.593";
    VULN = TRUE ;
  }
}

if(VULN)
{
  report = 'File checked:     ' + sysPath + "\System32\Win32k.sys" + '\n' +
           'File version:     ' + winVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}

exit(0);

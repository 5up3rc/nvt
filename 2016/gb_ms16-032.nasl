###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms16-032.nasl 7174 2017-09-18 11:48:08Z asteins $
#
# Microsoft Windows Secondary Logon Privilege Elevation Vulnerability (3143141)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.807309");
  script_version("$Revision: 7174 $");
  script_cve_id("CVE-2016-0099");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-09-18 13:48:08 +0200 (Mon, 18 Sep 2017) $");
  script_tag(name:"creation_date", value:"2016-03-09 09:19:37 +0530 (Wed, 09 Mar 2016)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Windows Secondary Logon Privilege Elevation Vulnerability (3143141)");

  script_tag(name: "summary" , value:"This host is missing an important security
  update according to Microsoft Bulletin MS16-032.");

  script_tag(name: "vuldetect" , value:"Get the vulnerable file version and 
  check appropriate patch is applied or not.");

  script_tag(name: "insight" , value:"The flaw exists in Windows when the 
  Secondary Logon Service fails to properly manage request handles in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an
  attacker to run arbitrary code in kernel mode.

  Impact Level: System");

  script_tag(name:"affected", value:"
  Microsoft Windows Vista x32/x64 Edition Service Pack 2
  Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2
  Microsoft Windows 7 x32/x64 Edition Service Pack 1
  Microsoft Windows Server 2008 R2 x64 Edition Service Pack 1
  Microsoft Windows 8.1 x32/x64 Edition
  Microsoft Windows Server 2012/2012R2
  Microsoft Windows 10 x32/x64
  Microsoft Windows 10 Version 1511 x32/x64");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://technet.microsoft.com/en-us/library/security/MS16-034");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3143141");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/en-us/library/security/MS16-032");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
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
dllVer = "";

## Check for OS and Service Pack
if(hotfix_check_sp(winVista:3, win7:2, win7x64:2, win2008:3, win2008r2:2,
                   win2012:1, win2012R2:1, win8_1:1, win8_1x64:1, win10:1, win10x64:1) <= 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

##Fetch the version of 'Seclogon.dll'
sysVer = fetch_file_version(sysPath, file_name:"System32\Seclogon.dll");
if(!sysVer){
  exit(0);
}

##Windows Vista and Windows Server 2008
if(hotfix_check_sp(winVista:3, win2008:3) > 0)
{
  ## Check for Seclogon.dll version
  if(version_is_less(version:sysVer, test_version:"6.0.6002.19598"))
  {
    Vulnerable_range = "Less than 6.0.6002.19598";
    VULN = TRUE ;
  }
  else if(version_in_range(version:sysVer, test_version:"6.0.6002.23000", test_version2:"6.0.6002.23909"))
  {
    Vulnerable_range = "6.0.6002.23000 - 6.0.6002.23909";
    VULN = TRUE ;
  }
}

##Windows 7 and Windows Server 2008 R2
else if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
{
  ## Check for Seclogon.dll version
  if(version_is_less(version:sysVer, test_version:"6.1.7601.19148"))
  {
    Vulnerable_range = "Less than 6.1.7601.19148";
    VULN = TRUE ;
  }
  else if(version_in_range(version:sysVer, test_version:"6.1.7601.23000", test_version2:"6.1.7601.23347"))
  {
    Vulnerable_range = "6.1.7601.23000 - 6.1.7601.23347";
    VULN = TRUE ;
  }
}

##Windows 8.1 and Windows Server 2012 R2
else if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) > 0)
{
  ## Check for Seclogon.dll version
  if(version_is_less(version:sysVer, test_version:"6.3.9600.18230"))
  {
    Vulnerable_range = "Less than 6.3.9600.18230";
    VULN = TRUE ;
  }
}

##Windows Server 2012
else if(hotfix_check_sp(win2012:1) > 0)
{
  ## Check for Seclogon.dll version
  if(version_is_less(version:sysVer, test_version:"6.2.9200.17649"))
  {
    Vulnerable_range = "Less than 6.2.9200.17649";
    VULN = TRUE ;
  }
  else if(version_in_range(version:sysVer, test_version:"6.2.9200.21000", test_version2:"6.2.9200.21767"))
  {
    Vulnerable_range = "6.2.9200.21000 - 6.2.9200.21767";
    VULN = TRUE ;
  }
}

##Windows 10
else if(hotfix_check_sp(win10:1, win10x64:1) > 0)
{
  ## Check for Seclogon.dll version
  if(version_is_less(version:sysVer, test_version:"10.0.10240.16724"))
  {
    Vulnerable_range = "Less than 10.0.10240.16724";
    VULN = TRUE ;
  }
  ##Windows 10 Version 1511
  else if(version_in_range(version:sysVer, test_version:"10.0.10586.0", test_version2:"10.0.10586.161"))
  {
    Vulnerable_range = "10.0.10586.0 - 10.0.10586.161";
    VULN = TRUE ;
  }
}

  
if(VULN)
{
  report = 'File checked:     ' + sysPath + "\System32\Seclogon.dll" + '\n' +
           'File version:     ' + sysVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);

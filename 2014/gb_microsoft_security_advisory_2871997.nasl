###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_microsoft_security_advisory_2871997.nasl 5347 2017-02-19 09:15:55Z cfi $
#
# Update to Improve Credentials Protection and Management (2871997)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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

SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.804453";

if(description)
{
  script_oid(SCRIPT_OID);
  script_version("$Revision: 5347 $");
  script_cve_id("CVE-2014-0292");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-02-19 10:15:55 +0100 (Sun, 19 Feb 2017) $");
  script_tag(name:"creation_date", value:"2014-05-15 13:07:18 +0530 (Thu, 15 May 2014)");
  script_name("Update to Improve Credentials Protection and Management (2871997)");

  tag_summary =
"This host is missing a critical security update according to Microsoft
security advisory 2871997";

  tag_vuldetect =
"Get the vulnerable file version and check appropriate patch is applied
or not.";

  tag_insight =
"This improves credential protection and domain authentication controls
to reduce credential theft";

  tag_impact =
"Successful exploitation will allow attackers to bypass the security
restrictions.

Impact Level: System/Application";

  tag_affected =
"Microsoft Windows Server 2012
Microsoft Windows 8 for 32/64-bit Systems
Microsoft Windows 7 for 32/x64-bit Systems Service Pack 1
Microsoft Windows Server 2008 R2 for x64-based Systems Service Pack 1";

  tag_solution =
"Run Windows Update and update the listed hotfixes or download and
update mentioned hotfixes in the advisory from the below link,
https://technet.microsoft.com/en-us/library/security/2871997.aspx";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);

  script_xref(name : "URL" , value : "https://support.microsoft.com/kb/2871997");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/en-us/library/security/2871997.aspx");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"executable_version");
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Windows");
  script_dependencies("secpod_reg_enum.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");

  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Variables Initialization
sysPath = "";
ieVer   = "";
dllVer  = NULL;

## Check for OS and Service Pack
if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2, win8:1, win8x64:1, win2012:1) <= 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

## Get Version from Mshtml.dll
dllVer = fetch_file_version(sysPath, file_name:"system32\Lsass.exe");
if(!dllVer){
  exit(0);
}

## Windows 7 and Windows Server 2008 R2
if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
{
  ## Check for Lsass.exe version
  if(version_is_less(version:dllVer, test_version:"6.1.7601.18443") ||
     version_in_range(version:dllVer, test_version:"6.1.7601.22000", test_version2:"6.1.7601.22652")){
    security_message(0);
  }
  exit(0);
}

## Windows 8
if(hotfix_check_sp(win8:1, win2012:1) > 0)
{
  ## Check for Lsass.exe version
  if(version_is_less(version:dllVer, test_version:"6.2.9200.16864") ||
     version_in_range(version:dllVer, test_version:"6.2.9200.20000", test_version2:"6.2.9200.20520")){
    security_message(0);
  }
  exit(0);
}

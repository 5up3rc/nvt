###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_monthly_rollup_kb4015549.nasl 5945 2017-04-12 15:37:08Z antu123 $
#
# Microsoft Windows Monthly Rollup (KB4015549)
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
  script_oid("1.3.6.1.4.1.25623.1.0.810851");
  script_version("$Revision: 5945 $");
  script_cve_id("CVE-2013-6629", "CVE-2017-0058", "CVE-2017-0155", "CVE-2017-0156",
		"CVE-2017-0158", "CVE-2017-0163", "CVE-2017-0166", "CVE-2017-0168",
		"CVE-2017-0180", "CVE-2017-0182", "CVE-2017-0183", "CVE-2017-0184",
	 	"CVE-2017-0191", "CVE-2017-0192", "CVE-2017-0199", "CVE-2017-0202",
		"CVE-2017-0210");
  script_bugtraq_id(63676, 97462, 97471, 97507, 97455, 97465, 97446, 97418, 97444, 
                    97427, 97428, 97435, 97466, 97452, 97498, 97441, 97512);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-04-12 17:37:08 +0200 (Wed, 12 Apr 2017) $");
  script_tag(name:"creation_date", value:"2017-04-12 12:43:38 +0530 (Wed, 12 Apr 2017)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Windows Monthly Rollup (KB4015549)");

  script_tag(name: "summary" , value:"This host is missing a monthly rollup according
  to Microsoft security update KB4015549.");

  script_tag(name: "vuldetect" , value:"Get the vulnerable file version and check
  appropriate patch is applied or not.");

  script_tag(name: "insight" , value:"This security update includes improvements and
  resolves the following security vulnerabilities in Windows: scripting engine,
  Hyper-V, libjpeg image-processing library, Adobe Type Manager Font Driver, Win32K,
  Microsoft Outlook, Internet Explorer, Graphics Component, Windows kernel-mode
  drivers and Lightweight Directory Access Protocol.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to execute code or elevate user privileges, take control of the affected system, 
  and access information from one domain and inject it into another domain.

  Impact Level: System");

  script_tag(name:"affected", value:"
  Windows 7 for 32-bit/x64 Systems Service Pack 1
  Windows Server 2008 R2 for x64-based Systems Service Pack 1");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://support.microsoft.com/en-us/help/4015549");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/help/4015549");
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
gdiVer = "";

## Check for OS and Service Pack
if(hotfix_check_sp( win7:2, win7x64:2, win2008r2:2 ) <= 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_system32root();
if(!sysPath ){
  exit(0);
}

##Fetch the version of 'Ole32.dll'
gdiVer = fetch_file_version(sysPath, file_name:"Ole32.dll");
if(!gdiVer){
  exit(0);
}

#Windows 7 and Windows 2008 R2
if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
{
  ## Check for Ole32.dll version
  if(version_is_less(version:gdiVer, test_version:"6.1.7601.23714"))
  {
    report = 'File checked:     ' + sysPath + "\Ole32.dll" + '\n' +
             'File version:     ' + gdiVer  + '\n' +
             'Vulnerable range:  Less than 6.1.7601.23714\n' ;
    security_message(data:report);
    exit(0);
  }
}
exit(0);
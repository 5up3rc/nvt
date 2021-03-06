###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms13-077.nasl 5346 2017-02-19 08:43:11Z cfi $
#
# MS Windows Service Control Manager Privilege Elevation Vulnerability (2872339)
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

if(description)
{
  script_id(902993);
  script_version("$Revision: 5346 $");
  script_cve_id("CVE-2013-3862");
  script_bugtraq_id(62182);
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-02-19 09:43:11 +0100 (Sun, 19 Feb 2017) $");
  script_tag(name:"creation_date", value:"2013-09-11 08:13:01 +0530 (Wed, 11 Sep 2013)");
  script_name("MS Windows Service Control Manager Privilege Elevation Vulnerability (2872339)");

  tag_summary =
"This host is missing an important security update according to
Microsoft Bulletin MS13-077.";

  tag_vuldetect =
"Get the vulnerable file version and check appropriate patch is applied
or not.";

  tag_insight =
"The flaw is due to a double-free error in the Service Control Manager
(services.exe) when handling service descriptions from the registry.";

  tag_impact =
"Successful exploitation will allow remote attackers to execute arbitrary
code with kernel-mode privileges within the context of the Service Control
Manager and or corrupt memory.

Impact Level: System ";

  tag_affected =
"Microsoft Windows 7 x32/x64 Edition Service Pack 1 and prior
Microsoft Windows Server 2008 R2 x64 Edition Service Pack 1 and prior";

  tag_solution =
"Run Windows Update and update the listed hotfixes or download and update
mentioned hotfixes in the advisory from the below link,
https://technet.microsoft.com/en-us/security/bulletin/ms13-077";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/54745");
  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/2872339");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/en-us/security/bulletin/ms13-077");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");

  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Variables Initialization
sysPath = "";
exeVer = "";

## Check for OS and Service Pack
if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) <= 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

## Get Version from Kernel32.dll file
exeVer = fetch_file_version(sysPath, file_name:"system32\Kernel32.dll");
if(!exeVer){
  exit(0);
}

## Windows 7 and Windows Server 2008 R2
if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
{
  ## Check for Kernel32.dll version
  if(version_is_less(version:exeVer, test_version:"6.1.7601.18229") ||
     version_in_range(version:exeVer, test_version:"6.1.7601.22000", test_version2:"6.1.7601.22410")){
    security_message(0);
  }
}

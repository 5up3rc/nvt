###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_mult_vuln_kb4016871.nasl 6096 2017-05-10 15:16:10Z antu123 $
#
# Microsoft Windows Multiple Vulnerabilities (KB4016871)
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
  script_oid("1.3.6.1.4.1.25623.1.0.811108");
  script_version("$Revision: 6096 $");
  script_cve_id("CVE-2017-0064", "CVE-2017-0077", "CVE-2017-0212", "CVE-2017-0213", 
                "CVE-2017-0214", "CVE-2017-0222", "CVE-2017-0224", "CVE-2017-0226", 
                "CVE-2017-0227", "CVE-2017-0228", "CVE-2017-0229", "CVE-2017-0230", 
                "CVE-2017-0231", "CVE-2017-0233", "CVE-2017-0234", "CVE-2017-0235", 
                "CVE-2017-0236", "CVE-2017-0238", "CVE-2017-0240", "CVE-2017-0241", 
                "CVE-2017-0246", "CVE-2017-0248", "CVE-2017-0258", "CVE-2017-0259", 
                "CVE-2017-0263", "CVE-2017-0266", "CVE-2017-0267", "CVE-2017-0268", 
                "CVE-2017-0269", "CVE-2017-0270", "CVE-2017-0271", "CVE-2017-0272", 
                "CVE-2017-0273", "CVE-2017-0274", "CVE-2017-0275", "CVE-2017-0276", 
                "CVE-2017-0277", "CVE-2017-0278", "CVE-2017-0279", "CVE-2017-0280");
  script_bugtraq_id(98121, 98114, 98099, 98102, 98103, 98127, 98214, 98139, 98281,
                    98164, 98217, 98222, 98173, 98179, 98229, 98230, 98234, 98237,
                    98203, 98208, 98108, 98117, 98112, 98113, 98258, 98276, 98259,
                    98261, 98263, 98264, 98265, 98260, 98274, 98266, 98267, 98268,
                    98270, 98271, 98272, 98273);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-05-10 17:16:10 +0200 (Wed, 10 May 2017) $");
  script_tag(name:"creation_date", value:"2017-05-10 08:52:53 +0530 (Wed, 10 May 2017)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Windows Multiple Vulnerabilities (KB4016871)");

  script_tag(name: "summary" , value:"This host is missing a critical security
  update according to Microsoft Security update KB4016871.");

  script_tag(name: "vuldetect" , value:"Get the vulnerable file version and check
  appropriate patch is applied or not.");

  script_tag(name: "insight" , value:"This monthly rollup,
  - Addressed issue with Surface Hub devices waking from sleep approximately
    every four minutes after the first two hours. 
  - Addressed issue where autochk.exe can randomly skip drive checks and not fix
    corruptions, which may lead to data loss.
  - Addressed an issue where Microsoft Edge users in networking environments that
    do not fully support the TCP Fast Open standard may have problems connecting
    to some websites. Users can re-enable TCP Fast Open in about:flags.  
  - Addressed issues with Arc Touch mouse Bluetooth connectivity.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to obtain information to further compromise the user's system, execute
  arbitrary code in the context of the current user, gain the same user rights as
  the current user, could take control of an affected system, cause a host
  machine to crash, spoof content and bypass security restrictions.

  Impact Level: System");

  script_tag(name:"affected", value:"
  Microsoft Windows 10 Version 1703 x32/x64");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://support.microsoft.com/en-gb/help/4016871");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://support.microsoft.com/en-gb/help/4016871");

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
edgeVer = "";

## check for OS and Service Pack
if(hotfix_check_sp(win10:1, win10x64:1) <= 0){
  exit(0);
}

sysPath = smb_get_system32root();
if(!sysPath ){
  exit(0);
}

## Fetch the version of 'Edgehtml.dll'
edgeVer = fetch_file_version(sysPath, file_name:"Edgehtml.dll");
if(!edgeVer){
  exit(0);
}

## Check for Edgehtml.dll version
## Windows 10 Version 1703
if(version_in_range(version:edgeVer, test_version:"11.0.15063.0", test_version2:"11.0.15063.295"))
{
  report = 'File checked:     ' + sysPath + "\Edgehtml.dll" + '\n' +
           'File version:     ' + edgeVer  + '\n' +
           'Vulnerable range: 11.0.15063.0 - 11.0.15063.295\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);

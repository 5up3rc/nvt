###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms07-053.nasl 5362 2017-02-20 12:46:39Z cfi $
#
# Vulnerability in Windows Services for UNIX Could Allow Elevation of Privilege (939778)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation allows remote attackers to execute arbitrary code with
  escalated privileges by running a specially crafted setuid binary.
  Impact Level: System/Application";
tag_affected = "Microsoft Windows XP Service Pack 2 and prior.
  Microsoft Windows 2000 ervice Pack 4 and prior.
  Microsoft Windows 2K3 Service Pack 2 and prior.
  Microsoft Windows Vista";
tag_insight = "The flaw is due to an unspecified error in Windows Services for UNIX
  and the Subsystem for UNIX-based Applications component when handling connection
  credentials for setuid binaries.";
tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://www.microsoft.com/technet/security/bulletin/ms07-053.mspx";
tag_summary = "This host is missing a critical security update according to
  Microsoft Bulletin MS07-053.";

if(description)
{
  script_id(801723);
  script_version("$Revision: 5362 $");
  script_tag(name:"last_modification", value:"$Date: 2017-02-20 13:46:39 +0100 (Mon, 20 Feb 2017) $");
  script_tag(name:"creation_date", value:"2011-01-18 10:00:48 +0100 (Tue, 18 Jan 2011)");
  script_cve_id("CVE-2007-3036");
  script_bugtraq_id(25620);
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Vulnerability in Windows Services for UNIX Could Allow Elevation of Privilege (939778)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/26757");
  script_xref(name : "URL" , value : "http://securitytracker.com/alerts/2007/Sep/1018678.html");
  script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/bulletin/ms07-053.mspx");

  script_tag(name:"qod_type", value:"executable_version");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");

  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(win2k:5, xp:4, win2003:3, winVista:3) <= 0){
  exit(0);
}

## Hotfix check
if(hotfix_missing(name:"939778") == 0){
  exit(0);
}

## Get System32 path
sysPath = registry_get_sz(key:"SOFTWARE\Microsoft\COM3\Setup",
                          item:"Install Path");
if(sysPath)
{
  exeVer = fetch_file_version(sysPath, file_name:"posix.exe");
  if(exeVer)
  {
    # Windows 2K and Xp
    if(hotfix_check_sp(win2k:5, xp:4) > 0)
    {
      # Grep for posix.exe version 7.0 < 7.0.1701.46, 8.0 < 8.0.1969.58
      if(version_in_range(version:exeVer, test_version:"7.0", test_version2:"7.0.1701.45") ||
         version_in_range(version:exeVer, test_version:"8.0", test_version2:"8.0.1969.57")){
        security_message(0);
      }
    }
    
    ## Windows 2003
    else if(hotfix_check_sp(win2003:3) > 0)
    {
      SP = get_kb_item("SMB/Win2003/ServicePack");
      if("Service Pack 1" >< SP)
      {
        ## Grep for posix.exe version 
        if(version_in_range(version:exeVer, test_version:"7.0", test_version2:"7.0.1701.45") ||
           version_in_range(version:exeVer, test_version:"8.0", test_version2:"8.0.1969.57") ||
           version_in_range(version:exeVer, test_version:"9.0", test_version2:"9.0.3790.2982")){
          security_message(0);
        }
         exit(0);
      }
      if("Service Pack 2" >< SP)
      {
        ## Grep for posix.exe version
        if(version_in_range(version:exeVer, test_version:"7.0", test_version2:"7.0.1701.45") ||
           version_in_range(version:exeVer, test_version:"8.0", test_version2:"8.0.1969.57") ||
           version_in_range(version:exeVer, test_version:"9.0", test_version2:"9.0.3790.4124")){
          security_message(0);
        }
         exit(0);
      }
    }
  }
}

sysPath = registry_get_sz(key:"SOFTWARE\Microsoft\Windows NT\CurrentVersion",
                      item:"PathName");
if(!sysPath){
  exit(0);
}

exeVer = fetch_file_version(sysPath, file_name:"posix.exe");
if(!exeVer){
  exit(0);
}
 
## Windows Vista
if(hotfix_check_sp(winVista:3) > 0)
{
  ## Grep for posix.exe version < 6.0.6000.16543
  if(version_is_less(version:exeVer, test_version:"6.0.6000.16543")){
      security_message(0);
  }
  exit(0);
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms10-060.nasl 5361 2017-02-20 11:57:13Z cfi $
#
# Microsoft .NET Common Language Runtime Remote Code Execution Vulnerability (2265906)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Updated By: Madhuri D <dmadhuri@secpod.com> on 2010-09-11
#  - To detect file version 'mscorlib.dll' on vista, win 2008 and win 7 os
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

tag_impact = "Successful exploitation will let remote attackers to execute arbitrary
  code by tricking a user into visiting a specially crafted web page.
  Impact Level: System";
tag_affected = "Microsoft .NET Framework 3.5/SP 1
  Microsoft .NET Framework 2.0 SP1/SP2";
tag_insight = "This flaw is caused by an error in the way the Common Language Runtime (CLR)
  handles delegates to virtual methods, which could be exploited to execute
  arbitrary code by tricking a user into visiting a malicious web page
  containing a specially crafted XBAP (XAML browser application).";
tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://technet.microsoft.com/en-us/security/bulletin/MS10-060";
tag_summary = "This host is missing a critical security update according to
  Microsoft Bulletin MS10-060.";

if(description)
{
  script_id(902230);
  script_version("$Revision: 5361 $");
  script_tag(name:"last_modification", value:"$Date: 2017-02-20 12:57:13 +0100 (Mon, 20 Feb 2017) $");
  script_tag(name:"creation_date", value:"2010-08-11 15:08:29 +0200 (Wed, 11 Aug 2010)");
  script_cve_id("CVE-2010-1898", "CVE-2010-0019");
  script_bugtraq_id(42138, 42295);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Microsoft .NET Common Language Runtime Remote Code Execution Vulnerability (2265906)");
  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/983583/");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2010/2057");
  script_xref(name : "URL" , value : "http://technet.microsoft.com/en-us/security/bulletin/MS10-060");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");

  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(xp:4, win2003:3, winVista:3, win2008:3, win7:1) <= 0){
  exit(0);
}

# MS10-060 Hotfix check
if((hotfix_missing(name:"983583") == 0) || (hotfix_missing(name:"983589") == 0 ||
    hotfix_missing(name:"983590") == 0)){
  exit(0);
}

key = "SOFTWARE\Microsoft\ASP.NET\";
if(!registry_key_exists(key:key)){
  exit(0);
}

foreach item (registry_enum_keys(key:key))
{
  path = registry_get_sz(key:key + item, item:"Path");
  if("\Microsoft.NET\Framework" >< path)
  {
    # Get the version of mscorlib.dll
    Ver = fetch_file_version(sysPath:path, file_name:"mscorlib.dll");
    if(Ver)
    {
      ## win xp, 2K3
      if(hotfix_check_sp(xp:4, win2k:5, win2003:3) > 0)
      {
        ## Check for the version mscorlib.dll
        if(version_in_range(version:Ver, test_version:"2.0.50727.3000", test_version2:"2.0.50727.3614") ||
           version_in_range(version:Ver, test_version:"2.0.50727.4000", test_version2:"2.0.50727.4454"))
        {
          security_message(0);
          exit(0);
        }
      }

      ## Windows 2008 server, vista
      if(hotfix_check_sp(winVista:3, win2008:3) > 0)
      {
        ## Check for the version mscorlib.dll
        if(version_in_range(version:Ver, test_version:"2.0.50727.4000", test_version2:"2.0.50727.4205")||
           version_in_range(version:Ver, test_version:"2.0.50727.4400", test_version2:"2.0.50727.4453"))
        {
          security_message(0);
          exit(0);
        }
      }

      ## Windows 7
      if(hotfix_check_sp(win7:1) > 0)
      {
        ## Check for the version mscorlib.dll
        if(version_in_range(version:Ver, test_version:"2.0.50727.4000", test_version2:"2.0.50727.4951")||
           version_in_range(version:Ver, test_version:"2.0.50727.5000", test_version2:"2.0.50727.5017"))
        {
          security_message(0);
          exit(0);
        }
      }
    }
  }
}

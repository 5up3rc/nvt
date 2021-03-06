###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_excel_viewer_ms15-110.nasl 6486 2017-06-29 09:59:06Z teissa $
#
# Microsoft Windows Excel Viewer Remote Code Execution Vulnerabilities (3096440)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.806122");
  script_version("$Revision: 6486 $");
  script_cve_id("CVE-2015-2558");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-06-29 11:59:06 +0200 (Thu, 29 Jun 2017) $");
  script_tag(name:"creation_date", value:"2015-10-14 10:49:22 +0530 (Wed, 14 Oct 2015)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Windows Excel Viewer Remote Code Execution Vulnerabilities (3096440)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS15-110.");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and check
  appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Multiple flaws exists when,
  - Microsoft Excel improperly handles the loading of dynamic link library
    (DLL) files.
  - Error when memory is released in an unintended manner.
  - Improper handling of files in the memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow a
  context-dependent attacker to execute remote code.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"
  Microsoft Excel Viewer 2007 Service Pack 3 and prior.");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory from the
  below link, https://technet.microsoft.com/en-us/library/security/MS15-110");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3096440");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3085619");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/en-us/library/security/MS15-110");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/XLView/Version");
  exit(0);
}


include("smb_nt.inc");
include("version_func.inc");

# Variable Initialization
excelviewVer = "";

## Microsoft Office Excel Viewer 2007
excelviewVer = get_kb_item("SMB/Office/XLView/Version");
if(excelviewVer =~ "^12\..*")
{
  ## check for Xlview.exe  version
  if(version_in_range(version:excelviewVer, test_version:"12.0", test_version2:"12.0.6732.4999"))
  {
    report = 'File checked:  Xlview.exe' + '\n' +
             'File version:     ' + excelviewVer  + '\n' +
             'Vulnerable range: 12 - 12.0.6732.4999' +  '\n' ;
    security_message(data:report);
    exit(0);
  }
}

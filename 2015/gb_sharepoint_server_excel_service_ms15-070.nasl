###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_sharepoint_server_excel_service_ms15-070.nasl 50747 2015-07-15 09:12:23Z July$
#
# MS SharePoint Server Excel Services Multiple Vulnerabilities (3072620)
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
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

CPE = "cpe:/a:microsoft:sharepoint_server";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805808");
  script_version("$Revision: 6141 $");
  script_cve_id("CVE-2015-2376", "CVE-2015-2375");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-05-17 11:03:37 +0200 (Wed, 17 May 2017) $");
  script_tag(name:"creation_date", value:"2015-07-15 09:18:13 +0530 (Wed, 15 Jul 2015)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("MS SharePoint Server Excel Services Multiple Vulnerabilities (3072620)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS15-070.");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and check
  appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Multiple flaws are due to,
  - Error when memory is released in an unintended manner.
  - Improper handling of files in the memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow a
  context-dependent attacker to bypass ASLR security mechanism and
  Corrupt memory.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"
  Microsoft SharePoint Server 2007 Service Pack 3 Excel Services,
  Microsoft SharePoint Server 2010 Service Pack 2 Excel Services,
  Microsoft SharePoint Server 2013 Service Pack 1 Excel Services.");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory from the
  below link, https://technet.microsoft.com/en-us/library/security/MS15-070");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/2837612");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3054968");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3054861");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/en-us/library/security/MS15-070");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("gb_ms_sharepoint_sever_n_foundation_detect.nasl");
  script_mandatory_keys("MS/SharePoint/Server/Ver");
  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Variable Initialization
shareVer = "";
dllVer = "";
path = "";

if( ! infos = get_app_version_and_location( cpe:CPE ) ) exit( 0 );

## Get SharePoint Version
shareVer = infos['version'];
if(!shareVer){
  exit(0);
}

path = infos['location'];
if(!path || "Could not find the install location" >< path){
  exit(0);
}

## SharePoint Server 2007
if(shareVer =~ "^12\..*")
{
  path = path + "\12.0\Bin";

  dllVer = fetch_file_version(sysPath:path, file_name:"xlsrv.dll");
  if(dllVer)
  {
    if(version_in_range(version:dllVer, test_version:"12.0", test_version2:"12.0.6723.4999"))
    {
      security_message(0);
      exit(0);
    }
  }
}

## SharePoint Server 2010
if(shareVer =~ "^14\..*")
{
  path = path + "\14.0\Bin";

  dllVer = fetch_file_version(sysPath:path, file_name:"xlsrv.dll");
  if(dllVer)
  {
    if(version_in_range(version:dllVer, test_version:"14.0", test_version2:"14.0.7153.4999"))
    {
      security_message(0);
      exit(0);
    }
  }
}

## SharePoint Server 2013
if(shareVer =~ "^15\..*")
{
  path = path + "\15.0\Bin";

  dllVer = fetch_file_version(sysPath:path, file_name:"xlsrv.dll");
  if(dllVer)
  {
    if(version_in_range(version:dllVer, test_version:"15.0", test_version2:"15.0.4737.999"))
    {
      security_message(0);
      exit(0);
    }
  }
}

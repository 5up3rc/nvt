###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_live_meeting_ms15-080.nasl 6357 2017-06-16 10:00:29Z teissa $
#
# Microsoft Live Meeting Remote Code Execution Vulnerabilities (3078662)
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

CPE = "cpe:/a:microsoft:office_live_meeting";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805084");
  script_version("$Revision: 6357 $");
  script_cve_id("CVE-2015-2431", "CVE-2015-2435", "CVE-2015-2455", "CVE-2015-2456",
                "CVE-2015-2463", "CVE-2015-2464");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-06-16 12:00:29 +0200 (Fri, 16 Jun 2017) $");
  script_tag(name:"creation_date", value:"2015-08-12 12:58:42 +0530 (Wed, 12 Aug 2015)");
  script_name("Microsoft Live Meeting Remote Code Execution Vulnerabilities (3078662)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft Bulletin MS15-080.");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"The flaw exists due to improper handling of
  TrueType fonts.");

  script_tag(name:"impact", value:"Successful exploitation will allow a
  remote attacker to execute arbitrary code on the affected system.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Microsoft Live Meeting 2007 Console");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://technet.microsoft.com/library/security/MS15-080");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3075591");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/library/security/MS15-044");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("gb_ms_live_meeting_detect.nasl");
  script_mandatory_keys("MS/OfficeLiveMeeting/Ver");
  exit(0);
}


include("smb_nt.inc");
include("version_func.inc");
include("host_details.inc");
include("secpod_smb_func.inc");

## Variables Initialization
appPath = "";
dllVer = "";

## get the Install Location
appPath = get_app_location(cpe:CPE);
if(!appPath ||  "Couldn find the install location" >< appPath){
  exit(0);
}

## Get Version from Ogl.dll
dllVer = fetch_file_version(sysPath:appPath, file_name:"Ogl.dll");
if(!dllVer){
  exit(0);
}

## Check for Ogl.dll version
## Need to cover MS15-080: Description of the security update for
## Live Meeting Conferencing Add-in: August 11, 2015
if(version_is_less(version:dllVer, test_version:"12.0.6725.5000"))
{
  security_message(0);
  exit(0);
}

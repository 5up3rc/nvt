###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_lync_attendee_ms16-097.nasl 5580 2017-03-15 10:00:34Z teissa $
#
# Microsoft Lync Attendee Multiple Remote Code Execution Vulnerabilities (3177393)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.807876");
  script_version("$Revision: 5580 $");
  script_cve_id("CVE-2016-3301", "CVE-2016-3303", "CVE-2016-3304");
  script_bugtraq_id(92288, 92301, 92302);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-03-15 11:00:34 +0100 (Wed, 15 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-08-10 16:44:44 +0530 (Wed, 10 Aug 2016)");
  script_name("Microsoft Lync Attendee Multiple Remote Code Execution Vulnerabilities (3177393)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft Bulletin MS16-097.");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Multiple flaws exists due to the windows font
  library which improperly handles specially crafted embedded fonts.");

  script_tag(name:"impact", value:"Successful exploitation will allow an
  attacker to execute arbitrary code on the affected system.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Microsoft Lync Attendee 2010");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://technet.microsoft.com/library/security/MS16-097");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3174304");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3174302");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/library/security/MS16-097");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_ms_lync_detect_win.nasl");
  script_mandatory_keys("MS/Lync/Attendee/Ver", "MS/Lync/Attendee/path");
  exit(0);
}

include("smb_nt.inc");
include("secpod_reg.inc");
include("secpod_smb_func.inc");
include("version_func.inc");

## Variables Initialization
lyncPath = "";
dllVer = "";

## For Microsoft Lync 2010 Attendee (admin level install)
## For Microsoft Lync 2010 Attendee (user level install)

## Get Installed Path
lyncPath = get_kb_item("MS/Lync/Attendee/path");
if(lyncPath)
{
  ## Get Version from Rtmpltfm.dll
  dllVer = fetch_file_version(sysPath:lyncPath, file_name:"Rtmpltfm.dll");
  if(dllVer)
  {
    if(version_in_range(version:dllVer, test_version:"4.0", test_version2:"4.0.7577.4509"))
    {

      report = 'File checked:     ' + lyncPath + "Rtmpltfm.dll" + '\n' +
               'File version:     ' + dllVer  + '\n' +
               'Vulnerable range: 4.0 - 4.0.7577.4509' + '\n' ;
      security_message(data:report);
      exit(0);
    }
  }
}

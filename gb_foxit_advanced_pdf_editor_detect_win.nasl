###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_foxit_advanced_pdf_editor_detect_win.nasl 7000 2017-08-24 11:51:46Z teissa $
#
# Foxit Advanced PDF Editor Version Detection (Windows)
#
# Authors:
# Arun Kallavi <karun@secpod.com>
#
# Updated By: Shakeel <bshakeel@secpod.com> on 2014-06-03
# According to CR57 and to support 32 and 64 bit.
#
# Copyright:
# Copyright (C) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.803303");
  script_version("$Revision: 7000 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-08-24 13:51:46 +0200 (Thu, 24 Aug 2017) $");
  script_tag(name:"creation_date", value:"2013-02-01 18:35:32 +0530 (Fri, 01 Feb 2013)");
  script_tag(name:"qod_type", value:"registry");
  script_name("Foxit Advanced PDF Editor Version Detection (Windows)");

  tag_summary =
"Detection of installed version of Foxit Advanced PDF Editor.

The script logs in via smb, searches for Foxit Advanced PDF Editor in the
registry and gets the version from registry";


  script_tag(name : "summary" , value : tag_summary);

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("secpod_reg_enum.nasl", "smb_reg_service_pack.nasl");
  script_mandatory_keys("SMB/WindowsVersion", "SMB/Windows/Arch");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("cpe.inc");
include("host_details.inc");
include("secpod_smb_func.inc");

# Variable Initialization
os_arch = "";
key_list = "";
key = "";
FoxitName = "";
FoxitPath = "";
FoxitVer = "";
cpe = "";

## Get OS Architecture
os_arch = get_kb_item("SMB/Windows/Arch");
if(!os_arch){
  exit(-1);
}

## Check for 32 bit platform
if("x86" >< os_arch){
  key_list = make_list("SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\");
}

## Check for 64 bit platform, Currently only 32-bit application is available
else if("x64" >< os_arch)
{
  key_list =  make_list("SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\");
}

if(isnull(key_list)){
  exit(0);
}

## Confirm Application
if(!registry_key_exists(key:"SOFTWARE\Foxit Software")){
  if(!registry_key_exists(key:"SOFTWARE\Wow6432Node\Foxit Software")){
    exit(0);
  }
}

foreach key (key_list)
{
  foreach item (registry_enum_keys(key:key))
  {
    # Check for the Name
    FoxitName = registry_get_sz(key:key + item, item:"DisplayName");
    if("Foxit Advanced PDF Editor" >< FoxitName)
    {
      # Check for the install path
      FoxitPath =registry_get_sz(key:key + item , item:"InstallLocation");
      if(!FoxitPath){
        FoxitPath = "Could not find the install Location";
      }

      # Check for the version
      FoxitVer = registry_get_sz(key:key + item , item:"DisplayVersion");

      if(FoxitVer)
      {
        set_kb_item(name:"Foxit/AdvancedEditor/Win/Ver", value:FoxitVer);

        # build cpe
        cpe = build_cpe(value:FoxitVer, exp:"^([0-9.]+)",
                      base:"cpe:/a:foxitsoftware:foxit_advanced_pdf_editor:");
        if(isnull(cpe))
          cpe = "cpe:/a:foxitsoftware:foxit_advanced_pdf_editor";

        register_product(cpe:cpe, location:FoxitPath);
        log_message(data: build_detection_report(app:"Foxit AdvancedPDF Editor",
                                                 version:FoxitVer,
                                                 install:FoxitPath,
                                                 cpe:cpe,
                                                 concluded: FoxitVer));
      }
    }
  }
}

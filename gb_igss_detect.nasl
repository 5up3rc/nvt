###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_igss_detect.nasl 5877 2017-04-06 09:01:48Z teissa $
#
# 7-Technologies Interactive Graphical SCADA System Version Detection
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Updated By: Shakeel <bshakeel@secpod.com> on 2014-06-17
# According to CR57 and to support 32 and 64 bit.
#
# Copyright:
# Copyright (C) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.802240");
  script_version("$Revision: 5877 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-04-06 11:01:48 +0200 (Thu, 06 Apr 2017) $");
  script_tag(name:"creation_date", value:"2011-08-18 14:57:45 +0200 (Thu, 18 Aug 2011)");
  script_tag(name:"qod_type", value:"registry");
  script_name("7-Technologies Interactive Graphical SCADA System Version Detection");

  tag_summary =
"This script finds the installed Interactive Graphical SCADA System version and
saves the result in KB.

The script logs in via smb, searches for 'IGSS32' String in the registry and
gets the version from registry";


  script_tag(name : "summary" , value : tag_summary);

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("secpod_reg_enum.nasl", "smb_reg_service_pack.nasl");
  script_mandatory_keys("SMB/WindowsVersion", "SMB/Windows/Arch");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("secpod_smb_func.inc");
include("cpe.inc");
include("host_details.inc");


# Variable Initialization
os_arch = "";
key_list = "";
key = "";
igssname = "";
igssversion = "";
cpe = "";
igssPath = "";

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


## Confirm Interactive Graphical SCADA System is installed
if(!registry_key_exists(key:"SOFTWARE\7-Technologies\IGSS32")){
  if(!registry_key_exists(key:"SOFTWARE\Wow6432Node\7-Technologies\IGSS32")){
    exit(0);
  }
}

## Get Version From Registry
foreach key (key_list)
{
  foreach item (registry_enum_keys(key:key))
  {
    igssname = registry_get_sz(key:key + item, item:"DisplayName");
    if("IGSS32" >< igssname)
    {
      igssversion = registry_get_sz(key:key + item, item:"DisplayVersion");
      #Try to get install Path
      igssPath = registry_get_sz(key:key + item, item:"InstallLocation");
      if(!igssPath)
        igssPath = "Couldn find the install location from registry.";

      if(igssversion)
      {
        ## Set Interactive Graphical SCADA System Version in KB
        set_kb_item(name:"IGSS/Win/Ver", value:igssversion);

        ## build cpe and store it as host_detail
        cpe = build_cpe(value:igssversion, exp:"^([0-9.]+)", base:"cpe:/a:7t:igss:");
        if(isnull(cpe))
          cpe = "cpe:/a:7t:igss";
        register_product(cpe:cpe, location:igssPath);
        log_message(data: build_detection_report(app:"Interactive Graphical SCADA System",
                                                 version:igssversion,
                                                 install:igssPath,
                                                 cpe:cpe,
                                                 concluded: igssversion));
       }
    }
  }
}

##############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_powerzip_detect.nasl 7000 2017-08-24 11:51:46Z teissa $
#
# PowerZip Version Detection
#
# Authors:
# Sujit Ghosal <sghosal@secpod.com>
#
# Updated By: Shakeel <bshakeel@secpod.com> on 2014-07-08
# According to CR57 and to support 32 and 64 bit.
#
# Copyright:
# Copyright (C) 2009 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.900490");
  script_version("$Revision: 7000 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-08-24 13:51:46 +0200 (Thu, 24 Aug 2017) $");
  script_tag(name:"creation_date", value:"2009-03-31 07:06:59 +0200 (Tue, 31 Mar 2009)");
  script_tag(name:"qod_type", value:"registry");
  script_name("PowerZip Version Detection");

  tag_summary =
"This script finds the installed version of PowerZip and saves the version
in KB.

The script logs in via smb, searches for PowerZip in the registry and gets the
path and version from registry.";


  script_tag(name : "summary" , value : tag_summary);

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
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

## Variable Initialization
os_arch = "";
key_list = "";
key="";
zipName="";
zipPath="";
zipVer="";

## Get OS Architecture
os_arch = get_kb_item("SMB/Windows/Arch");
if(!os_arch){
  exit(-1);
}

## Check for 32 bit platform
if("x86" >< os_arch){
  key_list = make_list("SOFTWARE\Trident Software\PowerZip\");
}

## Check for 64 bit platform, Currently only 32-bit application is available
else if("x64" >< os_arch){
  key_list =  make_list("SOFTWARE\Wow6432Node\Trident Software\PowerZip\");
}

if(isnull(key_list)){
  exit(0);
}

## Confirm Application
if(!registry_key_exists(key:"SOFTWARE\Trident Software\PowerZip\")){
  if(!registry_key_exists(key:"SOFTWARE\Wow6432Node\Trident Software\PowerZip\")){
    exit(0);
  }
}

foreach key (key_list)
{
  zipName = registry_get_sz(key:key, item:"Name");
  if("PowerZip" >< zipName)
  {
    zipVer = registry_get_sz(key:key, item:"Version");
    zipPath = registry_get_sz(key:key, item:"Path");
    if(!zipPath){
      zipPath = "Could not determine Install Location";
    }
    if(!zipVer)
    {
      if("Wow6432Node" >< key){
        unKey = "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\";
      } else {
        unKey = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\";
      }

      foreach item (registry_enum_keys(key:unKey))
      {
        zipName = registry_get_sz(key:unKey + item, item:"DisplayName");
        if("PowerZip" >< zipName)
        {
          zipVer = registry_get_sz(key:unKey + item, item:"DisplayVersion");
          zipPath = registry_get_sz(key:unKey + item, item:"InstallLocation");
        }
      }
    }
    if(zipVer != NULL)
    {
      set_kb_item(name:"PowerZip/Ver", value:zipVer);

      ## build cpe and store it as host_detail
      cpe = build_cpe(value:zipVer, exp:"^([0-9.]+)", base:"cpe:/a:powerzip:powerzip:");
      if(isnull(cpe))
        cpe = "cpe:/a:powerzip:powerzip";

      ## Register Product and Build Report
      build_report(app: "Powerzip", ver:zipVer , cpe:cpe, insloc:zipPath);

    }
  }
}

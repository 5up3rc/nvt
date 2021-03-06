###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_putty_version.nasl 5301 2017-02-15 09:16:50Z antu123 $
#
# PuTTY Version Detection
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Updated By Rinu Kuriakose <krinu@secpod.com> on 13-02-2017
# For detecting newer versions of putty
#
# Copyright:
# Copyright (c) 2009 SecPod, http://www.secpod.com
#
# Updated By: Thanga Prakash S <tprakash@secpod.com> on 2014-07-08
# Updated to support 32 and 64 bit
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
################################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900618");
  script_version("$Revision: 5301 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-02-15 10:16:50 +0100 (Wed, 15 Feb 2017) $");
  script_tag(name:"creation_date", value:"2009-06-02 12:54:52 +0200 (Tue, 02 Jun 2009)");
  script_tag(name:"qod_type", value:"registry");
  script_name("PuTTY Version Detection");
  script_tag(name: "summary" , value:"Detection of installed version of PuTTY.

  The script logs in via smb, searches for PuTTy in the registry, gets
  version from the 'DisplayName' string and set it in the KB item.");
  
  script_category(ACT_GATHER_INFO);
  script_family("Product detection");
  script_copyright("Copyright (C) 2009 SecPod.");
  script_dependencies("secpod_reg_enum.nasl", "smb_reg_service_pack.nasl");
  script_mandatory_keys("SMB/WindowsVersion", "SMB/Windows/Arch");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("version_func.inc");
include("secpod_smb_func.inc");
include("cpe.inc");
include("host_details.inc");

## Variable Initialization
appName = "";
insloc = "";
appVer = "";

## Get OS Architecture
os_arch = get_kb_item("SMB/Windows/Arch");
if(!os_arch){
  exit(-1);
}

## Check for 32 bit platform
if("x86" >< os_arch){
  key_list = make_list("SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\PuTTY_is1",
                       "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\");
}

## Presently 64bit application is not available
## Check for 32 bit App on 64 bit platform
else if("x64" >< os_arch){
  key_list = make_list("SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\PuTTY_is1",
                       "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\");
}

foreach key (key_list)
{
  foreach item (registry_enum_keys(key:key))
  {
    appName = registry_get_sz(key:key + item, item:"DisplayName");

    ## Confirm application
    if("PuTTY" >< appName)
    {
      insloc = registry_get_sz(key:key,item:"InstallLocation");
      if(!insloc){
        insloc = "Could not find the install location from registry";
      }

      appVer = eregmatch(pattern:"[0-9.]+", string:appName);
      if(appVer[0]){
         appVer = appVer[0];
      }
      else{
        appVer = registry_get_sz(key:key + item, item:"DisplayVersion");
      }
      if(appVer)
      {
        set_kb_item(name:"PuTTY/Version", value:appVer[0]);

        ## build cpe and store it as host_detail
        cpe = build_cpe(value:appVer, exp:"^([0-9.]+)", base:"cpe:/a:putty:putty:");
        if(isnull(cpe))
          cpe = "cpe:/a:putty:putty";

        register_product(cpe:cpe, location:insloc);

        log_message(data: build_detection_report(app: "PuTTY",
                                                 version: appVer,
                                                 install: insloc,
                                                 cpe: cpe,
                                                 concluded: appVer));
      }
    }
  }
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_windows_messenger_detect.nasl 6032 2017-04-26 09:02:50Z teissa $
#
# Microsoft MSN Messenger Service Version Detection
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Updated By: Shakeel <bshakeel@secpod.com> on 2014-07-22
# To support 32 and 64 bit.
#
# Copyright:
# Copyright (C) 2012 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.902915");
  script_version("$Revision: 6032 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-04-26 11:02:50 +0200 (Wed, 26 Apr 2017) $");
  script_tag(name:"creation_date", value:"2012-05-30 14:53:42 +0530 (Wed, 30 May 2012)");
  script_tag(name:"qod_type", value:"registry");
  script_name("Microsoft MSN Messenger Service Version Detection");

  tag_summary =
"Detection of installed version of Microsoft MSN Messenger.

The script logs in via smb, searches for Microsoft MSN Messenger in the
registry and gets the exe file path from 'InstallationDirectory' string
in registry and version from the 'msmsgs.exe'";


  script_tag(name : "summary" , value : tag_summary);

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2012 SecPod");
  script_family("Product detection");
  script_dependencies("secpod_reg_enum.nasl", "smb_reg_service_pack.nasl");
  script_mandatory_keys("SMB/WindowsVersion", "SMB/Windows/Arch");
  script_require_ports(139, 445);
  exit(0);
}


include("cpe.inc");
include("smb_nt.inc");
include("version_func.inc");
include("host_details.inc");
include("secpod_smb_func.inc");

## Variable Initialization
os_arch = "";
key_list = "";
key = "";
path = "";
cpe = NULL;
msnVer = "";
msgKey = "";
apName = "";

## Get OS Architecture
os_arch = get_kb_item("SMB/Windows/Arch");
if(!os_arch){
  exit(-1);
}

## Confirm application is installed
if(!registry_key_exists(key:"SOFTWARE\Microsoft\MessengerService")){
  if(!registry_key_exists(key:"SOFTWARE\Wow6432Node\Microsoft\MessengerService")){
    exit(0);
  }
}

## Check for 32 bit platform
if("x86" >< os_arch){
  key_list = make_list("SOFTWARE\Microsoft\MessengerService\");
}

## Check for 64 bit platform, only 32-bit app is available
else if("x64" >< os_arch){
  key_list =  make_list("SOFTWARE\Wow6432Node\Microsoft\SOFTWARE\Microsoft\MessengerService\");
}

if(isnull(key_list)){
  exit(0);
}

foreach key (key_list)
{
  path = registry_get_sz(key:key, item:"InstallationDirectory");
  if(path){
    msnVer = fetch_file_version(sysPath:path, file_name:"msmsgs.exe");
  }
  else
  {
    if("Wow6432Node" >!< key){
      msgKey = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\";
    }else{
      msgKey = "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\";
    }

    ##Iterate
    foreach item (registry_enum_keys(key:msgKey))
    {
      ## Check for the Application
      apName = registry_get_sz(key:msgKey + item, item:"DisplayName");
      if("MSN Messenger" >< apName)
      {
        msnVer = registry_get_sz(key:msgKey + item, item: "DisplayVersion");
        path = "Unable to get install Path";
      }
    }
  }

  if(msnVer)
  {
    ## Set the KB item
    set_kb_item(name:"Microsoft/MSN/Messenger/Ver", value:msnVer);
    cpe = build_cpe(value:msnVer, exp:"^([0-9.]+)", base:"cpe:/a:microsoft:msn_messenger:");

    if(isnull(cpe))
      cpe = "cpe:/a:microsoft:msn_messenger";

    ## Register Product and Build Report
    build_report(app:"Microsoft MSN Messenger Service", ver:msnVer, cpe:cpe, insloc:path);
    exit(0);
  }
}

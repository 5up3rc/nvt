##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_silverlight_detect.nasl 6032 2017-04-26 09:02:50Z teissa $
#
# Microsoft Silverlight Version Detection
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Updated: Veerendra GG <veerendragg@secpod.com> on 2013-08-09
# According to CR57 and New Style script_tags.
#
# Updated By: Shakeel <bshakeel@secpod.com> on 2014-07-02
# To support 32 and 64 bit.
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
  script_oid("1.3.6.1.4.1.25623.1.0.801934");
  script_version("$Revision: 6032 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-04-26 11:02:50 +0200 (Wed, 26 Apr 2017) $");
  script_tag(name:"creation_date", value:"2011-05-16 15:25:30 +0200 (Mon, 16 May 2011)");
  script_tag(name:"qod_type", value:"registry");
  script_name("Microsoft Silverlight Version Detection");

  tag_summary =
"Detection of installed version of Microsoft Silverlight on Windows.

The script logs in via smb, searches for Silverlight in the registry
and gets the version from registry.";


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
include("secpod_smb_func.inc");
include("cpe.inc");
include("host_details.inc");

## Variable Initialization
os_arch = "";
key_list = "";
key="";
cpe = "";
ins_loc = "";
msl_ver = "";

## Get OS Architecture
os_arch = get_kb_item("SMB/Windows/Arch");
if(!os_arch){
  exit(-1);
}

## Check Silverlight is present or not
if(!registry_key_exists(key:"SOFTWARE\Microsoft\Silverlight")){
  if(!registry_key_exists(key:"SOFTWARE\Wow6432Node\Microsoft\Silverlight")){
    exit(0);
  }
}

## Check for 32 bit platform
if("x86" >< os_arch){
  key_list = make_list("SOFTWARE\Microsoft\Silverlight");
}

## Check for 64 bit platform
else if("x64" >< os_arch){
  key_list =  make_list("SOFTWARE\Wow6432Node\Microsoft\Silverlight",
                        "SOFTWARE\Microsoft\Silverlight");
}

if(isnull(key_list)){
  exit(0);
}

foreach key (key_list)
{
  msl_ver = registry_get_sz(key:key, item:"Version");
  if("Wow6432Node" >< key){
    unKey = "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\";
  } else {
    unKey = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\";
  }

  foreach item (registry_enum_keys(key:unKey))
  {
    ## Get application name
    app_name = registry_get_sz(key:unKey + item, item:"DisplayName");
    if("Microsoft Silverlight" >!< app_name)
    {
       continue;
    }

    ## Get version if not available in previous path
    if(!msl_ver || msl_ver == "0"){
      msl_ver = registry_get_sz(key:unKey + item, item:"DisplayVersion");
    }

    ## Get installed location
    ins_loc = registry_get_sz(key:unKey + item, item:"InstallLocation");
    break;
  }

  ## This might be needed for older NVTs
  if(msl_ver){
    ## Set KB for Microsoft Silverlight
    set_kb_item(name:"Microsoft/Silverlight", value:msl_ver);
  }

  if(msl_ver && "Microsoft Silverlight" >< app_name)
  {
    ## build cpe and store it as host_detail
    cpe = build_cpe(value:msl_ver, exp:"^([0-9.]+)", base:"cpe:/a:microsoft:silverlight:");
    if(isnull(cpe))
      cpe = "cpe:/a:microsoft:silverlight";

    ##Register Product and Build Report
    build_report(app: "Microsoft Silverlight", ver:msl_ver, cpe:cpe, insloc:ins_loc);

    ## 64 bit apps on 64 bit platform
    if("x64" >< os_arch && "Wow6432Node" >!< key)
    {
      set_kb_item(name:"Microsoft/Silverlight64", value:msl_ver);

      cpe = build_cpe(value:msl_ver, exp:"^([0-9.]+)", base:"cpe:/a:microsoft:silverlight:x64:");
      if(isnull(cpe))
        cpe = "cpe:/a:microsoft:silverlight:x64";

      ## Register Product and Build Report
      build_report(app: "Microsoft Silverlight", ver:msl_ver, cpe:cpe, insloc:ins_loc);
    }
  }
}

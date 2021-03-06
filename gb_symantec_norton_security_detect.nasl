###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_symantec_norton_security_detect.nasl 7000 2017-08-24 11:51:46Z teissa $
#
# Symantec Norton Security Version Detection (Windows)
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.808513");
  script_version("$Revision: 7000 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-08-24 13:51:46 +0200 (Thu, 24 Aug 2017) $");
  script_tag(name:"creation_date", value:"2016-07-05 11:35:48 +0530 (Tue, 05 Jul 2016)");
  script_name("Symantec Norton Security Version Detection (Windows)");

  script_tag(name: "summary" , value: "Detection of installed version of Symantec
  Norton Security.

  The script logs in via smb, searches for string 'Norton Security' in the registry
  and reads the version information from registry.");
  script_tag(name:"qod_type", value:"registry");
  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
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
include("version_func.inc");

## variable Initialization
os_arch = "";
nortonPath = "";
nortonName = "";
nortonVer = "";
key = "";

## Get OS Architecture
os_arch = get_kb_item("SMB/Windows/Arch");
if(!os_arch){
  exit(-1);
}

## Check for 32 bit platform
if("x86" >< os_arch){
  key = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\";
}

## Check for 64 bit platform
else if("x64" >< os_arch){
  key = "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\";
}

if(isnull(key)){
  exit(0);
}

foreach item (registry_enum_keys(key:key))
{
  nortonName = registry_get_sz(key:key + item, item:"DisplayName");

  #### Confirm Application
  if("Norton Security" >< nortonName)
  {
    nortonVer = registry_get_sz(key:key + item, item:"DisplayVersion");
    nortonPath = registry_get_sz(key:key + item, item:"InstallLocation");

    if(!nortonPath){
      nortonPath = "Couldn find the install location from registry";
    }
    if(nortonVer)
    {
      set_kb_item(name:"Symantec/Norton/Security/Ver", value:nortonVer);

      ## build cpe and store it as host_detail
      cpe = build_cpe(value:nortonVer, exp:"^([0-9.]+)", base:"cpe:/a:symantec:norton_security:");
      if(isnull(cpe))
        cpe = "cpe:/a:symantec:norton_security";

    }
    ## Register Product and Build Report
    register_product(cpe:cpe, location:nortonPath);

    log_message(data: build_detection_report(app: "Norton Security",
                                             version: nortonVer,
                                             install: nortonPath,
                                             cpe: cpe,
                                             concluded: nortonVer));
    exit(0);
  }
}

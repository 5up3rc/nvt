###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_goldengate_detect.nasl 5871 2017-04-05 13:33:48Z antu123 $ 
#
# Oracle GoldenGate Version Detection
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
  script_oid("1.3.6.1.4.1.25623.1.0.807247");
  script_version("$Revision: 5871 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-04-05 15:33:48 +0200 (Wed, 05 Apr 2017) $");
  script_tag(name:"creation_date", value:"2016-02-11 17:49:15 +0530 (Thu, 11 Feb 2016)");
  script_name("Oracle GoldenGate Version Detection");

  script_tag(name : "summary" , value : "Detection of installed version of
  Oracle GoldenGate.

  The script logs in via smb, searches for Oracle GoldenGate in the registry
  and gets the version from 'DisplayName' string from registry.");

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

## variable Initialization
os_arch = "";
key_list = "";
key = "";
oraPath = "";
oraVer = "";
oraName = "";
version = "";

## Get OS Architecture
os_arch = get_kb_item("SMB/Windows/Arch");
if(!os_arch){
  exit(-1);
}

## Check for 32 bit platform
if("x86" >< os_arch){
  key_list = make_list("SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\");
}

## Check for 64 bit platform
else if("x64" >< os_arch){
  key_list =  make_list("SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\",
                        "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\");
  }

if(isnull(key_list)){
  exit(0);
}

foreach key (key_list)
{
  foreach item (registry_enum_keys(key:key))
  {
    oraName = registry_get_sz(key:key + item, item:"DisplayName");
    if("Oracle GoldenGate" >< oraName)
    {
      ##Get version
      version = eregmatch(pattern:"([0-9.]+)", string:oraName);
      if(version[0]){
        oraVer = version[0];
      }
  
      if(oraVer)
      {
        ## Get Install Path
        oraPath = registry_get_sz(key:key + item, item:"UninstallString");
        if(oraPath){
          oraPath = oraPath - "\uninstall.exe";
        }

        if(!oraPath){
          oraPath = "Unable to find the install location from registry";
        }

        set_kb_item(name:"Oracle/GoldenGate/Win/Ver", value:oraVer);

        ## Build cpe
        cpe = build_cpe(value:oraVer, exp:"([0-9.]+)", base:"cpe:/a:oracle:goldengate:");
        if(isnull(cpe))
          cpe = 'cpe:/a:oracle:goldengate';

        build_report(app:"Oracle GoldenGate", ver:oraVer, cpe:cpe, insloc:oraPath);

        ## Register for 64 bit app on 64 bit OS once again
        if("64" >< os_arch && "Wow6432Node" >!< key)
        {
          set_kb_item(name:"Oracle/GoldenGate64/Win/Ver", value:oraVer);

          ## Build CPE
          cpe = build_cpe(value:oraVer, exp:"^([0-9.]+)", base:"cpe:/a:oracle:goldengate:x64:");
          if(isnull(cpe))
            cpe = "cpe:/a:oracle:goldengate:x64";
 
          build_report(app:"Oracle GoldenGate", ver:oraVer, cpe:cpe, insloc:oraPath);
        }
        exit(0);
      }
    }
  }
}

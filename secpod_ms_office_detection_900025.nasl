###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms_office_detection_900025.nasl 7153 2017-09-15 15:03:32Z cfischer $
#
# Microsoft Office Version Detection
#
# Authors:
# Chandan S <schandan@secpod.com>
#
# Regex pattern modified to match proper Office 2007.
#  - By Chandan S <schandan@secpod.com> On 2009-11-11 #5697
#
# Updated By: Thanga Prakash S <tprakash@secpod.com> on 2014-07-15
# Updated to support 32 and 64 bit.
#
# Copyright:
# Copyright (c) 2008 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.900025");
  script_version("$Revision: 7153 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-09-15 17:03:32 +0200 (Fri, 15 Sep 2017) $");
  script_tag(name:"creation_date", value:"2008-08-19 14:38:55 +0200 (Tue, 19 Aug 2008)");
  script_tag(name:"qod_type", value:"registry");
  script_name("Microsoft Office Version Detection");

  script_tag(name : "summary" , value : "Detection of installed version of Microsoft Office.

  The script logs in via smb, searches for Microsoft Office in the registry, gets
  version from the 'DisplayVersion' string and set it in the KB item.");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2008 SecPod");
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
TMP_OFFICE_LIST = make_list( "^(9\..*)",  "cpe:/a:microsoft:office:2000:",
                             "^(10\..*)", "cpe:/a:microsoft:office:2002:",
                             "^(11\..*)", "cpe:/a:microsoft:office:2003:",
                             "^(12\..*)", "cpe:/a:microsoft:office:2007:",
                             "^(14\..*)", "cpe:/a:microsoft:office:2010:",
                             "^(15\..*)", "cpe:/a:microsoft:office:2013:",
                             "^(16\..*)", "cpe:/a:microsoft:office:2016:");
MAX = max_index(TMP_OFFICE_LIST);
checkdupOffc = "";

if(!registry_key_exists(key:"SOFTWARE\Microsoft\Office"))
{
  if(!registry_key_exists(key:"SOFTWARE\Wow6432Node\Microsoft\Office")){
    exit(0);
  }
}

## Get OS Architecture
os_arch = get_kb_item("SMB/Windows/Arch");
if(!os_arch){
  exit(-1);
}

## Check for 32 bit platform
if("x86" >< os_arch){
  key_list = make_list("SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\");
}

## Presently 64bit application is not available
## Check for 32 bit App on 64 bit platform
else if("x64" >< os_arch)
{
  key_list =  make_list("SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\",
                        "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\");
}

foreach key (key_list)
{
  foreach item (registry_enum_keys(key:key))
  {
    MSOffName = registry_get_sz(key:key + item, item:"DisplayName");

    if(egrep(pattern:"Microsoft Office.* Viewer", string:MSOffName))
    {
      MSOffVer = registry_get_sz(key:key + item, item:"DisplayVersion");
      if(MSOffVer)
      {
        MSOffLoc= registry_get_sz(key:key + item, item:"InstallLocation");
        if(!MSOffLoc){
          MSOffLoc = "Could not find the install location from registry";
        }

          set_kb_item(name:"MS/Office/Viewer/Ver", value:MSOffVer);
          replace_kb_item( name:"MS/Office/Prdts/Installed", value:TRUE );

          build_report(app:MSOffName, ver:MSOffVer, insloc:MSOffLoc, concluded:MSOffVer,
                       exp:"^([0-9.]+)", base:"cpe:/a:microsoft:office_word_viewer:");

          ## Register for 64 bit app on 64 bit OS once again
          if("64" >< os_arch && "Wow6432Node" >!< key && "32-bit" >!< MSOffName)
          {
            set_kb_item(name:"MS/Office/Viewer64/Ver", value:MSOffVer);
            replace_kb_item( name:"MS/Office/Prdts/Installed", value:TRUE );

            build_report(app:MSOffName, ver:MSOffVer, insloc:MSOffLoc, concluded:MSOffVer,
                         exp:"^([0-9.]+)", base:"cpe:/a:microsoft:office_word_viewer:x64:");
          }
        }
        continue;
      }

      if(egrep(pattern:"Microsoft Office (2000|XP|.* Edition 2003$|[^L)].* 2007$|.* 2010$|.*2013$|.*2016)",
               string:MSOffName))
      {
        MSOffVer = registry_get_sz(key:key + item, item:"DisplayVersion");
        if(MSOffVer)
        {
          MSOffLoc= registry_get_sz(key:key + item, item:"InstallLocation");

          if(MSOffVer != NULL)
          {
            ## Check if version is already set
            if (MSOffVer + ", " >< checkdupOffc){
              continue;
            }

            checkdupOffc  += MSOffVer + ", ";

            ##  Set the version for 32 bit App on 32 bit OS
            ##  Set the version for 32 bit App on 64 bit OS
            set_kb_item(name:"MS/Office/InstallPath", value:MSOffLoc);
            set_kb_item(name:"MS/Office/Ver", value:MSOffVer);
            replace_kb_item( name:"MS/Office/Prdts/Installed", value:TRUE ); 

            ## build cpe and store it as host_detail
            for (i = 0; i < MAX-1; i = i + 2)
            {
              cpe = build_cpe(value:MSOffVer, exp:TMP_OFFICE_LIST[i], base:TMP_OFFICE_LIST[i+1]);
              if(!isnull(cpe)){
                cpe_final = cpe;
              }
            }

            ## Set version for 64 bit app on 64 bit OS
            if( "x64" >< os_arch && "Wow6432Node" >!< key && "32-bit" >!< MSOffName)
            {
              set_kb_item(name:"MS/Office64/Ver", value:MSOffVer);
              replace_kb_item( name:"MS/Office/Prdts/Installed", value:TRUE ); 

              ## build cpe and store it as host_detail
              for (i = 0; i < MAX-1; i = i + 2)
              {
                cpe = build_cpe(value:MSOffVer, exp:TMP_OFFICE_LIST[i], base:TMP_OFFICE_LIST[i+1] + "x64:");
                if(!isnull(cpe)){
                  cpe_final = cpe;
                }
              }
            }
            
            build_report(app:MSOffName, ver:MSOffVer, concluded:MSOffVer, cpe:cpe_final, insloc:MSOffLoc);
          }
        }
        continue;
      }
    }
}

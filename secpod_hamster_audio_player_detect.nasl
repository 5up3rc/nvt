#############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_hamster_audio_player_detect.nasl 6032 2017-04-26 09:02:50Z teissa $
#
# Hamster Audio Player Version Detection
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2009 SecPod, http://www.secpod.com
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

tag_summary = "This script finds the installed OpenSSL version and saves the
  result in KB item.";

if(description)
{
  script_id(800692);
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version("$Revision: 6032 $");
  script_tag(name:"last_modification", value:"$Date: 2017-04-26 11:02:50 +0200 (Wed, 26 Apr 2017) $");
  script_tag(name:"creation_date", value:"2009-07-23 21:05:26 +0200 (Thu, 23 Jul 2009)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("Hamster Audio Player Version Detection");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"registry");
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Service detection");
  script_dependencies("secpod_reg_enum.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  script_require_ports(139,445); 
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("smb_nt.inc");
include("secpod_smb_func.inc");
include("cpe.inc");
include("host_details.inc");

## Constant values
SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.800692";
SCRIPT_DESC = "Hamster Audio Player Version Detection";

if(!get_kb_item("SMB/WindowsVersion")){
  exit(0);
}

key = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\";

if(!registry_key_exists(key:key)){
    exit(0);
}

foreach item (registry_enum_keys(key:key))
{
  hamsterName = registry_get_sz(key:key + item, item:"DisplayName");
  
  if("Hamster" >< hamsterName)
  {
    hamsterVer = eregmatch(pattern:"Hamster ([0-9.]+([a-z]+)?)",
                                             string:hamsterName);
    if(hamsterVer[1] != NULL)
    {
      set_kb_item(name:"Hamster/Audio-Player/Ver", value:hamsterVer[1]);
      log_message(data:"Hamster Audio player Version " + hamsterVer[1] +
                                                 " was detected on the host");
    
      ## build cpe and store it as host_detail
      cpe = build_cpe(value:hamsterVer[1], exp:"^([0-9.]+([a-z0-9]+)?)", base:"cpe:/a:ondanera.net:hamster_audio_player:");
      if(!isnull(cpe))
         register_host_detail(name:"App", value:cpe, nvt:SCRIPT_OID, desc:SCRIPT_DESC);

      exit(0);
    }
  }
}

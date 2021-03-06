###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_blender_detect_lin.nasl 6065 2017-05-04 09:03:08Z teissa $
#
# Blender Version Detection (Linux)
#
# Authors:
# Maneesh KB <kmaneesh@secpod.com>
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

tag_summary = "This script detects the installed version of Blender
  and sets the result in KB.";

if(description)
{
  script_id(900251);
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version("$Revision: 6065 $");
  script_tag(name:"last_modification", value:"$Date: 2017-05-04 11:03:08 +0200 (Thu, 04 May 2017) $");
  script_tag(name:"creation_date", value:"2009-11-20 06:52:52 +0100 (Fri, 20 Nov 2009)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("Blender Version Detection (Linux)");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"executable_version");
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Service detection");
  script_mandatory_keys("login/SSH/Linux");
  script_dependencies("gather-package-list.nasl");
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("ssh_func.inc");
include("version_func.inc");
include("cpe.inc");
include("host_details.inc");

## Constant values
SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.900251";
SCRIPT_DESC = "Blender Version Detection (Linux)";

sock = ssh_login_or_reuse_connection();
if(!sock){
  exit(0);
}

blendPath = find_file(file_name:"blender",file_path:"/",
                  useregex:TRUE, regexpar:"$", sock:sock);

foreach binPath (blendPath)
{
  blendVer = get_bin_version(full_prog_name:chomp(binPath), version_argv:"--version",
                          ver_pattern:"Blender ([0-9.]+)( .sub [0-9]+)?", sock:sock);

  if(blendVer[1] != NULL)
  {
    if ("sub" >< blendVer[2])
    {
      blendVer[2] = ereg_replace(pattern:" \(sub ", string:blendVer[2], replace:"");
      blendVer = blendVer[1] + "." + blendVer[2];
    }
    else
      blendVer = blendVer[1];
    set_kb_item(name:"Blender/Lin/Ver", value:blendVer);
    log_message(data:"Blender version " + blendVer + " running at location "
                                      + binPath + " was detected on the host");
  
    ## build cpe and store it as host_detail
    cpe = build_cpe(value:blendVer, exp:"^([0-9.]+([a-z0-9]+)?)", base:"cpe:/a:blender:blender:");
    if(!isnull(cpe))
       register_host_detail(name:"App", value:cpe, nvt:SCRIPT_OID, desc:SCRIPT_DESC);

  }
}
ssh_close_connection();

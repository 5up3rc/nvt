###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_changetrack_detect.nasl 6065 2017-05-04 09:03:08Z teissa $
#
# Changetrack Version Detection
#
# Authors:
# Sharath S <sharaths@secpod.com>
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

tag_summary = "This script detects the installed version of Changetrack and
  sets the reuslt in KB.";

if(description)
{
  script_id(900867);
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version("$Revision: 6065 $");
  script_tag(name:"last_modification", value:"$Date: 2017-05-04 11:03:08 +0200 (Thu, 04 May 2017) $");
  script_tag(name:"creation_date", value:"2009-09-24 10:05:51 +0200 (Thu, 24 Sep 2009)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("Changetrack Version Detection");
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
SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.900867";
SCRIPT_DESC = "Changetrack Version Detection";

change_sock = ssh_login_or_reuse_connection();
if(!change_sock){
  exit(0);
}

paths = find_file(file_name:"changetrack",file_path:"/", useregex:TRUE,
                  regexpar:"$", sock:change_sock);

foreach binName (paths)
{
  ctrack_ver = get_bin_version(full_prog_name:chomp(binName), version_argv:"-v",
                               ver_pattern:"([0-9]\.[0-9.]+)",sock:change_sock);
  if(ctrack_ver[1] != NULL){
    set_kb_item(name:"Changetrack/Ver", value:ctrack_ver[1]);
    log_message(data:"Changetrack version " + ctrack_ver[1] +
             " running at location " + binName + " was detected on the host");
   
    ## build cpe and store it as host_detail
    cpe = build_cpe(value:ctrack_ver[1], exp:"^([0-9.]+)", base:"cpe:/a:cameron_morland:changetrack:");
    if(!isnull(cpe))
       register_host_detail(name:"App", value:cpe, nvt:SCRIPT_OID, desc:SCRIPT_DESC);

  }
}
ssh_close_connection();

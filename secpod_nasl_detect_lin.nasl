###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_nasl_detect_lin.nasl 5499 2017-03-06 13:06:09Z teissa $
#
# NASL Version Detection (Linux)
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

tag_summary = "This script detect the installed version of NASL and set the
  result in KB.";

if(description)
{
  script_id(900189);
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version("$Revision: 5499 $");
  script_tag(name:"last_modification", value:"$Date: 2017-03-06 14:06:09 +0100 (Mon, 06 Mar 2017) $");
  script_tag(name:"creation_date", value:"2009-01-22 12:00:13 +0100 (Thu, 22 Jan 2009)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("NASL Version Detection (Linux)");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"executable_version");
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("General");
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
SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.900189";
SCRIPT_DESC = "NASL Version Detection (Linux)";

naslPort = 1241;
if(!get_tcp_port_state(naslPort)){
  exit(0);
}

sock = ssh_login_or_reuse_connection();
if(!sock){
  exit(0);
}

paths = find_file(file_name:"nasl",file_path:"/", useregex:TRUE,
                 regexpar:"$", sock:sock);
foreach naslBin (paths)
{
  naslVer = get_bin_version(full_prog_name:chomp(naslBin), sock:sock,
                            version_argv:"-version",
                            ver_pattern:"nasl ([0-9.a-z]+)");
  if(naslVer[1] != NULL)
  {
    set_kb_item(name:"NASL/Linux/Ver", value:naslVer[1]);
    log_message(data:"NASL version " + naslVer[1] + " running at location "+
                       naslBin +  " was detected on the host");
    ssh_close_connection();
  
    ## build cpe and store it as host_detail
    cpe = build_cpe(value:naslVer[1], exp:"^([0-9.]+)", base:"cpe:/a:nessus:nessus:");
    if(!isnull(cpe))
       register_host_detail(name:"App", value:cpe, nvt:SCRIPT_OID, desc:SCRIPT_DESC);

    exit(0);
  }
}
ssh_close_connection();

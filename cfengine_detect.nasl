###############################################################################
# OpenVAS Vulnerability Test
# $Id: cfengine_detect.nasl 6063 2017-05-03 09:03:05Z teissa $
#
# cfengine detection and local identification
#
# Authors:
# David Maciejak <david dot maciejak at kyxar dot fr>
# 
# Updated by: Rinu Kuriakose <krinu@secpod.com
#
# Copyright:
# Copyright (C) 2004 David Maciejak
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation.
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
  script_oid("1.3.6.1.4.1.25623.1.0.14315");
  script_version("$Revision: 6063 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-05-03 11:03:05 +0200 (Wed, 03 May 2017) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("cfengine detection and local identification");
  script_tag(name : "summary" , value:"Detection of installed version of cfengine.

  The script logs in via ssh, searches for executable 'cfengine' and
  queries the found executables via command line option '--version'");

  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2004 David Maciejak");
  script_family("Product detection");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("login/SSH/Linux");
  script_require_ports(5308);
  exit(0);
}

include("ssh_func.inc");
include("version_func.inc");
include("cpe.inc");
include("host_details.inc");

cfPort = 5308;

if(!get_port_state(cfPort)) exit(0);

## Checking cfengine service is running or not
soc = open_sock_tcp(cfPort);
if(!soc){ 
  exit(0);
}

## Try to get cfengine version locally
sock = ssh_login_or_reuse_connection();
if(!sock){
  exit(0);
}

paths =  find_bin(prog_name:"cf-agent", sock:sock);

foreach binFile (paths)
{
  cfVer = get_bin_version(full_prog_name:chomp(binFile), sock:sock,
                             version_argv:"--version",
                             ver_pattern:"CFEngine.?([C|c]ore).?([0-9.]+)");


  if(cfVer[2] != NULL)
  {
    ##Set the kb if cfengine is installed
    set_kb_item(name:"cfengine/running", value:TRUE);
    set_kb_item(name:"cfengine/version", value:cfVer[2]);

    ## Building cpe
    cpe = build_cpe(value:cfVer[2], exp:"^([0-9.]+)", base:"cpe:/a:gnu:cfengine:");
    if(isnull(cpe))
      cpe = "cpe:/a:gnu:cfengine";

    register_product(cpe:cpe, location:binFile, port:cfPort);

    log_message(data: build_detection_report(app: "CFEngine", version:cfVer[2],
                                             install: binFile,
                                             cpe: cpe,
                                             concluded: cfVer[2]),
                                             port:cfPort);
  }
}

ssh_close_connection();

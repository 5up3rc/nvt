###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_tiv_tsm_detect_lin.nasl 5877 2017-04-06 09:01:48Z teissa $
#
# IBM Tivoli Storage Manager Version Detection (Linux)
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.808636");
  script_version("$Revision: 5877 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-04-06 11:01:48 +0200 (Thu, 06 Apr 2017) $");
  script_tag(name:"creation_date", value:"2016-10-06 12:39:14 +0530 (Thu, 06 Oct 2016)");
  script_name("IBM Tivoli Storage Manager Version Detection (Linux)");

  script_tag(name : "summary" , value : "Detection of installed version of
  IBM Tivoli Storage Manager on Linux.

  The script logs in via ssh, searches for tivoli and queries the
  version from 'README_enu.htm' file.");
  
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"executable_version");
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Product detection");
  script_mandatory_keys("login/SSH/Linux");
  script_dependencies("gather-package-list.nasl");
  exit(0);
}


include("ssh_func.inc");
include("version_func.inc");
include("cpe.inc");
include("host_details.inc");

##Variable initialization
sock = 0;
bracbin = "";
bracVer = "";
paths = "";

sock = ssh_login_or_reuse_connection();
if(!sock){
  exit(0);
}


if(!paths = find_file(file_name:"README_enu.htm",file_path: "/opt/", useregex:TRUE,
                  regexpar:"$", sock:sock)){
  exit(0);
}

foreach binary_name(paths)
{
  ##Application confiramtion
  bracVer = get_bin_version(full_prog_name:"cat", version_argv:binary_name,
                          ver_pattern:'Tivoli Storage Manager Backup-Archive Client Version ([0-9.]+)', sock:sock);

  if(bracVer[1] != NULL)
  {
    set_kb_item(name:"IBM/Tivoli/Storage/Manager/Linux/Ver", value:bracVer[1]);
 
    ## build cpe
    cpe = build_cpe(value:bracVer[1], exp:"^([0-9.]+)", base:"cpe:/a:ibm:tivoli_storage_manager:");
    if(!cpe)
         cpe = "cpe:/a:ibm:tivoli_storage_manager";

    register_product(cpe:cpe, location:paths[0]);
    log_message(data: build_detection_report(app:"IBM Tivoli Storage Manager Client",
                                             version: bracVer[1],
                                             install: binary_name,
                                             cpe: cpe,
                                             concluded: bracVer[1]));
    exit(0);
  }
}
ssh_close_connection();

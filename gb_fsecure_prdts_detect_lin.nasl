###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fsecure_prdts_detect_lin.nasl 6516 2017-07-04 12:20:47Z cfischer $
#
# F-Secure Multiple Products Version Detection (Linux)
#
# Authors:
# Sharath S <sharaths@secpod.com>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_summary = "The script detects the installed version of F-Seure Anti-Virus,
  Internet security and Internet GateKeeper and sets the version in KB.";

if(description)
{
  script_id(800357);
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version("$Revision: 6516 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-04 14:20:47 +0200 (Tue, 04 Jul 2017) $");
  script_tag(name:"creation_date", value:"2009-03-13 14:39:10 +0100 (Fri, 13 Mar 2009)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("F-Secure Multiple Products Version Detection (Linux)");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"executable_version");
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
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
SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.800357";
SCRIPT_DESC = "F-Secure Multiple Products Version Detection (Linux)";

## start script
sock = ssh_login_or_reuse_connection();
if(!sock){
  exit(0);
}

# Set KB for F-Secure Linux Security and Anti-Virus Linux Client/Server Security
fsavPaths = find_file(file_name:"fsav", file_path:"/", useregex:TRUE,
                 regexpar:"$", sock:sock);

if(fsavPaths != NULL)
{
  foreach fsavBin (fsavPaths)
  {
    fsavVer = get_bin_version(full_prog_name:chomp(fsavBin), sock:sock,
                             version_argv:"--version",
                             ver_pattern:"F-Secure (Anti-Virus )?Linux (Client "+
                                         "|Server )?Security version ([0-9.]+)"+
                                         " build ([0-9]+)([^0-9.]|$)?");
    fsavName = fsavVer;
    if(fsavVer[3] != NULL)
    {
      if(fsavVer[4] != NULL){
         fsavVer = fsavVer[3] + "." + fsavVer[4];
      }
      else{
        fsavVer = fsavVer[3];
      }
      if(fsavName[0] =~ "Linux Security")
      {
        replace_kb_item(name:"F-Sec/Products/Lin/Installed", value:TRUE);
        set_kb_item(name:"F-Sec/AV/LnxSec/Ver", value:fsavVer);

        ## build cpe and store it as host_detail
        register_and_report_cpe(app:"F-Secure Anti Virus", ver:fsavVer, base:"cpe:/a:f-secure:f-secure_linux_security:",
                                expr:"^([0-9]+\.[0-9]+)");
      }
      if(fsavName[0] =~ "Linux Client Security")
      {
        replace_kb_item(name:"F-Sec/Products/Lin/Installed", value:TRUE);
        set_kb_item(name:"F-Sec/AV/LnxClntSec/Ver", value:fsavVer);

        ## build cpe and store it as host_detail
        register_and_report_cpe(app:"F-Secure Anti Virus Client Security", ver:fsavVer,
                                base:"cpe:/a:f-secure:f-secure_anti-virus_linux_client_security:",
                                expr:"^([0-9]+\.[0-9]+)");
      }
      if(fsavName[0] =~ "Linux Server Security")
      {
        replace_kb_item(name:"F-Sec/Products/Lin/Installed", value:TRUE);
        set_kb_item(name:"F-Sec/AV/LnxSerSec/Ver", value:fsavVer);

        ## build cpe and store it as host_detail
        register_and_report_cpe(app:"F-Secure Server Security", ver:fsavVer,
                                base:"cpe:/a:f-secure:f-secure_anti-virus_linux_server_security:",
                                expr:"^([0-9]+\.[0-9]+)");

      }
      break;
    }
  }
}

# Set KB for F-Secure Internet Gatekeeper
fsigkPaths = find_file(file_name:"Makefile", file_path:"/fsigk/", useregex:TRUE,
                       regexpar:"$", sock:sock);
if(fsigkPaths != NULL)
{
  foreach binPath (fsigkPaths)
  {
    fsigkVer = ssh_cmd(socket:sock, timeout:120, cmd:"egrep '^VERSION' " +
                                                     binPath);
    if(fsigkVer != NULL)
    {
      fsigkVer = eregmatch(pattern:"VERSION.*= ([0-9.]+)([^.0-9]|$)",
                           string:fsigkVer);

      if(fsigkVer[1] != NULL)
      {
        buildVer = ssh_cmd(socket:sock, timeout:120,
                           cmd:"egrep '^BUILD_NUMBER' " + binPath);

        buildVer = eregmatch(pattern:"BUILD_NUMBER.*= ([0-9]+)([^.0-9]|$)",
                             string:buildVer);

        if(buildVer[1] != NULL){
          fsigkVer = fsigkVer[1] + "." + buildVer[1];
        }
        else{
          fsigkVer = fsigkVer[1];
        }
        replace_kb_item(name:"F-Sec/Products/Lin/Installed", value:TRUE);
        set_kb_item(name:"F-Sec/IntGatekeeper/Lnx/Ver", value:fsigkVer);

        ## build cpe and store it as host_detail
        register_and_report_cpe(app:"F-Secure Internet Gate Keeper", ver:fsigkVer,
                                base:"cpe:/a:f-secure:f-secure_internet_gatekeeper_for_linux:",
                                expr:"^([0-9]+\.[0-9]+)");
       }
      ssh_close_connection();
      exit(0);
    }
  }
}
ssh_close_connection();
exit(0);

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_photoshop_detect_macosx.nasl 6484 2017-06-29 09:15:46Z cfischer $
#
# Adobe Photoshop Version Detection (Mac OS X)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.802783");
  script_version("$Revision: 6484 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-06-29 11:15:46 +0200 (Thu, 29 Jun 2017) $");
  script_tag(name:"creation_date", value:"2012-05-16 10:35:58 +0530 (Wed, 16 May 2012)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Adobe Photoshop Version Detection (Mac OS X)");

  tag_summary =
"Detection of installed version of Adobe Photoshop.

The script logs in via ssh, searches for folder 'Adobe Photoshop.app' and
queries the related 'info.plist' file for string 'CFBundleShortVersionString'
via command line option 'defaults read'.";


  script_tag(name : "summary" , value : tag_summary);
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_dependencies("gather-package-list.nasl");
  script_family("Product detection");
  script_mandatory_keys("ssh/login/osx_name");
  exit(0);
}


include("ssh_func.inc");
include("cpe.inc");
include("host_details.inc");

## Variable Initialization
photoVer = "";
sock = "";
ver = "";
cpe = "";

## Checking OS
sock = ssh_login_or_reuse_connection();
if(!sock) {
  exit(-1);
}

foreach ver (make_list("1", "2", "3", "4", "5", "6"))
{
  ## Get the version Adobe Photoshop
  photoVer = chomp(ssh_cmd(socket:sock, cmd:"defaults read /Applications/" +
             "Adobe\ Photoshop\ CS" + ver + "/Adobe\ Photoshop\ CS" +
             ver + ".app/Contents/Info CFBundleShortVersionString"));

  if(isnull(photoVer) || "does not exist" >< photoVer){
    continue;
  }

  ## Set the version in KB
  set_kb_item(name: "Adobe/Photoshop/MacOSX/Version", value:photoVer);

  ## build cpe and store it as host_detail
  cpe = build_cpe(value:photoVer, exp:"^([0-9.]+)", base:"cpe:/a:adobe:photoshop_cs" +
                    ver + ":");
  if(isnull(cpe))
    cpe='cpe:/a:adobe:photoshop_cs' + ver;

  path = '/Applications/Adobe Photoshop CS' + ver;

  ## Set the Path in KB
  set_kb_item(name: "Adobe/Photoshop/MacOSX/Path", value:path);

  register_product(cpe:cpe, location:path);

  log_message(data: build_detection_report(app:"Adobe Photoshop",
                                           version:photoVer,
                                           install:path,
                                           cpe:cpe,
                                           concluded: photoVer));
}

close(sock);

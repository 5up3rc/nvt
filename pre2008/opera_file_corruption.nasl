# OpenVAS Vulnerability Test
# $Id: opera_file_corruption.nasl 6040 2017-04-27 09:02:38Z teissa $
# Description: Opera relative path directory traversal file corruption vulnerability
#
# Authors:
# David Maciejak <david dot maciejak at kyxar dot fr>
# based on work from (C) Tenable Network Security
# Updated: 03/12/2009 Antu Sanadi <santu@secpod.com> 
#
# Copyright:
# Copyright (C) 2004 David Maciejak
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#

tag_summary = "The remote host is using Opera - an alternative web browser.
  This version of Opera is vulnerable to a file corruption vulnerability.
  This issue is exposed when a user is presented with a file dialog,
  which will cause the creation of a temporary file.
  It is possible to specify a relative path to another file on the system
  using directory traversal sequences when the download dialog is displayed.
  If the client user has write permissions to the attacker-specified file,
  it will be corrupted.

  This could be exploited to delete sensitive files on the systems.";

tag_solution = "Install Opera 7.23 or newer.";

# Ref: :: Operash ::

if(description)
{
  script_id(14246);
  script_version("$Revision: 6040 $");
  script_tag(name:"last_modification", value:"$Date: 2017-04-27 11:02:38 +0200 (Thu, 27 Apr 2017) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_bugtraq_id(9279);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_name("Opera relative path directory traversal file corruption vulnerability");

  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"registry");
  script_copyright("This script is Copyright (C) 2004 David Maciejak");
  script_family("Windows");
  script_dependencies("secpod_opera_detection_win_900036.nasl");
  script_require_keys("Opera/Win/Version");
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("version_func.inc");

OperaVer = get_kb_item("Opera/Win/Version");
if(!OperaVer){
  exit(0);
}

if(version_is_less_equal(version:OperaVer, test_version:"7.22")){
  security_message(0);
}

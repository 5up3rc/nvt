###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_alleycode_html_editor_detect.nasl 5372 2017-02-20 16:26:11Z cfi $
#
# Alleycode HTML Editor Version Detection
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

tag_summary = "This script detects the installed version of Alleycode HTML Editor
  and sets the result in KB.";

if(description)
{
  script_id(801126);
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version("$Revision: 5372 $");
  script_tag(name:"last_modification", value:"$Date: 2017-02-20 17:26:11 +0100 (Mon, 20 Feb 2017) $");
  script_tag(name:"creation_date", value:"2009-10-23 16:18:41 +0200 (Fri, 23 Oct 2009)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("Alleycode HTML Editor Version Detection");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"registry");
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Service detection");
  script_dependencies("secpod_reg_enum.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  script_require_ports(139, 445);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("smb_nt.inc");
include("cpe.inc");
include("host_details.inc");

## Constant values
SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.801126";
SCRIPT_DESC = "Alleycode HTML Editor Version Detection";

if(!get_kb_item("SMB/WindowsVersion")){
  exit(0);
}

aheName = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion" +
                              "\Uninstall\Kobeman_is1", item:"DisplayName");

if("Alleycode HTML Editor" >< aheName)
{
  aheVer = eregmatch(pattern:"Alleycode HTML Editor ([0-9.]+)", string:aheName);
  if(aheVer[1])
  {
    set_kb_item(name:"Alleycode-HTML-Editor/Ver", value:aheVer[1]);
    log_message(data:"Alleycode HTML Editor version " + aheVer[1] +
                       " was detected on the host");
  
    ## build cpe and store it as host_detail
    cpe = build_cpe(value:aheVer[1], exp:"^([0-9.]+)", base:"cpe:/a:konae:alleycode_html_editor:");
    if(!isnull(cpe))
       register_host_detail(name:"App", value:cpe, nvt:SCRIPT_OID, desc:SCRIPT_DESC);
 
  }
}

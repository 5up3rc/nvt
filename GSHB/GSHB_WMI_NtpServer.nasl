###############################################################################
# OpenVAS Vulnerability Test
# $Id: GSHB_WMI_NtpServer.nasl 7061 2017-09-05 11:50:40Z teissa $
#
# NTP Server (win)
#
# Authors:
# Thomas Rotter <T.Rotter@dn-systems.de>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
#
# Set in an Workgroup Environment under Vista with enabled UAC this DWORD to access WMI:
# HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system\LocalAccountTokenFilterPolicy to 1
#
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

tag_summary = "Tests WMI NTP Server.";

if(description)
{
  script_id(96015);
  script_version("$Revision: 7061 $");
  script_tag(name:"last_modification", value:"$Date: 2017-09-05 13:50:40 +0200 (Tue, 05 Sep 2017) $");
  script_tag(name:"creation_date", value:"2009-10-23 12:32:24 +0200 (Fri, 23 Oct 2009)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"qod_type", value:"registry");  
  script_name("WMI NTP Server (win)");


  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2009 Greenbone Networks GmbH");
  script_family("IT-Grundschutz");
  script_mandatory_keys("Compliance/Launch/GSHB");
  script_mandatory_keys("Tools/Present/wmi");
   
#  script_require_ports(139, 445);
  script_dependencies("secpod_reg_enum.nasl", "GSHB_WMI_OSInfo.nasl");
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}

host    = get_host_ip();
usrname = get_kb_item("SMB/login");
domain  = get_kb_item("SMB/domain");
if (domain){
  usrname = domain + '\\' + usrname;
}
passwd  = get_kb_item("SMB/password");
OSVER = get_kb_item("WMI/WMI_OSVER");

if(!OSVER || OSVER >< "none"){
  set_kb_item(name:"WMI/NtpServer", value:"error");
  set_kb_item(name:"WMI/Service/w32time", value:"error");
  set_kb_item(name:"WMI/NtpServer/log", value:"No access to SMB host.\nFirewall is activated or there is not a Windows system.");
  exit(0);
}

handlereg = wmi_connect_reg(host:host, username:usrname, password:passwd);
handle = wmi_connect(host:host, username:usrname, password:passwd);

if(!handle || !handlereg){
  set_kb_item(name:"WMI/NtpServer", value:"error");
  set_kb_item(name:"WMI/NtpServer/log", value:"wmi_connect: WMI Connect failed.");
  wmi_close(wmi_handle:handle);
  wmi_close(wmi_handle:handlereg);
  exit(0);
}


NtpServer = wmi_reg_get_sz(wmi_handle:handlereg, key:"SYSTEM\CurrentControlSet\Services\W32Time\Parameters", key_name:"NtpServer");

query = 'select state  from Win32_Service WHERE NAME = "w32time"';
w32timeService = wmi_query(wmi_handle:handle, query:query);

if(!NtpServer) NtpServer = "None";
set_kb_item(name:"WMI/NtpServer", value:NtpServer);
set_kb_item(name:"WMI/Service/w32time", value:w32timeService);

wmi_close(wmi_handle:handle);
wmi_close(wmi_handle:handlereg);

exit(0);

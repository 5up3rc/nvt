###############################################################################
# OpenVAS Vulnerability Test
# $Id: GSHB_WMI_EFS.nasl 7061 2017-09-05 11:50:40Z teissa $
#
# Get EFS Encrypted Files, Dirs and EFS-Encryption AlgorithmID (win)
#
# Authors:
# Thomas Rotter <T.Rotter@dn-systems.de>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_summary = "GGet EFS Encrypted Files, Dirs and EFS-Encryption AlgorithmID (win)";

if(description)
{
  script_id(96043);
  script_version("$Revision: 7061 $");
  script_tag(name:"last_modification", value:"$Date: 2017-09-05 13:50:40 +0200 (Tue, 05 Sep 2017) $");
  script_tag(name:"creation_date", value:"2010-01-13 14:14:12 +0100 (Wed, 13 Jan 2010)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"qod_type", value:"registry");  
  script_name("Get EFS Encrypted Files, Dirs and EFS-Encryption AlgorithmID (win)");


  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
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
  set_kb_item(name:"WMI/WMI_EncrFile", value:"error");
  set_kb_item(name:"WMI/WMI_EncrDir", value:"error");
  set_kb_item(name:"WMI/WMI_EFSAlgorithmID", value:"error");
  set_kb_item(name:"WMI/WMI_EFS/log", value:"No access to SMB host.\nFirewall is activated or there is not a Windows system.");
  exit(0);
}

handle = wmi_connect(host:host, username:usrname, password:passwd);
handlereg = wmi_connect_reg(host:host, username:usrname, password:passwd);

if(!handle || !handlereg){
  set_kb_item(name:"WMI/WMI_EncrFile", value:"error");
  set_kb_item(name:"WMI/WMI_EncrDir", value:"error");
  set_kb_item(name:"WMI/WMI_EFSAlgorithmID", value:"error");
  set_kb_item(name:"WMI/WMI_EFS/log", value:"wmi_connect: WMI Connect failed.");
  wmi_close(wmi_handle:handle);
  wmi_close(wmi_handle:handlereg);
  exit(0);
}


query1 = 'select Name from CIM_DataFile WHERE Encrypted = True';
query2 = 'select Name from Win32_Directory WHERE Encrypted = True';
EFSAlgorithmID = wmi_reg_get_dword_val(wmi_handle:handlereg, key:"SOFTWARE\Microsoft\Windows NT\CurrentVersion\EFS", val_name:"AlgorithmID");
EncrFile = wmi_query(wmi_handle:handle, query:query1);
EncrDir = wmi_query(wmi_handle:handle, query:query2);


if (!EncrFile) EncrFile = "none";
if (!EncrDir) EncrDir = "none";
if (!EFSAlgorithmID) EFSAlgorithmID = "none";

set_kb_item(name:"WMI/WMI_EncrFile", value:EncrFile);
set_kb_item(name:"WMI/WMI_EncrDir", value:EncrDir);
set_kb_item(name:"WMI/WMI_EFSAlgorithmID", value:EFSAlgorithmID);

wmi_close(wmi_handle:handle);
wmi_close(wmi_handle:handlereg);

exit(0);

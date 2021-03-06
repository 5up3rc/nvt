# OpenVAS Vulnerability Test
# $Id: ece_flag.nasl 7175 2017-09-18 11:55:15Z cfischer $
# Description: Firewall ECE-bit bypass
#
# Authors:
# Andrey I. Zakharov
# John Lampe
#
# Copyright:
# Copyright (C) 2004 Andrey I. Zakharov and John Lampe
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

tag_summary = "The remote host seems vulnerable to a bug wherein a remote
attacker can circumvent the firewall by setting the ECE bit
within the TCP flags field.  At least one firewall (ipfw) is 
known to exhibit this sort of behavior.

Known vulnerable systems include all FreeBSD 3.x ,4.x, 3.5-STABLE, 
and 4.2-STABLE.";

tag_solution = "If you are running FreeBSD 3.X, 4.x, 3.5-STABLE,
4.2-STABLE, upgrade your firewall.  If you are not running FreeBSD, 
contact your firewall vendor for a patch.";

if (description)
{
 script_id(12118);
 script_version("$Revision: 7175 $");
 script_tag(name:"last_modification", value:"$Date: 2017-09-18 13:55:15 +0200 (Mon, 18 Sep 2017) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_bugtraq_id(2293);
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_tag(name:"qod_type", value:"remote_banner_unreliable");
 script_name("Firewall ECE-bit bypass");
 script_cve_id("CVE-2001-0183");
 
 script_category(ACT_GATHER_INFO);
 script_family("Firewalls");
 script_copyright("This script is Copyright (C) 2004 Andrey I. Zakharov and John Lampe");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/2293/");

 script_exclude_keys("keys/islocalhost","keys/islocalnet","keys/TARGET_IS_IPV6");
 exit(0);
}

if ( islocalnet() || islocalhost() ) exit(0);
if(TARGET_IS_IPV6())exit(0);

sport= (rand() % 64511) + 1024;
ipid = 1234;
myack = 0xFF67;
init_seq = 538;


# so, we need a list of commonly open, yet firewalled ports...
port[0] = 22;
port[1] = 111;
port[2] = 1025;
port[3] = 139;
port[4] = 3389;
port[5] = 23;



for (i=0; port[i]; i++) {
    reply=NULL;
    sport++;
    filter = string("src port ", port[i], " and src host ", get_host_ip(), " and dst port ", sport);

    # STEP 1:  Send a Naked SYN packet

    ip = forge_ip_packet(ip_v:4, ip_hl:5, ip_tos:0,ip_off:0,ip_len:20,
                         ip_p:IPPROTO_TCP, ip_id:ipid, ip_ttl:0x40,
                         ip_src:this_host());


    tcp = forge_tcp_packet(ip:ip, th_sport:sport, th_dport:port[i],
                          th_flags:0x02, th_seq:init_seq,th_ack:myack,
                          th_x2:0, th_off:5, th_win:2048, th_urp:0);



    for ( j = 0 ; j < 3 ; j ++ )
    {
    	reply =  send_packet(tcp, 
			pcap_active : TRUE,
                        pcap_filter : filter,
                        pcap_timeout : 1);
    	if ( reply ) break;
    }


    # STEP 2:  If we don't get a response back from STEP 1, 
    # we will send a SYN+ECE to port

    if (! reply)   
    {     
	     sport++;
    	     filter = string("src port ", port[i], " and src host ", get_host_ip(), " and dst port ", sport);
             ip = forge_ip_packet(ip_v:4, ip_hl:5, ip_tos:0,ip_off:0,ip_len:20,
                         ip_p:IPPROTO_TCP, ip_id:ipid, ip_ttl:0x40,
                         ip_src:this_host());


             tcp = forge_tcp_packet(ip:ip, th_sport:sport, th_dport:port[i],
                          th_flags:0x42, th_seq:init_seq,th_ack:myack,
                          th_x2:0, th_off:5, th_win:2048, th_urp:0);


	     for ( j = 0; j < 3 ; j ++ )
	     {
             	reply =  send_packet(pcap_active : TRUE,
                        pcap_filter : filter,
                        pcap_timeout : 1,
                        tcp);
		if (reply) break;
	     }


             if (reply) 
	     {
                 flags = get_tcp_element(tcp:reply, element:"th_flags");
                 if (flags & TH_ACK) security_message(port);
             }
    }


}

exit(0);





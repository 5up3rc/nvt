# OpenVAS Vulnerability Test
# $Id: remote-MS03-034.nasl 5077 2017-01-24 10:51:38Z cfi $
# Description: 
# Microsoft Security Bulletin MS03-034
# Flaw in NetBIOS Could Lead to Information Disclosure 
#
# Affected software 
#
# Microsoft Windows NT Workstation 4.0 
# Microsoft Windows NT Server 4.0� 
# Microsoft Windows NT Server 4.0, Terminal Server Edition  
# Microsoft Windows 2000  
# Microsoft Windows XP  
# Microsoft Windows Server 2003 
#
# Not Affected Software: 
#
# Microsoft Windows Millennium Edition 
# 
#
# remote-MS03-034.nasl
#
# Author:
# Christian Eric Edjenguele <christian.edjenguele@owasp.org>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 or later,
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

tag_summary = "Under certain conditions, the response to a NetBT Name Service query may, in addition to the typical reply, 
contain random data from the target system's memory. This data could, for example, be a segment of HTML 
if the user on the target system was using an Internet browser, or it could contain other types of data 
that exist in memory at the time that the target system responds to the NetBT Name Service query. 
An attacker could seek to exploit this vulnerability by sending a NetBT Name Service query to the target system 
and then examine the response to see if it included any random data from that system's memory.";

tag_solution = "Microsoft has released a patch to fix this issue, download it from the following website:

Windows Server 2003 
http://www.microsoft.com/downloads/details.aspx?FamilyId=A59CC2AC-F182-4CD5-ACE7-3D4C2E3F1326&displaylang=en
 
Windows Server 2003 64 bit Edition 
http://www.microsoft.com/downloads/details.aspx?FamilyId=140CF7BE-0371-4D17-8F4C-951B76AC3024&displaylang=en
 
Windows XP
http://www.microsoft.com/downloads/details.aspx?FamilyId=1C9D8E86-5B8C-401A-88B2-4443FFB9EDC3&displaylang=en 
 
Windows XP 64 bit Edition 
http://www.microsoft.com/downloads/details.aspx?FamilyId=378D4B58-BF2C-4406-9D88-E6A3C4601795&displaylang=en
 
Windows 2000  
http://www.microsoft.com/downloads/details.aspx?FamilyId=D0564162-4EAE-42C8-B26C-E4D4D496EAD8&displaylang=en

Windows NT Server 4.0 
http://www.microsoft.com/downloads/details.aspx?FamilyId=F131D63A-F74F-4CAF-95BD-D7FA37ADCF38&displaylang=en
 
Windows NT Server 4.0, Terminal Server Edition 
http://www.microsoft.com/downloads/details.aspx?FamilyId=22379951-64A9-446B-AC8F-3F2F080383A9&displaylang=en";


 if(description)
{
script_id(101015);
script_version("$Revision: 5077 $");
script_tag(name:"last_modification", value:"$Date: 2017-01-24 11:51:38 +0100 (Tue, 24 Jan 2017) $");
script_tag(name:"creation_date", value:"2009-03-16 23:15:41 +0100 (Mon, 16 Mar 2009)");
script_tag(name:"cvss_base", value:"5.0");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
script_cve_id("CVE-2003-0661");
name = "Microsoft MS03-034 security check";
script_name(name);
 
script_tag(name:"qod_type", value:"remote_vul");

summary = "Flaw in NetBIOS Could Lead to Information Disclosure";

script_category(ACT_ATTACK);

script_copyright("Christian Eric Edjenguele <christian.edjenguele@owasp.org>");
family = "Windows : Microsoft Bulletins";
script_family(family);
script_dependencies("find_service.nasl","os_detection.nasl");
script_require_udp_ports(137);
script_mandatory_keys("Host/runs_windows");

 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("host_details.inc");

#
# The script code starts here
#


# default NetBIOS udp port
if(host_runs("Windows") != "yes")exit(0);

port = 137;
if(!get_udp_port_state(port))exit(0);

matrix = make_array();

# Build the malicious packet
request = raw_string("\x7c\x54\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00",
	             "\x20\x43\x4B\x41\x41\x41\x41\x41\x41\x41\x41\x41",
        	     "\x41\x41\x41\x41\x41\x41\x41\x41\x41\x41\x41\x41",
                     "\x41\x41\x41\x41\x41\x41\x41\x41\x41\x00\x00\x21",
                     "\x00\x01");

for(i = 0; i < 50; i++)
{
	soc = open_sock_udp(port);
	if(!soc)exit(0);

	send(socket:soc, data:request);

	response = recv(socket:soc, length:4096, timeout:20);
	close(soc);

	if(strlen(response) > 58 )
	{
		min = strlen(response) - 58;
		element = substr(response, min, strlen(response));
		matrix[max_index(matrix)] = element;
	}

	# the length of the aray
	dim = max_index(matrix) - 1;
	if(dim > 1)
	{
		for(j = 0; j < i; j++) {
			if(matrix[j] != matrix[i]) {
				# Report Microsoft Windows 'NetBT Name Service' Information Leakage Vulnerability (MS03-034)
				security_message(port, proto:"udp");
				exit(0);
			}
		}	
	}
	
}

# OpenVAS Vulnerability Test
# $Id: smb_nt_ms02-025.nasl 6046 2017-04-28 09:02:54Z teissa $
# Description: Exchange 2000 Exhaust CPU Resources (Q320436)
#
# Authors:
# Michael Scheidell <scheidell at secnap.net>
# Updated: 2009/04/23
# Chandan S <schandan@secpod.com>
#
# Copyright:
# Copyright (C) 2002 Michael Scheidell
# Copyright (C) 2002 SECNAP Network Security, LLC.
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

tag_summary = "Malformed Mail Attribute can Cause Exchange 2000 to Exhaust CPU
Resources (Q320436)

Impact of vulnerability: Denial of Service

Affected Software: 

Recommendation: Users using any of the affected
products should install the patch immediately.

Maximum Severity Rating: Critical

See
http://www.microsoft.com/technet/security/bulletin/ms02-025.mspx

(note: requires admin level netbios login account to check)";

if(description)
{
 script_id(11143);
 script_version("$Revision: 6046 $");
 script_tag(name:"last_modification", value:"$Date: 2017-04-28 11:02:54 +0200 (Fri, 28 Apr 2017) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_bugtraq_id(4881);
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
 script_cve_id("CVE-2002-0368");
 name = "Exchange 2000 Exhaust CPU Resources (Q320436)";
 
 script_name(name);
 

 summary = "Checks for MS Hotfix Q320436, DOS on Exchange 2000";

 
 script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"registry");
 
 script_copyright("This script is Copyright (C) 2002 Michael Scheidell");
 family = "Windows : Microsoft Bulletins";
 script_family(family);
 
 script_dependencies("secpod_reg_enum.nasl");
 script_require_keys("SMB/Registry/Enumerated");
 script_mandatory_keys("SMB/WindowsVersion");
 script_require_ports(139, 445);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("smb_nt.inc");
include("secpod_reg.inc");


server = hotfix_check_nt_server();
if (!server) exit (0);

vers = hotfix_check_exchange_installed();
if ( vers == NULL ) exit(0);

if (hotfix_missing (name:"320436") > 0 )
  security_message(get_kb_item("SMB/transport"));

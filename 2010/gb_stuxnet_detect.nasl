###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_stuxnet_detect.nasl 7332 2017-09-29 14:16:56Z cfischer $
#
# Stuxnet Detection
#
# Authors:
# Michael Meyer
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

tag_summary = "The remote Host seems to be infected by the Stuxnet worm.
The Scanner found files on the remote host that indicate that this host is
infected by the Stuxnet worm.";

tag_solution = "Remove all Stuxnet related files found.";

if(description)
{
 script_id(100815);
 script_version("$Revision: 7332 $");
 script_tag(name:"last_modification", value:"$Date: 2017-09-29 16:16:56 +0200 (Fri, 29 Sep 2017) $");
 script_tag(name:"creation_date", value:"2010-09-20 15:31:27 +0200 (Mon, 20 Sep 2010)");
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_name("Stuxnet Detection");
 script_tag(name:"qod_type", value:"executable_version");
 script_category(ACT_GATHER_INFO);
 script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
 script_family("Windows");
 script_dependencies("secpod_reg_enum.nasl");
 script_mandatory_keys("SMB/Registry/Enumerated");
 script_require_ports(139, 445);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_xref(name : "URL" , value : "http://vil.nai.com/vil/Content/v_268468.htm");
 script_xref(name : "URL" , value : "http://www.stuxnet.net/");
 exit(0);
}

include("smb_nt.inc");
include("secpod_smb_func.inc");

if(!get_kb_item("SMB/WindowsVersion")){
   exit(0);
}

if ( get_kb_item("SMB/samba") ) exit(0);

rootfile = smb_get_systemroot();
if ( ! rootfile ) exit(0);

# http://vil.nai.com/vil/Content/v_268468.htm
# Filenames are hardcoded...
stux = make_list('system32\\s7otbxsx.dll',
		 'inf\\mdmcpq3.PNF',
		 'inf\\mdmeric3.PNF',
                 'inf\\oem6C.PNF',
		 'inf\\oem7A.PNF',
                 'system32\\drivers\\mrxcls.sys',
                 'system32\\drivers\\mrxnet.sys');


report = string("The following Stuxnet related files are detected on the remote Host:\n\n");

foreach file (stux) {

   my_file = string(rootfile, "\",file);

   file  = ereg_replace(pattern:"^[A-Za-z]:(.*)", replace:"\1", string:my_file); 
   share = ereg_replace(pattern:"([A-Z]):.*", replace:"\1$", string:my_file);

   myread = read_file(file:file, share:share, offset:0, count:8);

   if(myread) {
     stux_found = TRUE;
     report += string("*** Stuxnet releated file '", my_file, "' found.\n"); 
   } 
}

if(stux_found) {
  security_message(port:0,data:report);
  exit(0);
}  

exit(0);

##############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_bitdefender_pdf_parsing_dos_vuln_900180.nasl 5370 2017-02-20 15:24:26Z cfi $
# Description: BitDefender 'pdf.xmd' Module PDF Parsing Remote DoS Vulnerability
#
# Authors:
# Sharath S <sharaths@secpod.com>
#
# Copyright:
# Copyright (C) 2008 SecPod, http://www.secpod.com
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
##############################################################################

tag_summary = "This host is installed with BitDefender Internet Security and AntiVirus
  and is prone to denial of service vulnerability.

  The flaw is due to boundary error in 'pdf.xmd' module when parsing of
  data encoded using 'FlateDecode' and 'ASCIIHexDecode' filters. This can be
  exploited to cause a memory corruption during execution of 'bdc.exe'.";

tag_impact = "Successful exploitation will let the attacker execute arbitrary codes in the
  context of the application and can deny the service to the legitimate user.
  Impact Level: Application";
tag_affected = "BitDefender Internet Security and Antivirus version 10 and prior on Windows";
tag_solution = "Update to higher version
  http://www.bitdefender.com/site/Downloads/";

if(description)
{
  script_id(900180);
  script_version("$Revision: 5370 $");
  script_tag(name:"last_modification", value:"$Date: 2017-02-20 16:24:26 +0100 (Mon, 20 Feb 2017) $");
  script_tag(name:"creation_date", value:"2008-12-02 11:52:55 +0100 (Tue, 02 Dec 2008)");
  script_cve_id("CVE-2008-5409");
 script_bugtraq_id(32396);
  script_copyright("Copyright (C) 2008 SecPod");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"registry");
  script_family("Denial of Service");
  script_name("BitDefender 'pdf.xmd' Module PDF Parsing Remote DoS Vulnerability");
  script_xref(name : "URL" , value : "http://milw0rm.com/exploits/7178");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/32789");

  script_dependencies("secpod_reg_enum.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  script_require_ports(139, 445);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("smb_nt.inc");

if(!get_kb_item("SMB/WindowsVersion")){
  exit(0);
}

bitDef = "SOFTWARE\BitDefender\About\";
bitName = registry_get_sz(key:bitDef, item:"ProductName");
if(("BitDefender Internet Security" >< bitName) ||
   ("BitDefender Antivirus" >< bitName))
{
  bitVer = registry_get_sz(key:bitDef, item:"ProductVersion");
  # Check the versions 10 and prior
  if(egrep(pattern:"10(\..*)", string:bitVer)){
    security_message(0);
  }
}

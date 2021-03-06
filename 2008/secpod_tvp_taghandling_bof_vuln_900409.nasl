##############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_tvp_taghandling_bof_vuln_900409.nasl 5370 2017-02-20 15:24:26Z cfi $
# Description: Total Video Player 'TVP type' Tag Handling Remote BOF Vulnerability
#
# Authors:
# Sujit Ghosal <sghosal@secpod.com>
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

tag_impact = "Successful exploitation will let the attacker execute malicious
arbitrary codes and can cause denial of service.

Impact Level: Application";

tag_affected = "EffectMatrix Software, Total Video Player version 1.31
and prior on Windows.";

tag_insight = "The vulnerability is caused when the application parses a '.au'
file containing specially crafted 'TVP type' tags containing overly long strings.
These can be exploited by lack of bound checking in user supplied data before
copying it to an insufficiently sized memory buffer.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "This host is installed with Total Video Player and is prone to
remote Buffer Overflow vulnerability.";

if(description)
{
  script_id(900409);
  script_version("$Revision: 5370 $");
  script_tag(name:"last_modification", value:"$Date: 2017-02-20 16:24:26 +0100 (Mon, 20 Feb 2017) $");
  script_tag(name:"creation_date", value:"2008-12-10 17:58:14 +0100 (Wed, 10 Dec 2008)");
  script_bugtraq_id(32456);
  script_copyright("Copyright (C) 2008 SecPod");
  script_tag(name:"cvss_base", value:"8.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:C");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"registry");
  script_family("Denial of Service");
  script_name("Total Video Player 'TVP type' Tag Handling Remote BOF Vulnerability");

  script_xref(name : "URL" , value : "http://milw0rm.com/exploits/7219");
  script_xref(name : "URL" , value : "http://www.juniper.net/security/auto/vulnerabilities/vuln32456.html");

  script_dependencies("secpod_reg_enum.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  script_require_ports(139, 445);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


include("smb_nt.inc");
include("secpod_smb_func.inc");

if(!get_kb_item("SMB/WindowsVersion")){
  exit(0);
}

key = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\";
if(!registry_key_exists(key:key)) {
  exit(0);
}

keys = registry_enum_keys(key:key);
if(keys == NULL){
  exit(0);
}

foreach entries (keys)
{
  tvpName = registry_get_sz(key:key + entries, item:"DisplayName");
  pattern = "Player ([0]\..*|1\.([0-2]?[0-9]|3[01]))($|[^.0-9])";

  #Grep for version 1.31 or prior
  if("E.M. Total Video Player" >< tvpName &&
     egrep(pattern:pattern, string:tvpName)){
    security_message(0);
  }
}

##############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_chilkat_crypt_activex_cntl_vuln_900171.nasl 5042 2017-01-19 14:57:19Z cfi $
#
# Chilkat Crypt ActiveX Control 'ChilkatCrypt2.dll' File Overwrite Vulnerability
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900171");
  script_version("$Revision: 5042 $");
  script_tag(name:"last_modification", value:"$Date: 2017-01-19 15:57:19 +0100 (Thu, 19 Jan 2017) $");
  script_tag(name:"creation_date", value:"2008-11-11 15:58:44 +0100 (Tue, 11 Nov 2008)");
  script_cve_id("CVE-2008-5002");
  script_bugtraq_id(32073);
  script_copyright("Copyright (C) 2008 SecPod");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_name("Chilkat Crypt ActiveX Control 'ChilkatCrypt2.dll' File Overwrite Vulnerability");
  script_dependencies("secpod_reg_enum.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  script_require_ports(139, 445);

  script_xref(name:"URL", value:"http://milw0rm.com/exploits/6963");
  script_xref(name:"URL", value:"http://secunia.com/advisories/32513/");

  tag_impact = "Successful exploitation will allow execution of arbitrary code.

  Impact Level: Application";

  tag_affected = "Chilkat Crypt ActiveX Component version 4.3.2.1 and prior";

  tag_insight = "The vulnerability is due to the error in the 'ChilkatCrypt2.dll' ActiveX
  Control component that does not restrict access to the 'WriteFile()' method.";

  tag_solution = "No solution or patch was made available for at least one year
  since disclosure of this vulnerability. Likely none will be provided anymore.
  General solution options are to upgrade to a newer release, disable respective
  features, remove the product or replace the product by another one.

  A workaround is to  Set the kill-bit for the CLSID {3352B5B9-82E8-4FFD-9EB1-1A3E60056904}. ";

  tag_summary = "The host is installed Chilkat Crypt, which is prone to ActiveX
  Control based arbitrary file overwrite vulnerability.";

  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);
  script_tag(name:"insight", value:tag_insight);
  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);

  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"WillNotFix");

  exit(0);
}

include("smb_nt.inc");
include("secpod_smb_func.inc");

if(!get_kb_item("SMB/WindowsVersion")){
  exit(0);
}

key = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\";
enumKeys = registry_enum_keys(key:key);

foreach entry (enumKeys)
{
  if("Chilkat Crypt ActiveX" ><
     registry_get_sz(key: key + entry, item:"DisplayName"))
  {
    # Grep for version 4.3.2.1 and prior
    if(egrep(pattern:"^4\.([0-2](\..*)?|3(\.[0-2](\.[01])?)?)$",
             string:registry_get_sz(key: key + entry, item:"DisplayVersion")))
    {
      # Check if Kill-Bit is set for ActiveX control
      clsid = "{3352B5B9-82E8-4FFD-9EB1-1A3E60056904}";
      regKey = "SOFTWARE\Classes\CLSID\" + clsid;
      if(registry_key_exists(key:regKey))
      {
        activeKey = "SOFTWARE\Microsoft\Internet Explorer\" +
                    "ActiveX Compatibility\" + clsid;
        killBit = registry_get_dword(key:activeKey, item:"Compatibility Flags");
        if(killBit && (int(killBit) == 1024)){
          exit(0);
        }
        security_message(0);
      }
    }
    exit(0);
  }
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_office_infopath_ms13-035.nasl 5339 2017-02-18 16:28:22Z cfi $
#
# Microsoft InfoPath HTML Sanitisation Component XSS Vulnerability (2821818)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2013 SecPod, http://www.secpod.com
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

tag_impact = "Successful exploitation could allow an attacker to bypass certain security
  restrictions and conduct cross-site scripting and spoofing attacks.
  Impact Level: Application";

tag_affected = "Microsoft InfoPath 2010 Service Pack 1";
tag_insight = "Certain unspecified input is not properly sanitized within the HTML
  Sanitation component before being returned to the user. This can be
  exploited to execute arbitrary HTML and script code in a user's
  browser session in context of an affected site.";
tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://technet.microsoft.com/en-us/security/bulletin/ms13-035";
tag_summary = "This host is missing an important security update according to
  Microsoft Bulletin MS13-035.";

if(description)
{
  script_id(902960);
  script_version("$Revision: 5339 $");
  script_bugtraq_id(58883);
  script_cve_id("CVE-2013-1289");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-02-18 17:28:22 +0100 (Sat, 18 Feb 2017) $");
  script_tag(name:"creation_date", value:"2013-04-10 09:40:50 +0530 (Wed, 10 Apr 2013)");
  script_name("Microsoft InfoPath HTML Sanitisation Component XSS Vulnerability (2821818)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/52928/");
  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/2687422");
  script_xref(name : "URL" , value : "http://support.microsoft.com/kb/2760406");
  script_xref(name : "URL" , value : "http://technet.microsoft.com/en-us/security/bulletin/ms13-035");

  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"executable_version");
  script_copyright("Copyright (C) 2013 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");

  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Confirm Windows
if(!get_kb_item("SMB/WindowsVersion")){
  exit(0);
}

## Variables Initialization
key = "";
exeVer = "";
dllVer = "";
infoPath = "";

## InfoPath 2010
key = "SOFTWARE\Microsoft\Office\14.0\InfoPath\InstallRoot";
if(!registry_key_exists(key:key)){
  exit(0);
}

infoPath = registry_get_sz(key:key, item:"Path");
if(infoPath)
{
  exeVer = fetch_file_version(sysPath:infoPath, file_name:"Infopath.Exe");
  dllVer = fetch_file_version(sysPath:infoPath, file_name:"Ipeditor.dll");
  if((exeVer && version_in_range(version:exeVer, test_version:"14.0", test_version2:"14.0.6134.5003"))||
     (dllVer && version_in_range(version:dllVer, test_version:"14.0", test_version2:"14.0.6134.5003")))
  {
    security_message(0);
    exit(0);
  }
}

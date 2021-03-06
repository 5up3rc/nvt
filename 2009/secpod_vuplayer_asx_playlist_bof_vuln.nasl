###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_vuplayer_asx_playlist_bof_vuln.nasl 5148 2017-01-31 13:16:55Z teissa $
#
# VUPlayer .asx Playlist File Buffer Overflow Vulnerability
#
# Authors:
# Sharath S <sharaths@secpod.com>
#
# Copyright:
# Copyright (c) 2009 SecPod, http://www.secpod.com
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

tag_impact = "Attackers may leverage this issue by executing arbitrary code in the context
  of an affected application and can cause denial of service condition.
  Impact Level: Application";
tag_affected = "VUPlayer version 2.49 (2.4.9.0) and prior on Windows.";
tag_insight = "Certain .asx and .pls files fails to perform adequate boundary checks in
  HREF attribute of a REF element via long .asf file. This can also be
  exploited by a file composed entirely of 'A' characters.";
tag_solution = "No solution or patch was made available for at least one year since disclosure
  of this vulnerability. Likely none will be provided anymore. General solution
  options are to upgrade to a newer release, disable respective features,
  remove the product or replace the product by another one.
  For updates refer to http://www.vuplayer.com/vuplayer.php";
tag_summary = "This host is installed with VUPlayer and is prone to Buffer
  Overflow vulnerability.";

if(description)
{
  script_id(900193);
  script_version("$Revision: 5148 $");
  script_tag(name:"last_modification", value:"$Date: 2017-01-31 14:16:55 +0100 (Tue, 31 Jan 2017) $");
  script_tag(name:"creation_date", value:"2009-01-23 16:33:16 +0100 (Fri, 23 Jan 2009)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-0174", "CVE-2009-0181", "CVE-2009-0182");
  script_bugtraq_id(33185);
  script_name("VUPlayer .asx Playlist File Buffer Overflow Vulnerability");


  script_tag(name:"qod_type", value:"executable_version");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Denial of Service");
  script_dependencies("secpod_vuplayer_detect.nasl");
  script_require_keys("VUPlayer/Version");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"solution_type", value:"WillNotFix");
  script_xref(name : "URL" , value : "http://www.milw0rm.com/exploits/7709");
  script_xref(name : "URL" , value : "http://www.milw0rm.com/exploits/7713");
  script_xref(name : "URL" , value : "http://www.milw0rm.com/exploits/7714");
  script_xref(name : "URL" , value : "http://www.milw0rm.com/exploits/7715");
  script_xref(name : "URL" , value : "http://www.milw0rm.com/exploits/7695");
  exit(0);
}


include("version_func.inc");

vuplayerVer = get_kb_item("VUPlayer/Version");
if(!vuplayerVer){
  exit(0);
}

if(version_is_less_equal(version:vuplayerVer, test_version:"2.4.9.0")){
  security_message(0);
}

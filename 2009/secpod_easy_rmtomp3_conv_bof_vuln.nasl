###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_easy_rmtomp3_conv_bof_vuln.nasl 5055 2017-01-20 14:08:39Z teissa $
#
# Easy RM to MP3 Converter Buffer Overflow Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2009 SecPod http://www.secpod.com
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
##############################################################################

tag_impact = "Successful exploitation will let the attacker craft a malicious
playlist file and can cause denial of service in the context of the affected
system.
Impact Level: Application";

tag_affected = "Easy RM to MP3 Converter version 2.7.3.700 on Windows.";

tag_insight = "This flaw is due to improper boundary checking while the user
supplies the input to the application by opening any crafted playlist file.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "This host is installed with Easy RM to MP3 Converter and is
prone to Buffer Overflow Vulnerability.";

if(description)
{
  script_id(900633);
  script_version("$Revision: 5055 $");
  script_tag(name:"last_modification", value:"$Date: 2017-01-20 15:08:39 +0100 (Fri, 20 Jan 2017) $");
  script_tag(name:"creation_date", value:"2009-04-30 06:40:16 +0200 (Thu, 30 Apr 2009)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-1330");
  script_bugtraq_id(34514);
  script_name("Easy RM to MP3 Converter Buffer Overflow Vulnerability");
  script_xref(name : "URL" , value : "http://www.milw0rm.com/exploits/8427");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/34653");

  script_tag(name:"qod_type", value:"registry");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Denial of Service");
  script_dependencies("secpod_easy_rmtomp3_conv_detect.nasl");
  script_require_keys("EasyRmtoMp3/Conv/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


include("version_func.inc");

easyVer = get_kb_item("EasyRmtoMp3/Conv/Ver");
if(easyVer != NULL)
{
  if(version_is_less_equal(version:easyVer, test_version:"2.7.3.700")){
    security_message(0);
  }
}

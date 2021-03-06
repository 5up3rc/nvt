###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_novell_file_reporter_files_del_vuln_win.nasl 7052 2017-09-04 11:50:51Z teissa $
#
# Novell File Reporter 'SRS' Tag Arbitrary File Deletion Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation could allow remote attackers to delete
arbitrary files.

Impact Level: Application";

tag_affected = "Novell File Reporter (NFR) before 1.0.4.2";

tag_insight = "The flaw is due to an error in the NFR Agent (NFRAgent.exe)
when handling 'OPERATION'  and 'CMD' commands in the 'SRS' tag and can be
exploited to delete arbitrary files via a specially crafted SRS request
sent to TCP port 3073.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "This host is installed with Novell File Reporter and is prone to
arbitrary file deletion vulnerability.";

if(description)
{
  script_id(801960);
  script_version("$Revision: 7052 $");
  script_tag(name:"last_modification", value:"$Date: 2017-09-04 13:50:51 +0200 (Mon, 04 Sep 2017) $");
  script_tag(name:"creation_date", value:"2011-07-22 12:16:19 +0200 (Fri, 22 Jul 2011)");
  script_cve_id("CVE-2011-2750");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_name("Novell File Reporter 'SRS' Tag Arbitrary File Deletion Vulnerability");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/45071");
  script_xref(name : "URL" , value : "http://aluigi.org/adv/nfr_2-adv.txt");
  script_xref(name : "URL" , value : "http://www.securityfocus.com/archive/1/archive/1/518632/100/0/threaded");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 Greenbone Networks GmbH");
  script_family("Buffer overflow");
  script_dependencies("secpod_novell_prdts_detect_win.nasl");
  script_require_keys("Novell/FileReporter/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


include("version_func.inc");

## Get version from KB
nfrVer = get_kb_item("Novell/FileReporter/Ver");
if(nfrVer)
{
  ## Check for  Novell File Reporter version less than or equal 1.0.4.2
  if(version_is_less_equal(version:nfrVer, test_version:"1.0.400.2")){
    security_message(0);
  }
}

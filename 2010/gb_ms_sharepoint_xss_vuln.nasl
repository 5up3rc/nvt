###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_sharepoint_xss_vuln.nasl 5323 2017-02-17 08:49:23Z teissa $
#
# Microsoft SharePoint Cross Site Scripting Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will allow remote authenticated users to leverage
same-origin relationships and conduct cross-site scripting attacks by
uploading TXT files.

Impact Level: Application";

tag_affected = "Microsoft Office SharePoint Server 2007 12.0.0.6421 and prior.";
tag_insight = "This flaw is due to insufficient validation of user supplied data
  passed into 'SourceUrl' and 'Source' parameters in the 'download.aspx' in
  SharePoint Team Services.";
tag_solution = "Upgrade to SharePoint Server 2010 or later.
For updates refer to http://sharepoint.microsoft.com/Pages/Default.aspx";
tag_summary = "This host is running Microsoft SharePoint Server and is prone to
  Cross Site Scripting vulnerability.";

if(description)
{
  script_id(800481);
  script_version("$Revision: 5323 $");
  script_tag(name:"last_modification", value:"$Date: 2017-02-17 09:49:23 +0100 (Fri, 17 Feb 2017) $");
  script_tag(name:"creation_date", value:"2010-03-05 10:09:57 +0100 (Fri, 05 Mar 2010)");
  script_tag(name:"cvss_base", value:"3.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:P/A:N");
  script_cve_id("CVE-2010-0716");
  script_name("Microsoft SharePoint Cross Site Scripting Vulnerability");
  script_xref(name : "URL" , value : "http://www.hacktics.com/content/advisories/AdvMS20100222.html");
  script_xref(name : "URL" , value : "http://www.securityfocus.com/archive/1/archive/1/509683/100/0/threaded");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("Windows");
  script_dependencies("remote-detect-WindowsSharepointServices.nasl");
  script_require_keys("MicrosoftSharePointTeamServices/version");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("version_func.inc");

stsVer = get_kb_item("MicrosoftSharePointTeamServices/version");
if(isnull(stsVer)){
  exit(0);
}

if(version_in_range(version:stsVer, test_version:"12.0", test_version2:"12.0.0.6421")){
  security_message(0);
}

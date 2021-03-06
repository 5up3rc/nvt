###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_intel_amt_unspecified_priv_esc_vuln.nasl 7202 2017-09-20 12:47:53Z santu $
#
# Intel Active Management Technology Privilege Escalation Vulnerability
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = 'cpe:/h:intel:active_management_technology';

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811809");
  script_version("$Revision: 7202 $");
  script_cve_id("CVE-2017-5698");
  script_tag(name:"cvss_base", value:"5.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:M/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-09-20 14:47:53 +0200 (Wed, 20 Sep 2017) $");
  script_tag(name:"creation_date", value:"2017-09-12 19:05:54 +0530 (Tue, 12 Sep 2017)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Intel Active Management Technology Privilege Escalation Vulnerability");

  script_tag(name: "summary" , value:"This host is installed with Intel Active
  Management Technology and is prone to a privilege escalation vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight", value:"The flaw is due to an unspecified error in
  an unspecified function.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to conduct privilege escalation.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Intel Active Management Technology firmware 
  versions 11.0.25.3001 and 11.0.26.3000.");

  script_tag(name: "solution" , value:"Upgrade to firmware version 11.6.x.1xxx 
  or later. For updates refer to https://downloadcenter.intel.com");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value : "https://security-center.intel.com/advisory.aspx?intelid=INTEL-SA-00082&languageid=en-fr");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_intel_amt_webui_detect.nasl");
  script_mandatory_keys("intel_amt/installed");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

## Variable initialization
atmPort = 0;
atmVer = "";

## Get port
if(!atmPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get the version
if(!atmVer = get_app_version(cpe:CPE, port:atmPort)){
  exit(0);
}

if(atmVer == "11.0.25.3001" || atmVer == "11.0.26.3000")
{
  report = report_fixed_ver(installed_version:atmVer, fixed_version:"11.6.x.1xxx or later");
  security_message(data:report, port:atmPort);
  exit(0);
}
exit(0);

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_opera_mult_dos_vuln_june12_lin.nasl 6018 2017-04-24 09:02:24Z teissa $
#
# Opera Multiple Denial of Service Vulnerabilities - June12 (Linux)
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will let the attacker crash the browser leading to
  denial of service.
  Impact Level: Application";
tag_affected = "Opera version prior to 12.00 Beta on Linux";
tag_insight = "- A denial of service via crafted characters in domain names.
  - A denial of service (application crash) via crafted WebGL content.
  - A denial of service (memory consumption or application hang) via an
    IFRAME element that uses the src='#' syntax to embed a parent document.
  - A denial of service (application hang) via JavaScript code that changes
    a form before submission.
  - A denial of service (application hang) via an absolutely positioned
    wrap=off TEXTAREA element located next to an 'overflow: auto' block
    element.
  - A denial of service (application crash) via a web page that contains
    invalid character encodings.
  - A denial of service (application crash) via a crafted web page that is
    not properly handled during a reload.";
tag_solution = "Upgrade to Opera version 12.00 Beta or later,
  For updates refer to http://www.opera.com/";
tag_summary = "The host is installed with Opera and is prone to multiple
  denial of service vulnerabilities.";

if(description)
{
  script_id(802651);
  script_version("$Revision: 6018 $");
  script_cve_id("CVE-2012-3562", "CVE-2012-3563", "CVE-2012-3564", "CVE-2012-3565",
                "CVE-2012-3566", "CVE-2012-3567", "CVE-2012-3568");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-04-24 11:02:24 +0200 (Mon, 24 Apr 2017) $");
  script_tag(name:"creation_date", value:"2012-06-21 15:15:15 +0530 (Thu, 21 Jun 2012)");
  script_name("Opera Multiple Denial of Service Vulnerabilities - June12 (Linux)");
  script_xref(name : "URL" , value : "http://www.opera.com/docs/changelogs/windows/1200b/");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("secpod_opera_detection_linux_900037.nasl");
  script_require_keys("Opera/Linux/Version");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"executable_version");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}

include("version_func.inc");

operaVer = "";

## Get Opera version from KB
operaVer = get_kb_item("Opera/Linux/Version");
if(!operaVer){
  exit(0);
}

## Check for opera versions 11.65 and prior
if(version_is_less_equal(version:operaVer, test_version:"11.65")){
  security_message(0);
}

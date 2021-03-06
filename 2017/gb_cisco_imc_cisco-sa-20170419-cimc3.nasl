###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_imc_cisco-sa-20170419-cimc3.nasl 6054 2017-05-02 07:54:10Z teissa $
#
# Cisco Integrated Management Controller Arbitrary Code Execution Vulnerability 
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:cisco:integrated_management_controller";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.106774");
 script_cve_id("CVE-2017-6616");
 script_tag(name:"cvss_base", value:"9.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:C/I:C/A:C");
 script_version ("$Revision: 6054 $");

 script_name("Cisco Integrated Management Controller Arbitrary Code Execution Vulnerability");

 script_xref(name: "URL", value: "https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20170419-cimc3");

 script_tag(name: "summary", value: "A vulnerability in the web-based GUI of Cisco Integrated Management
Controller (IMC) could allow an authenticated, remote attacker to execute arbitrary code on an affected system.");

  script_tag(name: "insight", value: "The vulnerability exists because the affected software does not
sufficiently sanitize specific values that are received as part of a user-supplied HTTP request. An attacker
could exploit this vulnerability by sending a crafted HTTP request to the affected software.");

 script_tag(name: "impact", value: "A successful exploit could allow the attacker to execute arbitrary code with
the privileges of the user on the affected system.");

 script_tag(name: "vuldetect" , value:"Check the version");

 script_tag(name: "solution" , value:"See vendor advisory");

 script_tag(name:"solution_type", value: "VendorFix");
 script_tag(name:"qod_type", value:"remote_banner");

 script_tag(name: "last_modification", value: "$Date: 2017-05-02 09:54:10 +0200 (Tue, 02 May 2017) $");
 script_tag(name: "creation_date", value: "2017-04-20 09:20:08 +0200 (Thu, 20 Apr 2017)");

 script_category(ACT_GATHER_INFO);
 script_family("CISCO");
 script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
 script_dependencies("gb_cisco_imc_detect.nasl");
 script_mandatory_keys("cisco_imc/installed");
 exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!version = get_app_version(cpe:CPE))
  exit(0);

if (version == "3.0(1c)") {
  report = report_fixed_ver(installed_version: version, fixed_version: "See advisory");
  security_message(port: 0, data: report);
  exit(0);
}

exit(99);


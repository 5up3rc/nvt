###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_postgresql_sec_bypass_vuln_jul14_win.nasl 5933 2017-04-11 10:42:30Z cfi $
#
# PostgreSQL Multiple Security Bypass Vulnerability July14 (Windows)
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:postgresql:postgresql";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804710");
  script_version("$Revision: 5933 $");
  script_cve_id("CVE-2014-0060", "CVE-2014-0061", "CVE-2014-0062", "CVE-2014-0063",
                "CVE-2014-0064", "CVE-2014-0065", "CVE-2014-0066");
  script_bugtraq_id(65723, 65724, 65727, 65719, 65725, 65731, 65728);
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-04-11 12:42:30 +0200 (Tue, 11 Apr 2017) $");
  script_tag(name:"creation_date", value:"2014-07-07 14:54:12 +0530 (Mon, 07 Jul 2014)");
  script_name("PostgreSQL Multiple Security Bypass Vulnerability July14 (Windows)");

  tag_summary =
"This host is installed with PostgreSQL and is prone to multiple security bypass
vulnerabilities.";

  tag_vuldetect =
"Get the installed version with the help of detect NVT and check the version
is vulnerable or not.";

  tag_insight =
"Multiple flaws are due to,
- An error when handling roles can be exploited to revoke access from other
  role members.
- Multiple errors when handling calls to PL validator functions.
- Some errors when handling name lookups.
- Some boundary errors when handling wide datetime input/output.";

  tag_impact =
"Successful exploitation may allow an attacker to bypass certain security
restrictions, cause a DoS (Denial of Service), and potentially compromise
a vulnerable system.

Impact Level: System/Application";

  tag_affected =
"PostgreSQL version before 8.4.20, 9.0.x before 9.0.16, 9.1.x before 9.1.12,
9.2.x before 9.2.7, and 9.3.x before 9.3.3";

  tag_solution =
"Upgrade to version 9.3.3, 9.2.7, 9.1.12, 9.0.16 or 8.4.20, or higher,
For updates refer to http://www.postgresql.org/download";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/57054");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/91277");
  script_xref(name : "URL" , value : "http://wiki.postgresql.org/wiki/20140220securityrelease");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Databases");
  script_dependencies("postgresql_detect.nasl","os_detection.nasl");
  script_require_ports("Services/postgresql", 5432);
  script_mandatory_keys("PostgreSQL/installed","Host/runs_windows");
  exit(0);
}


include("misc_func.inc");
include("version_func.inc");
include("host_details.inc");

## Variable Initialization
pgsqlPort = "";
pgsqlVer = "";

## Exit if its not windows
if(host_runs("Windows") != "yes"){
  exit(0);
}

## Get the default port
pgsqlPort = get_app_port(cpe:CPE);
if(!pgsqlPort){
  pgsqlPort = 5432;
}

## Get the PostgreSQL version
pgsqlVer = get_app_version(cpe:CPE, port:pgsqlPort);
if(isnull(pgsqlVer) ||  !(pgsqlVer =~ "^((8\.4|9\.(0|1|2|3)))")){
  exit(0);
}

## Check for vulnerable PostgreSQL versions
if(version_in_range(version:pgsqlVer, test_version:"8.4", test_version2:"8.4.19") ||
   version_in_range(version:pgsqlVer, test_version:"9.0", test_version2:"9.0.15") ||
   version_in_range(version:pgsqlVer, test_version:"9.1", test_version2:"9.1.11") ||
   version_in_range(version:pgsqlVer, test_version:"9.2", test_version2:"9.2.6") ||
   version_in_range(version:pgsqlVer, test_version:"9.3", test_version2:"9.3.2"))
{
  security_message(port:pgsqlPort);
  exit(0);
}

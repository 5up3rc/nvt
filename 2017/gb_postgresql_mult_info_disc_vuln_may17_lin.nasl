###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_postgresql_mult_info_disc_vuln_may17_lin.nasl 6249 2017-05-30 13:27:41Z teissa $
#
# PostgreSQL Multiple Information Disclosure Vulnerabilities - May17 (Linux)
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

CPE = "cpe:/a:postgresql:postgresql";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810990");
  script_version("$Revision: 6249 $");
  script_cve_id("CVE-2017-7484", "CVE-2017-7486");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-05-30 15:27:41 +0200 (Tue, 30 May 2017) $");
  script_tag(name:"creation_date", value:"2017-05-15 16:07:12 +0530 (Mon, 15 May 2017)");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("PostgreSQL Multiple Information Disclosure Vulnerabilities - May17 (Linux)");

  script_tag(name:"summary", value:"This host is running PostgreSQL and is
  prone to multiple information disclosure vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help of
  detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"Multiple flaws are due to,

  - Some selectivity estimation functions did not check user privileges before 
    providing information from pg_statistic, possibly leaking information.

  - An error in 'pg_user_mappings' view.");

  script_tag(name:"impact", value:"Successful exploitation will allow an 
  unprivileged attacker to steal some information.

  Impact Level: Application");

  script_tag(name:"affected", value:"PostgreSQL version before 9.2.21, 9.3.x 
  before 9.3.17, 9.4.x before 9.4.12, 9.5.x before 9.5.7, and 9.6.x before 9.6.3 
  on Linux.");

  script_tag(name:"solution", value:"Upgrade to PostgreSQL version 9.2.21 or 
  9.3.17 or 9.4.12 or 9.5.7 or 9.6.3 or later.
  For updates refer to http://www.postgresql.org/download");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value : "https://www.postgresql.org/about/news/1746");
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Databases");
  script_dependencies("postgresql_detect.nasl","os_detection.nasl");
  script_mandatory_keys("PostgreSQL/installed","Host/runs_unixoide");
  script_require_ports("Services/postgresql", 5432);
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

## Variable Initialization
pgsqlPort = "";
pgsqlVer = "";
fix = "";

## Exit if its not Linux
if(host_runs("Linux") != "yes"){
  exit(0);
}

## Get the default port
pgsqlPort = get_app_port(cpe:CPE);
if(!pgsqlPort){
  exit(0);
}

## Get the PostgreSQL version
if(!pgsqlVer = get_app_version(cpe:CPE, port:pgsqlPort)){
  exit(0);
}

if(pgsqlVer =~ "^(9\.3)")
{
  if(version_is_less(version:pgsqlVer, test_version:"9.3.17")){
    fix = "9.3.17";
  }
}

else if(pgsqlVer =~ "^(9\.4)")
{
  if(version_is_less(version:pgsqlVer, test_version:"9.4.12")){
    fix = "9.4.12";
  }
}

else if(pgsqlVer =~ "^(9\.5)")
{
  if(version_is_less(version:pgsqlVer, test_version:"9.5.7")){
    fix = "9.5.7";
  }
}

else if(pgsqlVer =~ "^(9\.6)")
{
  if(version_is_less(version:pgsqlVer, test_version:"9.6.3")){
    fix = "9.6.3";
  }
}

else if(version_is_less(version:pgsqlVer, test_version:"9.2.21")){
  fix = "9.2.21";
}

if(fix)
{
  report = report_fixed_ver(installed_version:pgsqlVer, fixed_version:fix);
  security_message(data:report, port:pgsqlPort);
  exit(0);
}
exit(99);

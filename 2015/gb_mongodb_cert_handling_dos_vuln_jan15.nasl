###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mongodb_cert_handling_dos_vuln_jan15.nasl 5848 2017-04-04 07:21:55Z antu123 $
#
# MongoDB mongod Malformed X.509 Certificate Handling Remote DoS Vulnerability
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:mongodb:mongodb";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805118");
  script_version("$Revision: 5848 $");
  script_cve_id("CVE-2014-3971");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-04-04 09:21:55 +0200 (Tue, 04 Apr 2017) $");
  script_tag(name:"creation_date", value:"2015-01-02 16:11:38 +0530 (Fri, 02 Jan 2015)");
  script_name("MongoDB mongod Malformed X.509 Certificate Handling Remote DoS Vulnerability");

  script_tag(name: "summary" , value:"The host is installed with MongoDB
  and is prone to remote denial of service vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help of
  detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Flaw is due to improper handling of
  X.509 Certificate.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to cause a denial of service (application crash).

  Impact Level: Application");

  script_tag(name: "affected" , value:"MongoDB version 2.6.x before 2.6.2 on Windows");

  script_tag(name: "solution" , value:"Upgrade to MongoDB version 2.6.2 or later,
  For updates refer to http://www.mongodb.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://jira.mongodb.org/browse/SERVER-13753");
  script_xref(name : "URL" , value : "https://github.com/mongodb/mongo/commit/c151e0660b9736fe66b224f1129a16871165251b");

  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
  script_family("Databases");
  script_dependencies("gb_mongodb_detect.nasl", "os_detection.nasl");
  script_require_ports("Services/mongodb", 27017);
  script_mandatory_keys("mongodb/installed","Host/runs_windows");
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

## Variable initialisation
mbPort = "";
ver = "";

## windows
if(host_runs("Windows") != "yes"){
  exit(0);
}

## Get the app port
if(!mbPort = get_app_port(cpe:CPE)) exit(0);

## Get the app version
if(!ver = get_app_version(cpe:CPE, port:mbPort)) exit(0);

## check the version
if(ver =~ "(^2\.6)")
{
  if(version_is_less(version:ver, test_version:"2.6.2"))
  {
    report = report_fixed_ver(installed_version:ver, fixed_version:"2.6.2");
    security_message(data:report, port:mbPort);
    exit(0);
  }
}

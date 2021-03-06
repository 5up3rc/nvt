##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_openssl_mult_vuln_Nov16_lin.nasl 5083 2017-01-24 11:21:46Z cfi $
# OpenSSL Multiple Vulnerabilities -Nov 16 (Linux)
#
# Authors:
# Tameem Eissa <tameem.eissa..at..greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
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

tag_insight = "Multiple flaws are due to ,
1. TLS connections using *-CHACHA20-POLY1305 ciphersuites are susceptible to a DoS attack by corrupting  larger payloads. This can result in an OpenSSL crash..
2. Applications parsing invalid CMS structures can crash with a NULL pointer dereference. This is caused
 by a bug in the handling of the ASN.1 CHOICE type in OpenSSL 1.1.0 which can result in a NULL value being
 passed to the structure callback if an attempt is made to free certain invalid encodings. Only CHOICE structures
 using a callback which do not handle NULL value are affected.";

tag_impact = " Successful exploitation will allow remote attackers to cause a denial of service. " ;

tag_affected = " Openssl:1.1.0 versions prior to 1.1.0c " ;

tag_summary = " This host is running OpenSSL and is prone to multiple vulnerabilities."; 

tag_solution = "OpenSSL 1.1.0 users should upgrade to 1.1.0c. ";

CPE = "cpe:/a:openssl:openssl";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.107079");
  script_version("$Revision: 5083 $");
  script_cve_id("CVE-2016-7054", "CVE-2016-7053");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-01-24 12:21:46 +0100 (Tue, 24 Jan 2017) $");
  script_tag(name:"creation_date", value:"2016-11-11 11:19:11 +0100 (Fri, 11 Nov 2016)");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("OpenSSL Multiple Vulnerabilities -Nov 16 (Linux)");

  script_tag(name:"summary", value:"This host is running OpenSSL and is prone
  to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_xref(name : "URL" , value : "https://www.openssl.org/news/secadv/20161110.txt");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_openssl_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("OpenSSL/installed","Host/runs_unixoide");
  script_require_ports("Services/www", 80);
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

## Variable Initialization
sslVer = "";

## exit, if its windows
if(host_runs("Linux") != "yes")   exit(0);

## Get Version
if(!sslVer = get_app_version(cpe:CPE))
{
  exit(0);
}

## Checking for Vulnerable version

if(sslVer =~ "^(1\.1\.0)" && version_is_less(version:sslVer, test_version:"1.1.0c"))
{
  report = report_fixed_ver(installed_version:sslVer, fixed_version:"1.1.0c");
  security_message(data:report);
  exit(0);
}


